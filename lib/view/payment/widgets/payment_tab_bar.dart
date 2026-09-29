import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/view_models/payment_view_model.dart';

class PaymentTabBar extends StatelessWidget {
  const PaymentTabBar({super.key, required this.viewModel});

  final PaymentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: AppColors.chipBackground, borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              _TabItem(
                label: 'All',
                count: viewModel.totalCount,
                isSelected: viewModel.selectedTab == PaymentTab.all,
                onTap: () => viewModel.selectTab(PaymentTab.all),
              ),
              _TabItem(
                label: 'Users',
                count: viewModel.apiUsers.length,
                isSelected: viewModel.selectedTab == PaymentTab.users,
                onTap: () => viewModel.selectTab(PaymentTab.users),
              ),
              _TabItem(
                label: 'Visitors',
                count: viewModel.visitors.length,
                isSelected: viewModel.selectedTab == PaymentTab.visitors,
                onTap: () => viewModel.selectTab(PaymentTab.visitors),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({required this.label, required this.count, required this.isSelected, required this.onTap});

  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 4, offset: const Offset(0, 1))]
                : null,
          ),
          child: Text(
            '$label $count',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}