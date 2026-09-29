import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_method.dart';

class PaymentMethodSelector extends StatelessWidget {
  const PaymentMethodSelector({
    super.key,
    required this.selected,
    required this.onChanged,
    this.filledStyle = true,
  });

  final PaymentMethod selected;
  final ValueChanged<PaymentMethod> onChanged;
  final bool filledStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: PaymentMethod.values.map((method) {
        final isSelected = method == selected;
        final icon = method == PaymentMethod.cash ? Icons.payments_outlined : Icons.qr_code_scanner;

        return Expanded(
          child: GestureDetector(
            onTap: () => onChanged(method),
            child: Container(
              margin: EdgeInsets.only(right: method == PaymentMethod.cash ? 8 : 0),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: filledStyle
                    ? (isSelected ? AppColors.primary : AppColors.chipBackground)
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: filledStyle
                    ? null
                    : Border.all(color: isSelected ? AppColors.primary : AppColors.border, width: 1.4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isSelected && filledStyle ? Icons.check_circle : icon,
                    size: 16,
                    color: filledStyle
                        ? (isSelected ? Colors.white : AppColors.textSecondary)
                        : (isSelected ? AppColors.primary : AppColors.textSecondary),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    method.label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: filledStyle
                          ? (isSelected ? Colors.white : AppColors.neutral)
                          : (isSelected ? AppColors.primary : AppColors.neutral),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}