import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ResidentDashboard extends StatelessWidget {
  const ResidentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            // Dark Gradient Background
            Positioned.fill(
              child: Container(
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
            ),
            // Glowing blur circles
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF6CF8BB).withValues(alpha: 0.12),
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
                  color: AppTheme.secondary.withValues(alpha: 0.12),
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(color: Colors.transparent),
              ),
            ),

            // Content
            SafeArea(
              child: Column(
                children: [
                  // Custom Glassmorphic AppBar
                  _buildAppBar(context),
                  
                  // Scrollable Body
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // User Greeting
                          Obx(() {
                            final firestoreUser = authController.currentUserModel.value;
                            final name = firestoreUser?.name ??
                                authController.firebaseUser.value?.displayName ??
                                'Resident';
                            return RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                                children: [
                                  const TextSpan(text: 'Welcome back,\n'),
                                  TextSpan(
                                    text: '$name!',
                                    style: const TextStyle(
                                      color: Color(0xFF6CF8BB),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 8),
                          Text(
                            'Your home at chamDX Estate is secure.',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                          const SizedBox(height: 32),

                          // Quick Actions Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Quick Actions',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF6CF8BB).withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '4 Services',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(0xFF6CF8BB),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 1.1,
                            children: [
                              _buildActionCard(
                                icon: Icons.qr_code_scanner_rounded,
                                title: 'Visitor Pass',
                                color: const Color(0xFF63B3ED),
                                onTap: () => Get.toNamed(AppRoutes.visitorPass),
                              ),
                              _buildActionCard(
                                icon: Icons.calendar_today_rounded,
                                title: 'Book Facility',
                                color: const Color(0xFF6CF8BB),
                                onTap: () => Get.toNamed(AppRoutes.facilityBooking),
                              ),
                              _buildActionCard(
                                icon: Icons.payments_rounded,
                                title: 'Payments',
                                color: const Color(0xFFF6AD55),
                                onTap: () => Get.toNamed(AppRoutes.payments),
                              ),
                              _buildActionCard(
                                icon: Icons.warning_amber_rounded,
                                title: 'Emergency SOS',
                                color: const Color(0xFFFC8181),
                                onTap: () => Get.toNamed(AppRoutes.emergencySos),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),

                          // Recent Announcements Section
                          Text(
                            'Recent Announcements',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GlassCard(
                            borderRadius: 18,
                            padding: const EdgeInsets.all(16),
                            opacity: 0.06,
                            blur: 15,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF6CF8BB).withValues(alpha: 0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.campaign_rounded,
                                    color: Color(0xFF6CF8BB),
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pool Maintenance',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'The main pool will be closed on Friday for scheduled cleaning.',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ],
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF6CF8BB).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.home_work_rounded,
                  color: Color(0xFF6CF8BB),
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'chamDX',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              _buildAppBarIconButton(
                icon: Icons.notifications_none_rounded,
                onTap: () => Get.toNamed(AppRoutes.notifications),
              ),
              const SizedBox(width: 12),
              _buildAppBarIconButton(
                icon: Icons.person_outline_rounded,
                onTap: () => Get.toNamed(AppRoutes.residentProfile),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarIconButton({required IconData icon, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white10),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 22),
        onPressed: onTap,
        constraints: const BoxConstraints(),
        padding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: color.withValues(alpha: 0.2),
          highlightColor: color.withValues(alpha: 0.1),
          child: GlassCard(
            borderRadius: 18,
            padding: const EdgeInsets.all(16),
            opacity: 0.06,
            blur: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.25),
                        blurRadius: 16,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Icon(icon, size: 36, color: color),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
