import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';

class PaymentVisitorTag extends StatelessWidget {
  const PaymentVisitorTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'Visitor',
        style: TextStyle(fontSize: 10, color: AppColors.primary),
      ),
    );
  }
}