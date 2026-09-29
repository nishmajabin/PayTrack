import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_list_item.dart';
import 'package:pay_track/data/models/payment_status.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key, required this.item, required this.onTap});

  final PaymentListItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border(
              left: BorderSide(
                color: item.isVisitor ? AppColors.primary : Colors.transparent,
                width: 3,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              _Avatar(item: item, isPaid: item.isPaid),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            item.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (item.isVisitor) ...[
                          const SizedBox(width: 6),
                          const _VisitorTag(),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          '₹${item.amount.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                          ),
                        ),
                        if (item.method != null) ...[
                          const SizedBox(width: 6),
                          _MethodTag(label: item.method!.label),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              _StatusChip(status: item.status),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.item, required this.isPaid});

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

class _VisitorTag extends StatelessWidget {
  const _VisitorTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'Visitor',
        style: TextStyle(fontSize: 10, color: AppColors.primary),
      ),
    );
  }
}

class _MethodTag extends StatelessWidget {
  const _MethodTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.chipBackground,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label, style: const TextStyle(fontSize: 10)),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

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
