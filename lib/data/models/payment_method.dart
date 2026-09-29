enum PaymentMethod {
  cash,
  upi;

  String get label => switch (this) {
        PaymentMethod.cash => 'Cash',
        PaymentMethod.upi => 'UPI',
      };
}