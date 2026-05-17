import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_button.dart';
import '../widgets/custom_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    
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
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'chamDX',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.outline,
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        CustomInput(label: 'Email Address', hint: 'name@example.com', controller: authController.emailController),
                        const SizedBox(height: 16),
                        CustomInput(label: 'Password', hint: '••••••••', isPassword: true, controller: authController.passwordController),
                        
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password?'),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        Obx(() => PremiumButton(
                          text: 'Enter Dashboard',
                          isLoading: authController.isLoading.value,
                          onPressed: () {
                            if (authController.emailController.text.isNotEmpty && authController.passwordController.text.isNotEmpty) {
                              authController.login(authController.emailController.text, authController.passwordController.text);
                            } else {
                              Get.snackbar('Error', 'Please enter email and password');
                            }
                          },
                        )),
                        
                        const SizedBox(height: 24),
                        const Row(
                          children: [
                            Expanded(child: Divider()),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text('OR CONTINUE WITH', style: TextStyle(color: AppTheme.outline, fontSize: 12)),
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
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
