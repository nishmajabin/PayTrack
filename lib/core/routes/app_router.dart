import 'package:flutter/material.dart';
import 'package:pay_track/view/home_place_holder_screen.dart';
import 'package:pay_track/view/splash/splash_screen.dart';
import 'package:pay_track/view_models/user_list_view_model.dart';
import 'app_routes.dart';

class AppRouter {
  const AppRouter(this._userListViewModel);

  final UserListViewModel _userListViewModel;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => HomePlaceholderScreen(viewModel: _userListViewModel),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}