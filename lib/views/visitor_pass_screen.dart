import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class VisitorPassScreen extends StatelessWidget {
  const VisitorPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Visitor Pass', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.check_circle, color: AppTheme.secondaryContainer, size: 64),
            const SizedBox(height: 16),
            const Text('Pass Generated', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primary)),
            const Text('Your visitor is authorized for entry.', style: TextStyle(color: AppTheme.outline)),
            const SizedBox(height: 32),

            GlassCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: AppTheme.primaryContainer,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ENTRY AUTHORIZATION', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1.2)),
                            Text('Visitor Pass', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Icon(Icons.security, color: Colors.white70, size: 32),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
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
                        const SizedBox(height: 24),
                        const Text('ACCESS CODE', style: TextStyle(color: AppTheme.outline, fontSize: 12, letterSpacing: 2)),
                        const Text('524-910', style: TextStyle(color: AppTheme.primary, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 4)),
                        const SizedBox(height: 24),
                        const Divider(height: 1, color: AppTheme.outline),
                        const SizedBox(height: 24),
                        
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildDetail('Visitor Name', 'Maxwell Thorne')),
                            Expanded(child: _buildDetail('Vehicle Plate', 'ZAB 4920 CC')),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildDetail('Visit Date', 'Oct 24, 2026')),
                            Expanded(child: _buildDetail('Arrival Time', '02:30 PM')),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: _buildDetail('Purpose', 'Property Maintenance - Electrician'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    color: AppTheme.surface.withValues(alpha: 0.5),
                    child: const Row(
                      children: [
                        Icon(Icons.lock, size: 16, color: AppTheme.secondary),
                        SizedBox(width: 8),
                        Text('Verified by chamDX Estate Security', style: TextStyle(fontSize: 12, color: AppTheme.outline)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share),
              label: const Text('Share Pass'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppTheme.primaryContainer,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Save to Gallery'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 10, color: AppTheme.outline, letterSpacing: 1)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.primary)),
      ],
    );
  }
}

