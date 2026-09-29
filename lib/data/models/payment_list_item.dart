
import 'package:pay_track/data/models/payment_method.dart';
import 'package:pay_track/data/models/payment_status.dart';

class PaymentListItem {
  const PaymentListItem({
    required this.id,
    required this.name,
    required this.amount,
    required this.method,
    required this.status,
    required this.isVisitor,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final double amount;
  final PaymentMethod? method;
  final PaymentStatus status;
  final bool isVisitor;
  final String? avatarUrl;

  bool get isPaid => status == PaymentStatus.paid;
}