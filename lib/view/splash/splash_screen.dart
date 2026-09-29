import 'package:flutter/material.dart';
import 'package:pay_track/core/constants/app_assets.dart';
import 'package:pay_track/core/constants/app_colors.dart';
import 'package:pay_track/core/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const Duration splashDuration = Duration(seconds: 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(child: _SplashBranding()),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: splashDuration,
                    onEnd: () {
                      if (!context.mounted) return;
                      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                    },
                    builder: (context, progress, _) {
                      return SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 3,
                          color: AppColors.primary,
                          backgroundColor: AppColors.primaryLight,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'v1.0',
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashBranding extends StatelessWidget {
  const _SplashBranding();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.logoShadow,
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Image.asset(AppAssets.logo, width: 72, height: 72),
          ),
          const SizedBox(height: 24),
          const Text(
            'PayTrack',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.neutral,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Simple Payment Management',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}