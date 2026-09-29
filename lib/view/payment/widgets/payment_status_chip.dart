
import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_status.dart';

class PaymentStatusChip extends StatelessWidget {
  const PaymentStatusChip({required this.status,super.key});

  final PaymentStatus status;

  @override
  Widget build(BuildContext context) {
    final isPaid = status == PaymentStatus.paid;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isPaid ? AppColors.paidBackground : AppColors.pendingBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: isPaid ? AppColors.paidText : AppColors.pendingText,
        ),
      ),
    );
  }
}
