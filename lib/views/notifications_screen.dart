import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildNotificationItem('Visitor Arrival', 'Maxwell Thorne has arrived at the Main Gate.', '10 mins ago', Icons.badge, AppTheme.secondary),
          const SizedBox(height: 12),
          _buildNotificationItem('Payment Successful', 'Your estate dues for October have been paid.', '2 hours ago', Icons.payments, Colors.orange),
          const SizedBox(height: 12),
          _buildNotificationItem('Facility Booking', 'Your Tennis Court booking is confirmed for tomorrow.', 'Yesterday', Icons.event_seat, AppTheme.primary),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String message, String time, IconData icon, Color iconColor) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withValues(alpha: 0.1),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primary)),
                    Text(time, style: const TextStyle(fontSize: 12, color: AppTheme.outline)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(message, style: const TextStyle(color: AppTheme.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

