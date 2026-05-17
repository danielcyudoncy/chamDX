import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class EmergencySosScreen extends StatelessWidget {
  const EmergencySosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkSurface,
      appBar: AppBar(
        title: const Text('Emergency Center', style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.error),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Hold the button for 3 seconds to alert security', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 48),

            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: AppTheme.error,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.error.withValues(alpha: 0.5),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.emergency, color: Colors.white, size: 64),
                  SizedBox(height: 8),
                  Text('SOS', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 4)),
                ],
              ),
            ),
            const SizedBox(height: 48),

            Row(
              children: [
                Expanded(child: _buildCategoryCard('Security', Icons.local_police)),
                const SizedBox(width: 12),
                Expanded(child: _buildCategoryCard('Medical', Icons.medical_services)),
                const SizedBox(width: 12),
                Expanded(child: _buildCategoryCard('Fire', Icons.local_fire_department)),
              ],
            ),
            const SizedBox(height: 32),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Quick Contacts', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            _buildContactCard('Estate Security', 'Dispatch: +234 800 123 4567', Icons.admin_panel_settings, AppTheme.primaryContainer),
            const SizedBox(height: 12),
            _buildContactCard('Emergency Services', 'Central Dispatch: 911', Icons.emergency_share, AppTheme.error.withValues(alpha: 0.2)),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Column(
        children: [
          Icon(icon, color: AppTheme.error, size: 32),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildContactCard(String title, String subtitle, IconData icon, Color iconBgColor) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.call, color: AppTheme.secondary, size: 24),
        ],
      ),
    );
  }
}

