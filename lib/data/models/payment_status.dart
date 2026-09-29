enum PaymentStatus {
  pending,
  paid;

  String get label => switch (this) {
        PaymentStatus.pending => 'Pending',
        PaymentStatus.paid => 'Paid',
      };
}