import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pay_track/view_models/user_list_view_model.dart';

class HomePlaceholderScreen extends StatelessWidget {
  const HomePlaceholderScreen({super.key, required this.viewModel});

  final UserListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PayTrack')),
      body: Center(
        child: Observer(
          builder: (_) {
            return switch (viewModel.status) {
              UsersStatus.loading => const CircularProgressIndicator(),
              UsersStatus.success =>
                Text('Loaded ${viewModel.users.length} users'),
              UsersStatus.error => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(viewModel.errorMessage),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: viewModel.loadUsers,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
            };
          },
        ),
      ),
    );
  }
}