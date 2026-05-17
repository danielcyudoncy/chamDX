import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class FacilityBookingScreen extends StatelessWidget {
  const FacilityBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Facility Booking', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Book an Amenity', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary)),
            const SizedBox(height: 24),
            
            _buildFacilityItem(
              context,
              'Tennis Court',
              'Available',
              Icons.sports_tennis,
              AppTheme.secondary,
            ),
            const SizedBox(height: 16),
            _buildFacilityItem(
              context,
              'Swimming Pool',
              'Partially Booked',
              Icons.pool,
              Colors.orange,
            ),
            const SizedBox(height: 16),
            _buildFacilityItem(
              context,
              'Clubhouse',
              'Fully Booked',
              Icons.house,
              AppTheme.error,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacilityItem(BuildContext context, String title, String status, IconData icon, Color statusColor) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primary, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                const SizedBox(height: 4),
                Text(status, style: TextStyle(fontSize: 14, color: statusColor, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.outline),
        ],
      ),
    );
  }
}

