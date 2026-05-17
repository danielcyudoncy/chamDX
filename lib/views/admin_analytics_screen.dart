import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class AdminAnalyticsScreen extends StatelessWidget {
  const AdminAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Analytics Dashboard', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Financial & Traffic Analytics', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primary)),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: GlassCard(
                    child: Container(
                      height: 300,
                      alignment: Alignment.center,
                      child: const Text('Revenue Chart Placeholder', style: TextStyle(color: AppTheme.outline)),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 1,
                  child: GlassCard(
                    child: Container(
                      height: 300,
                      alignment: Alignment.center,
                      child: const Text('Visitor Traffic Pie Chart', style: TextStyle(color: AppTheme.outline)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            GlassCard(
              child: Container(
                height: 400,
                alignment: Alignment.center,
                child: const Text('Facility Utilization Heatmap', style: TextStyle(color: AppTheme.outline)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
