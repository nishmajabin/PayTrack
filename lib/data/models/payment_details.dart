import 'payment_method.dart';
import 'payment_status.dart';

class PaymentDetails {
  const PaymentDetails({
    required this.amount,
    this.method,
    this.status = PaymentStatus.pending,
  });

  final double amount;
  final PaymentMethod? method;
  final PaymentStatus status;
}