import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_input.dart';

class ResidentProfileScreen extends StatelessWidget {
  const ResidentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Profile & ID', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.primary,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Obx(() {
              final firestoreUser = authController.currentUserModel.value;
              final name = firestoreUser?.name ?? authController.firebaseUser.value?.displayName ?? 'Resident';
              final address = firestoreUser?.unitNumber ?? 'No address listed';
              return Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary),
                  ),
                  Text(
                    'Resident - $address',
                    style: const TextStyle(color: AppTheme.outline),
                  ),
                ],
              );
            }),
            const SizedBox(height: 32),
            
            GlassCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text('DIGITAL ID', style: TextStyle(color: AppTheme.outline, letterSpacing: 2)),
                  const SizedBox(height: 16),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.outline.withValues(alpha: 0.2)),
                    ),
                    child: const Icon(Icons.qr_code_2, size: 100, color: AppTheme.primary),
                  ),
                  const SizedBox(height: 16),
                  const Text('Scan at the gate for entry', style: TextStyle(color: AppTheme.primary)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            _buildActionItem(
              'Edit Profile',
              Icons.edit,
              onTap: () => _showEditProfileBottomSheet(context, authController),
            ),
            _buildActionItem('Family Members', Icons.group),
            _buildActionItem('Vehicles', Icons.directions_car),
            _buildActionItem('Settings', Icons.settings),
            const Divider(),
            _buildActionItem(
              'Log Out',
              Icons.logout,
              color: AppTheme.error,
              onTap: () => authController.logout(),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditProfileBottomSheet(BuildContext context, AuthController authController) {
    final firestoreUser = authController.currentUserModel.value;
    
    final name = firestoreUser?.name ?? authController.firebaseUser.value?.displayName ?? '';
    final phone = (firestoreUser?.phone ?? '').replaceAll('+234', '');
    final address = firestoreUser?.unitNumber ?? '';

    final nameController = TextEditingController(text: name);
    final phoneController = TextEditingController(text: phone);
    final addressController = TextEditingController(text: address);

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(24.0),
        decoration: const BoxDecoration(
          color: AppTheme.background,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Full Name',
                hint: 'Enter your full name',
                controller: nameController,
              ),
              const SizedBox(height: 16),
              CustomInput(
                label: 'Phone Number',
                hint: 'Phone Number Please',
                controller: phoneController,
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
                label: 'Residential Address',
                hint: 'e.g. Block 12, Unit 4B',
                controller: addressController,
              ),
              const SizedBox(height: 32),
              Obx(() => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  onPressed: authController.isLoading.value
                      ? null
                      : () {
                          if (nameController.text.isNotEmpty &&
                              phoneController.text.isNotEmpty &&
                              addressController.text.isNotEmpty) {
                            authController.updateProfile(
                              name: nameController.text.trim(),
                              phone: '+234${phoneController.text.trim()}',
                              address: addressController.text.trim(),
                            );
                          } else {
                            Get.snackbar('Error', 'Please fill in all fields', snackPosition: SnackPosition.BOTTOM);
                          }
                        },
                  child: authController.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Save Changes',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              )),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildActionItem(String title, IconData icon, {VoidCallback? onTap, Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppTheme.primary),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

