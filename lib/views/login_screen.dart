import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/app_theme.dart';
import '../routes/app_routes.dart';
import '../widgets/premium_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/glass_card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

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
                  
                  Widget loginForm() {
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
                                  'Welcome Home',
                                  style: Theme.of(context).textTheme.headlineLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Log in or create an account to manage your home.',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.white70),
                                ),
                                const SizedBox(height: 32),

                                // Phone input
                                CustomInput(
                                  label: 'Phone Number',
                                  hint: '080 0000 0000',
                                  isDark: true,
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.flag_rounded,
                                          size: 20,
                                          color: Color(0xFF6CF8BB),
                                        ),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '+234',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Container(
                                          height: 24,
                                          width: 1,
                                          color: Colors.white24,
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Email Input
                                CustomInput(
                                  label: 'Email Address',
                                  hint: 'name@example.com',
                                  isDark: true,
                                  controller: authController.emailController,
                                ),
                                const SizedBox(height: 16),

                                // Password Input
                                CustomInput(
                                  label: 'Password',
                                  hint: '••••••••',
                                  isPassword: true,
                                  isDark: true,
                                  controller: authController.passwordController,
                                ),

                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Color(0xFF6CF8BB)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Submit Button
                                Obx(
                                  () => PremiumButton(
                                    text: 'Enter Dashboard',
                                    isNeon: true,
                                    isLoading: authController.isLoading.value,
                                    onPressed: () {
                                      if (authController
                                              .emailController
                                              .text
                                              .isNotEmpty &&
                                          authController
                                              .passwordController
                                              .text
                                              .isNotEmpty) {
                                        authController.login(
                                          authController.emailController.text,
                                          authController.passwordController.text,
                                        );
                                      } else {
                                        Get.snackbar(
                                          'Error',
                                          'Please enter email and password',
                                          backgroundColor: Colors.red.withValues(alpha: 0.8),
                                          colorText: Colors.white,
                                        );
                                      }
                                    },
                                  ),
                                ),

                                const SizedBox(height: 24),
                                Row(
                                  children: [
                                    const Expanded(child: Divider(color: Colors.white12)),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Text(
                                        'OR CONTINUE WITH',
                                        style: TextStyle(
                                          color: Colors.white.withValues(alpha: 0.4),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const Expanded(child: Divider(color: Colors.white12)),
                                  ],
                                ),
                                const SizedBox(height: 24),

                                // Social / Biometric Buttons
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          side: const BorderSide(color: Colors.white24),
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        icon: const Icon(Icons.g_mobiledata_rounded, size: 24),
                                        label: const Text('Google'),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: OutlinedButton.icon(
                                        onPressed: () {},
                                        style: OutlinedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          side: const BorderSide(color: Colors.white24),
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        icon: const Icon(Icons.fingerprint_rounded, size: 20),
                                        label: const Text('Biometric'),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 32),

                                // Signup Prompt
                                Center(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: Colors.white70,
                                          ),
                                      children: [
                                        const TextSpan(text: 'New to the estate? '),
                                        TextSpan(
                                          text: 'Join chamDX Community',
                                          style: const TextStyle(
                                            color: Color(0xFF6CF8BB),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.toNamed(AppRoutes.signup);
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 48),

                                // Footer Policy Links
                                Center(
                                  child: Column(
                                    children: [
                                      Wrap(
                                        spacing: 8,
                                        alignment: WrapAlignment.center,
                                        children: const [
                                          Text(
                                            'Privacy Policy',
                                            style: TextStyle(
                                              color: Colors.white30,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '•',
                                            style: TextStyle(
                                              color: Colors.white30,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Terms of Service',
                                            style: TextStyle(
                                              color: Colors.white30,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '•',
                                            style: TextStyle(
                                              color: Colors.white30,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Help Center',
                                            style: TextStyle(
                                              color: Colors.white30,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        '© 2026 chamDX Digital Management. All rights reserved.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white30,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
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
                                  Icons.home_work_rounded,
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
                                    'Digital Stewardship for African Estates',
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
                            child: loginForm(),
                          ),
                        ),
                      ],
                    );
                  }

                  return loginForm();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
