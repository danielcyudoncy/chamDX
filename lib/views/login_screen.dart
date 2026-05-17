import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/app_theme.dart';
import '../routes/app_routes.dart';
import '../widgets/premium_button.dart';
import '../widgets/custom_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isDesktop = constraints.maxWidth > 800;
            return Row(
              children: [
                if (isDesktop)
                  Expanded(
                    child: Container(
                      color: AppTheme.primary,
                      child: const Center(
                        child: Text(
                          'Digital Stewardship for African Estates',
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                      ),
                    ),
                  ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 48.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'chamDX',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Welcome Home',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Log in or create an account to manage your home.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppTheme.outline),
                        ),
                        const SizedBox(height: 32),

                        CustomInput(
                          label: 'Phone Number',
                          hint: '080 0000 0000',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.flag,
                                  size: 20,
                                  color: AppTheme.primary,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '+234',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  height: 24,
                                  width: 1,
                                  color: AppTheme.outline,
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        CustomInput(
                          label: 'Email Address',
                          hint: 'name@example.com',
                          controller: authController.emailController,
                        ),
                        const SizedBox(height: 16),
                        CustomInput(
                          label: 'Password',
                          hint: '••••••••',
                          isPassword: true,
                          controller: authController.passwordController,
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 16),

                        Obx(
                          () => PremiumButton(
                            text: 'Enter Dashboard',
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
                                );
                              }
                            },
                          ),
                        ),

                        const SizedBox(height: 24),
                        const Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'OR CONTINUE WITH',
                                style: TextStyle(
                                  color: AppTheme.outline,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(child: Divider()),
                          ],
                        ),
                        const SizedBox(height: 24),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.g_mobiledata),
                                label: const Text('Google'),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.fingerprint),
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
                                    color: AppTheme.outline,
                                  ),
                              children: [
                                const TextSpan(text: 'New to the estate? '),
                                TextSpan(
                                  text: 'Join chamDX Community',
                                  style: const TextStyle(
                                    color: AppTheme.primary,
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
                                      color: AppTheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '•',
                                    style: TextStyle(
                                      color: AppTheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'Terms of Service',
                                    style: TextStyle(
                                      color: AppTheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '•',
                                    style: TextStyle(
                                      color: AppTheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'Help Center',
                                    style: TextStyle(
                                      color: AppTheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '© 2026 chamDX Digital Management. All rights reserved.',
                                style: TextStyle(
                                  color: AppTheme.outline,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
