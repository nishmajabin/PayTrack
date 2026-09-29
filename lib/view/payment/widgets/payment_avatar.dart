import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_list_item.dart';

class PaymentAvatar extends StatelessWidget {
  const PaymentAvatar({required this.item, required this.isPaid, super.key});

  final PaymentListItem item;
  final bool isPaid;
  ImageProvider? get _imageProvider {
    if (item.avatarUrl != null) return NetworkImage(item.avatarUrl!);
    if (item.localAvatarPath != null) {
      return FileImage(File(item.localAvatarPath!));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isPaid ? AppColors.secondary : Colors.transparent,
              width: 2,
            ),
          ),
          child: CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.primaryLight,
            backgroundImage: _imageProvider,
            child: _imageProvider == null
                ? Text(
                    _initialsOf(item.name),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : null,
          ),
        ),
        if (isPaid)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 10, color: Colors.white),
            ),
          ),
      ],
    );
  }

  String _initialsOf(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    return parts.take(2).map((p) => p.isEmpty ? '' : p[0]).join().toUpperCase();
  }
}
