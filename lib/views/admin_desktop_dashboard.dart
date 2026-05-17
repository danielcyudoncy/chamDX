import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AdminDesktopDashboard extends StatelessWidget {
  const AdminDesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Row(
        children: [
          Container(
            width: 250,
            color: AppTheme.primary,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text('chamDX Admin', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                _buildSidebarItem(Icons.dashboard, 'Dashboard', true),
                _buildSidebarItem(Icons.people, 'Residents', false),
                _buildSidebarItem(Icons.badge, 'Visitors', false),
                _buildSidebarItem(Icons.event_seat, 'Facilities', false),
                _buildSidebarItem(Icons.payments, 'Billing', false),
                _buildSidebarItem(Icons.campaign, 'Announcements', false),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Estate Overview', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(child: _buildStatCard('Total Residents', '1,245', Icons.group)),
                      const SizedBox(width: 24),
                      Expanded(child: _buildStatCard('Active Visitors', '42', Icons.directions_walk)),
                      const SizedBox(width: 24),
                      Expanded(child: _buildStatCard('Pending Bookings', '8', Icons.event)),
                      const SizedBox(width: 24),
                      Expanded(child: _buildStatCard('Open SOS', '0', Icons.warning, color: AppTheme.secondary)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Expanded(
                    child: GlassCard(
                      child: Center(child: Text('Recent Activity Log')),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, bool isActive) {
    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.white : Colors.white70),
      title: Text(title, style: TextStyle(color: isActive ? Colors.white : Colors.white70, fontWeight: isActive ? FontWeight.bold : FontWeight.normal)),
      tileColor: isActive ? Colors.white.withValues(alpha: 0.1) : null,
      onTap: () {},
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, {Color color = AppTheme.primary}) {
    return GlassCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: AppTheme.outline)),
              Icon(icon, color: color),
            ],
          ),
          const SizedBox(height: 16),
          Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}

