import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/data/models/payment_list_item.dart';
import 'package:pay_track/view/payment/widgets/payment_avatar.dart';
import 'package:pay_track/view/payment/widgets/payment_method_tag.dart';
import 'package:pay_track/view/payment/widgets/payment_status_chip.dart';
import 'package:pay_track/view/payment/widgets/payment_visitor_tag.dart';

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
              PaymentAvatar(item: item, isPaid: item.isPaid),
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
                          const PaymentVisitorTag(),
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
                          PaymentMethodTag(label: item.method!.label),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              PaymentStatusChip(status: item.status),
              const SizedBox(width: 4),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
