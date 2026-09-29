import 'package:flutter/material.dart';
import 'package:pay_track/data/remote/user_remote_datasource.dart';
import 'package:pay_track/view_models/payment_view_model.dart';
import 'app.dart';
import 'data/repositories/user_repository.dart';

void main() {
  final userRepository = UserRepository(UserRemoteDataSource());
  final paymentViewModel = PaymentViewModel(userRepository);
  paymentViewModel.loadUsers();

  runApp(PayTrackApp(paymentViewModel: paymentViewModel));
}