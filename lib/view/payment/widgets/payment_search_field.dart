import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/view_models/payment_view_model.dart';


class PaymentSearchField extends StatelessWidget {
  const PaymentSearchField({super.key, required this.viewModel});

  final PaymentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: viewModel.updateSearchQuery,
      decoration: InputDecoration(
        hintText: 'search...',
        prefixIcon: const Icon(Icons.search, color: AppColors.textMuted),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
      ),
    );
  }
}