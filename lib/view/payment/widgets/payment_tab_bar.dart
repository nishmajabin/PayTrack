import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/view/payment/widgets/payment_tab_item.dart';
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
              PaymentTabItem(
                label: 'All',
                count: viewModel.totalCount,
                isSelected: viewModel.selectedTab == PaymentTab.all,
                onTap: () => viewModel.selectTab(PaymentTab.all),
              ),
              PaymentTabItem(
                label: 'Users',
                count: viewModel.apiUsers.length,
                isSelected: viewModel.selectedTab == PaymentTab.users,
                onTap: () => viewModel.selectTab(PaymentTab.users),
              ),
              PaymentTabItem(
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

