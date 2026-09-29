import 'payment_method.dart';
import 'payment_status.dart';

class PaymentListItem {
  const PaymentListItem({
    required this.id,
    required this.name,
    required this.amount,
    required this.method,
    required this.status,
    required this.isVisitor,
    this.avatarUrl,
    this.localAvatarPath,
    this.displayId,
  });

  final String id;
  final String name;
  final double amount;
  final PaymentMethod? method;
  final PaymentStatus status;
  final bool isVisitor;
  final String? avatarUrl;
  final String? localAvatarPath;
  final String? displayId;

  bool get isPaid => status == PaymentStatus.paid;
}