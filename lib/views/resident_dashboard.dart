import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ResidentDashboard extends StatelessWidget {
  const ResidentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Resident Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => Get.toNamed(AppRoutes.notifications),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Get.toNamed(AppRoutes.residentProfile),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back, John!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your home at chamDX Estate is secure.',
              style: TextStyle(fontSize: 16, color: AppTheme.outline),
            ),
            const SizedBox(height: 24),
            
            // Quick Actions
            const Text('Quick Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildActionCard(
                  icon: Icons.qr_code,
                  title: 'Visitor Pass',
                  color: AppTheme.primary,
                  onTap: () => Get.toNamed(AppRoutes.visitorPass),
                ),
                _buildActionCard(
                  icon: Icons.event_seat,
                  title: 'Book Facility',
                  color: AppTheme.secondary,
                  onTap: () => Get.toNamed(AppRoutes.facilityBooking),
                ),
                _buildActionCard(
                  icon: Icons.payments,
                  title: 'Payments',
                  color: Colors.orange,
                  onTap: () => Get.toNamed(AppRoutes.payments),
                ),
                _buildActionCard(
                  icon: Icons.warning,
                  title: 'Emergency SOS',
                  color: AppTheme.error,
                  onTap: () => Get.toNamed(AppRoutes.emergencySos),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            // Recent Announcements
            const Text('Recent Announcements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),
            GlassCard(
              child: Row(
                children: [
                  const Icon(Icons.campaign, color: AppTheme.primary, size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Pool Maintenance', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                        Text('The main pool will be closed on Friday for scheduled cleaning.', style: TextStyle(color: AppTheme.outline)),
                      ],
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

  Widget _buildActionCard({required IconData icon, required String title, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

