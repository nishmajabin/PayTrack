import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/core/constants/payment_constants.dart';
import 'package:pay_track/view_models/add_visitor_form_view_model.dart';
import 'package:pay_track/view_models/payment_view_model.dart';
import 'payment_method_selector.dart';

Future<void> showAddVisitorDialog(BuildContext context, PaymentViewModel viewModel) {
  return showDialog<void>(
    context: context,
    builder: (_) => _AddVisitorDialog(viewModel: viewModel),
  );
}

class _AddVisitorDialog extends StatelessWidget {
  _AddVisitorDialog({required this.viewModel});

  final PaymentViewModel viewModel;
  final AddVisitorFormViewModel _formViewModel = AddVisitorFormViewModel();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController =
      TextEditingController(text: PaymentConstants.defaultVisitorAmount.toStringAsFixed(0));
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickPhoto() async {
    final image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (image != null) _formViewModel.setPhoto(image.path);
  }

  void _submit(BuildContext context) {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final amount = double.tryParse(_amountController.text.trim()) ?? PaymentConstants.defaultVisitorAmount;

    viewModel.addVisitor(
      name,
      amount: amount,
      method: _formViewModel.selectedMethod,
      photoPath: _formViewModel.photoPath,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.person_add_alt_1, color: AppColors.primary, size: 20),
                  ),
                  const SizedBox(width: 10),
                  const Text('Add Visitor', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter visitor details to record their payment entry.',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 16),
              Center(
                child: Observer(
                  builder: (_) {
                    final photoPath = _formViewModel.photoPath;
                    return GestureDetector(
                      onTap: _pickPhoto,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 32,
                            backgroundColor: AppColors.chipBackground,
                            backgroundImage: photoPath != null ? FileImage(File(photoPath)) : null,
                            child: photoPath == null
                                ? const Icon(Icons.person_outline, color: AppColors.textMuted, size: 28)
                                : null,
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                              child: const Icon(Icons.camera_alt, size: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text('Add photo (optional)', style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
              ),
              const SizedBox(height: 16),
              const Text('Visitor Name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              TextField(
                controller: _nameController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'e.g. Ramesh Kumar',
                  filled: true,
                  fillColor: AppColors.chipBackground,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Payment Amount', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  Text(
                    'Default: ₹${PaymentConstants.defaultVisitorAmount.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  filled: true,
                  fillColor: AppColors.chipBackground,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 14),
              const Text('Payment Method', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              Observer(
                builder: (_) => PaymentMethodSelector(
                  selected: _formViewModel.selectedMethod,
                  filledStyle: false,
                  onChanged: _formViewModel.selectMethod,
                ),
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, size: 14, color: AppColors.primary),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'New visitor appears instantly on the PayTrack ledger with receipt generated.',
                        style: TextStyle(fontSize: 11, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(onPressed: () => _submit(context), child: const Text('Add Visitor')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}