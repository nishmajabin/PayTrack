import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/view_models/payment_view_model.dart';

Future<void> showClearDataDialog(BuildContext context, PaymentViewModel viewModel) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: AppColors.dangerBackground, shape: BoxShape.circle),
                child: const Icon(Icons.delete_outline, color: AppColors.danger, size: 26),
              ),
              const SizedBox(height: 16),
              const Text(
                'Clear All Data?',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              const Text(
                'This will reset all updated payments and remove all added visitors. This action cannot be undone.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.dangerInfoBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CHANGES WILL INCLUDE:',
                      style: TextStyle(fontSize: 10, letterSpacing: 0.5, fontWeight: FontWeight.w700, color: AppColors.textMuted),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.refresh, size: 14, color: AppColors.tertiary),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text('Reset all payment statuses to Pending', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.person_off_outlined, size: 14, color: AppColors.danger),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text('Remove all added visitor records', style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: AppColors.border),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('Cancel', style: TextStyle(color: AppColors.neutral)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.danger,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      icon: const Icon(Icons.delete_outline, size: 18),
                      label: const Text('Yes, Clear'),
                      onPressed: () {
                        viewModel.clearAllData();
                        Navigator.of(dialogContext).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}