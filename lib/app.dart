import 'package:flutter/material.dart';

import 'core/constants/app_colors.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes.dart';
import 'view_models/user_list_view_model.dart';

class PayTrackApp extends StatelessWidget {
  const PayTrackApp({super.key, required this.userListViewModel});

  final UserListViewModel userListViewModel;

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter(userListViewModel);

    return MaterialApp(
      title: 'PayTrack',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          tertiary: AppColors.tertiary,
          onSurface: AppColors.neutral,
        ),
      ),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}