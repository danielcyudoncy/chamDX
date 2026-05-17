import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/premium_button.dart';
import '../widgets/custom_input.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final nameController = TextEditingController();
    final unitController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                          'Join chamDX Community',
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
                          'Create Account',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Enter your details to register for your estate.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.outline,
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        CustomInput(label: 'Full Name', hint: 'John Doe', controller: nameController),
                        const SizedBox(height: 16),
                        CustomInput(
                          label: 'Phone Number', 
                          hint: '080 0000 0000',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.flag, size: 20, color: AppTheme.primary),
                                const SizedBox(width: 4),
                                const Text('+234', style: TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                Container(height: 24, width: 1, color: AppTheme.outline),
                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomInput(label: 'Unit Number', hint: 'e.g. A-12', controller: unitController),
                        const SizedBox(height: 16),
                        CustomInput(label: 'Email Address', hint: 'name@example.com', controller: emailController),
                        const SizedBox(height: 16),
                        CustomInput(label: 'Password', hint: '••••••••', isPassword: true, controller: passwordController),
                        
                        const SizedBox(height: 32),
                        
                        Obx(() => PremiumButton(
                          text: 'Sign Up',
                          isLoading: authController.isLoading.value,
                          onPressed: () {
                            if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                              // Register user
                              authController.register(emailController.text, passwordController.text);
                            } else {
                              Get.snackbar('Error', 'Please fill in all required fields');
                            }
                          },
                        )),
                        
                        const SizedBox(height: 32),
                        
                        Center(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              const Text('Already have an account? ', style: TextStyle(color: AppTheme.outline)),
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: const Text('Log In', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
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
          }
        ),
      ),
    );
  }
}
