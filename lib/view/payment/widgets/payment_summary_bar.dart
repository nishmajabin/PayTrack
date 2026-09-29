import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/view/payment/widgets/payment_stat.dart';
import 'package:pay_track/view_models/payment_view_model.dart';


class PaymentSummaryBar extends StatelessWidget {
  const PaymentSummaryBar({super.key, required this.viewModel});

  final PaymentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.chipBackground,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PaymentStat(icon: Icons.groups_outlined, color: AppColors.primary, label: '${viewModel.totalCount} Total'),
              const Text('•', style: TextStyle(color: AppColors.textMuted)),
              PaymentStat(icon: Icons.check_circle, color: AppColors.secondary, label: 'Paid: ${viewModel.paidCount}'),
              const Text('•', style: TextStyle(color: AppColors.textMuted)),
              PaymentStat(icon: Icons.circle, color: AppColors.tertiary, label: 'Pending: ${viewModel.pendingCount}'),
            ],
          ),
        );
      },
    );
  }
}

