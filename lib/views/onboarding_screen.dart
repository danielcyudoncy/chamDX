import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(Icons.security, size: 100, color: AppTheme.primary),
              const SizedBox(height: 32),
              Text(
                'Secure. Exclusive. Seamless.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Experience premium gated community living with digital stewardship.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.outline,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PremiumButton(
                text: 'Get Started',
                onPressed: () => Get.offNamed(AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
