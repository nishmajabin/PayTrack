import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_track/view/payment/update_payment_screen.dart';

import '../../core/constants/app_colors.dart';
import '../../view_models/payment_view_model.dart';
import 'widgets/add_visitor_dialog.dart';
import 'widgets/payment_card.dart';
import 'widgets/payment_search_field.dart';
import 'widgets/payment_summary_bar.dart';
import 'widgets/payment_tab_bar.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.viewModel});

  final PaymentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Payments')),
      body: Observer(
        builder: (_) {
          if (viewModel.fetchStatus == UsersFetchStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.fetchStatus == UsersFetchStatus.error) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      viewModel.fetchErrorMessage,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: viewModel.loadUsers,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: PaymentSummaryBar(viewModel: viewModel),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PaymentTabBar(viewModel: viewModel),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: PaymentSearchField(viewModel: viewModel),
              ),
              Expanded(
                child: viewModel.visibleItems.isEmpty
                    ? const Center(child: Text('No results'))
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 88),
                        itemCount: viewModel.visibleItems.length,
                        itemBuilder: (context, index) {
                          final item = viewModel.visibleItems[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: PaymentCard(
                              item: item,
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => UpdatePaymentScreen(
                                    viewModel: viewModel,
                                    item: item,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddVisitorDialog(context, viewModel),
        child: const Icon(Icons.add),
      ),
    );
  }
}
