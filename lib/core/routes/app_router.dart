import 'package:flutter/material.dart';
import 'package:pay_track/view/payment/payment_screen.dart';
import 'package:pay_track/view/splash/splash_screen.dart';
import 'package:pay_track/view_models/payment_view_model.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter(this._paymentViewModel);

  final PaymentViewModel _paymentViewModel;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => PaymentScreen(viewModel: _paymentViewModel));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}