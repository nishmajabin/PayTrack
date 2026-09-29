import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_list_item.dart';

class AvatarPreview extends StatelessWidget {
  const AvatarPreview({required this.item, required this.isPaid, super.key});

  final PaymentListItem item;
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    ImageProvider? provider;
    if (item.avatarUrl != null) {
      provider = NetworkImage(item.avatarUrl!);
    } else if (item.localAvatarPath != null) {
      provider = FileImage(File(item.localAvatarPath!));
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isPaid ? AppColors.secondary : Colors.transparent, width: 3),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.primaryLight,
            backgroundImage: provider,
            child: provider == null
                ? Text(_initials(item.name),
                    style: const TextStyle(fontSize: 22, color: AppColors.primary, fontWeight: FontWeight.w600))
                : null,
          ),
        ),
        if (isPaid)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
              child: const Icon(Icons.check, size: 14, color: Colors.white),
            ),
          ),
      ],
    );
  }

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    return parts.take(2).map((p) => p.isEmpty ? '' : p[0]).join().toUpperCase();
  }
}