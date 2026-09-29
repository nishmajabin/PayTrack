import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';

class PaymentMethodTag extends StatelessWidget {
  const PaymentMethodTag({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }
}
