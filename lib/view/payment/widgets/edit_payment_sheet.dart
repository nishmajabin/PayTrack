import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_list_item.dart';
import 'package:pay_track/data/models/payment_method.dart';
import 'package:pay_track/view_models/payment_view_model.dart';

Future<void> showEditPaymentSheet({
  required BuildContext context,
  required PaymentViewModel viewModel,
  required PaymentListItem item,
}) {
  final amountController = TextEditingController(text: item.amount.toStringAsFixed(0));
  PaymentMethod selectedMethod = item.method ?? PaymentMethod.cash;

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (sheetContext) {
      return StatefulBuilder(
        builder: (sheetContext, setSheetState) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount', prefixText: '₹'),
                ),
                const SizedBox(height: 16),
                Row(
                  children: PaymentMethod.values.map((method) {
                    final isSelected = method == selectedMethod;
                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setSheetState(() => selectedMethod = method),
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary : AppColors.chipBackground,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            method.label,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: isSelected ? Colors.white : AppColors.neutral, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      final amount = double.tryParse(amountController.text);
                      if (amount == null || amount <= 0) return;

                      if (item.isVisitor) {
                        viewModel.updateVisitorPayment(item.id, amount: amount, method: selectedMethod);
                      } else {
                        viewModel.updateUserPayment(item.id, amount: amount, method: selectedMethod);
                      }

                      Navigator.of(sheetContext).pop();
                    },
                    child: const Text('Update Payment'),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      );
    },
  );
}