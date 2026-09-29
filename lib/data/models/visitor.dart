import 'payment_method.dart';
import 'payment_status.dart';

class Visitor {
  const Visitor({
    required this.id,
    required this.name,
    required this.amount,
    this.method,
    this.status = PaymentStatus.pending,
    this.photoPath,
  });

  final String id;
  final String name;
  final double amount;
  final PaymentMethod? method;
  final PaymentStatus status;
  final String? photoPath;

  Visitor copyWith({double? amount, PaymentMethod? method, PaymentStatus? status}) {
    return Visitor(
      id: id,
      name: name,
      amount: amount ?? this.amount,
      method: method ?? this.method,
      status: status ?? this.status,
      photoPath: photoPath,
    );
  }
}