import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/glass_card.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF061447),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
        child: Stack(
          children: [
            // Ambient Background (gradient + blobs)
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF061447),
                    Color(0xFF030A27),
                    Color(0xFF010518),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF6CF8BB).withValues(alpha: 0.15),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -60,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.secondary.withValues(alpha: 0.15),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(color: Colors.transparent),
              ),
            ),

            // Main Content Layout
            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 800;

                  Widget forgotPasswordForm() {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 36.0,
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: GlassCard(
                            borderRadius: 24,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 32.0,
                            ),
                            opacity: 0.1,
                            blur: 15,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Title
                                Text(
                                  'chamDX',
                                  style: Theme.of(context).textTheme.headlineMedium
                                      ?.copyWith(
                                        color: const Color(0xFF6CF8BB),
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Reset Password',
                                  style: Theme.of(context).textTheme.headlineLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Enter your registered email address and we will send you a password reset link.',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white70),
                                ),
                                const SizedBox(height: 32),

                                // Email Input
                                CustomInput(
                                  label: 'Email Address',
                                  hint: 'name@example.com',
                                  isDark: true,
                                  controller: emailController,
                                ),
                                const SizedBox(height: 32),

                                // Action Button
                                Obx(
                                  () => PremiumButton(
                                    text: 'Send Reset Link',
                                    isNeon: true,
                                    isLoading: authController.isLoading.value,
                                    onPressed: () {
                                      if (emailController.text.isNotEmpty && emailController.text.contains('@')) {
                                        authController.sendPasswordResetEmail(emailController.text.trim());
                                      } else {
                                        Get.snackbar(
                                          'Error',
                                          'Please enter a valid email address',
                                          backgroundColor: Colors.red.withValues(alpha: 0.8),
                                          colorText: Colors.white,
                                        );
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(height: 32),

                                // Toggle/Back to Log in
                                Center(
                                  child: GestureDetector(
                                    onTap: () => Get.back(),
                                    child: const Text(
                                      'Back to Log In',
                                      style: TextStyle(
                                        color: Color(0xFF6CF8BB),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }

                  if (isDesktop) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF061447),
                                  Color(0xFF006C49),
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.lock_reset_rounded,
                                  size: 100,
                                  color: Color(0xFF6CF8BB),
                                ),
                                const SizedBox(height: 24),
                                const Text(
                                  'chamDX',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                                  child: Text(
                                    'Secure Password Recovery',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.8),
                                      fontSize: 24,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: forgotPasswordForm(),
                          ),
                        ),
                      ],
                    );
                  }

                  return forgotPasswordForm();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
