import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_track/view/payment/widgets/payment_method_selector.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/payment_list_item.dart';
import '../../../data/models/payment_method.dart';
import '../../../data/models/payment_status.dart';
import '../../../view_models/payment_view_model.dart';
import '../../../view_models/update_payment_form_view_model.dart';

class UpdatePaymentScreen extends StatelessWidget {
  UpdatePaymentScreen({super.key, required this.viewModel, required this.item})
      : _formViewModel = UpdatePaymentFormViewModel(
          initialMethod: item.method ?? PaymentMethod.cash,
          initialMarkAsPaid: item.isPaid,
        ),
        _amountController = TextEditingController(text: item.amount.toStringAsFixed(0));

  final PaymentViewModel viewModel;
  final PaymentListItem item;
  final UpdatePaymentFormViewModel _formViewModel;
  final TextEditingController _amountController;

  double get _defaultAmount => item.isVisitor ? 1000 : 2500;

  void _handleUpdate(BuildContext context) {
    final amount = double.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid amount.')),
      );
      return;
    }

    final status = _formViewModel.markAsPaid ? PaymentStatus.paid : PaymentStatus.pending;
    final method = _formViewModel.selectedMethod;

    if (item.isVisitor) {
      viewModel.updateVisitorPayment(item.id, amount: amount, method: method, status: status);
    } else {
      viewModel.updateUserPayment(item.id, amount: amount, method: method, status: status);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Update Payment'),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Enter the amount, choose a method, then tap Update Payment.')),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Observer(
                  builder: (_) => _AvatarPreview(item: item, isPaid: _formViewModel.markAsPaid),
                ),
                const SizedBox(height: 12),
                Text(item.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                if (item.displayId != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'User ID: #${item.displayId}',
                      style: const TextStyle(fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('PAYMENT AMOUNT',
                        style: TextStyle(fontSize: 11, letterSpacing: 0.5, color: AppColors.textMuted, fontWeight: FontWeight.w600)),
                    Text('INR', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(color: AppColors.chipBackground, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Text('₹', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                          decoration: const InputDecoration(border: InputBorder.none, isDense: true),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.cancel, color: AppColors.textMuted, size: 20),
                        onPressed: () => _amountController.clear(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.info_outline, size: 13, color: AppColors.textMuted),
                    const SizedBox(width: 4),
                    Text('Default amount: ₹${_defaultAmount.toStringAsFixed(0)}',
                        style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('PAYMENT METHOD',
                    style: TextStyle(fontSize: 11, letterSpacing: 0.5, color: AppColors.textMuted, fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Observer(
                  builder: (_) => PaymentMethodSelector(
                    selected: _formViewModel.selectedMethod,
                    onChanged: _formViewModel.selectMethod,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    final markAsPaid = _formViewModel.markAsPaid;
                    return Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: AppColors.paidBackground, shape: BoxShape.circle),
                          child: const Icon(Icons.check, size: 14, color: AppColors.secondary),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Mark as Paid', style: TextStyle(fontWeight: FontWeight.w600)),
                              Text(
                                markAsPaid ? 'Settlement completed' : 'Payment pending',
                                style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: markAsPaid,
                          activeThumbColor: AppColors.secondary,
                          onChanged: _formViewModel.setMarkAsPaid,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton.icon(
              icon: const Icon(Icons.check, size: 18),
              label: const Text('Update Payment'),
              onPressed: () => _handleUpdate(context),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text('Changes will be saved locally', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
          ),
        ],
      ),
    );
  }
}

class _AvatarPreview extends StatelessWidget {
  const _AvatarPreview({required this.item, required this.isPaid});

  final PaymentListItem item;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    ImageProvider? provider;
    if (item.avatarUrl != null) {
      provider = NetworkImage(item.avatarUrl!);
    } else if (item.localAvatarPath != null) {
      provider = FileImage(File(item.localAvatarPath!));
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isPaid ? AppColors.secondary : Colors.transparent, width: 3),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primaryLight,
            backgroundImage: provider,
            child: provider == null
                ? Text(_initials(item.name),
                    style: const TextStyle(fontSize: 22, color: AppColors.primary, fontWeight: FontWeight.w600))
                : null,
          ),
        ),
        if (isPaid)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
              child: const Icon(Icons.check, size: 14, color: Colors.white),
            ),
          ),
      ],
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    return parts.take(2).map((p) => p.isEmpty ? '' : p[0]).join().toUpperCase();
  }
}