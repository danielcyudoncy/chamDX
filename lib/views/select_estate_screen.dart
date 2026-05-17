import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class SelectEstateScreen extends StatelessWidget {
  const SelectEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Select Your Estate', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                hintText: 'Search for your estate...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildEstateCard('Victoria Crest Estate', 'Lekki Phase 1', context),
                  const SizedBox(height: 16),
                  _buildEstateCard('Bourdillon Court', 'Ikoyi', context),
                  const SizedBox(height: 16),
                  _buildEstateCard('1004 Estates', 'Victoria Island', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEstateCard(String name, String location, BuildContext context) {
    return InkWell(
      onTap: () => Get.offNamed(AppRoutes.residentDashboard),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppTheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.location_city, color: AppTheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppTheme.primary)),
                  Text(location, style: const TextStyle(color: AppTheme.outline)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: AppTheme.outline, size: 16),
          ],
        ),
      ),
    );
  }
}

