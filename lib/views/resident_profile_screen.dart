import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class ResidentProfileScreen extends StatelessWidget {
  const ResidentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary)),
            const Text('Resident - Block 12, Unit 4B', style: TextStyle(color: AppTheme.outline)),
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

            _buildActionItem('Edit Profile', Icons.edit),
            _buildActionItem('Family Members', Icons.group),
            _buildActionItem('Vehicles', Icons.directions_car),
            _buildActionItem('Settings', Icons.settings),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

