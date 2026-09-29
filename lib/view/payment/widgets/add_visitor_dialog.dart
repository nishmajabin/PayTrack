import 'package:flutter/material.dart';
import 'package:pay_track/view_models/payment_view_model.dart';

Future<void> showAddVisitorDialog(BuildContext context, PaymentViewModel viewModel) {
  final nameController = TextEditingController();

  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Add Visitor'),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Visitor name'),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final name = nameController.text.trim();
              if (name.isEmpty) return;
              viewModel.addVisitor(name);
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}