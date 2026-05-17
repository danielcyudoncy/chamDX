import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class CommunityFeedScreen extends StatelessWidget {
  const CommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Community Feed', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildPostCard('Estate Management', '2 hrs ago', 'Water Supply Interruption', 'Please be informed that there will be a temporary water supply interruption tomorrow from 10 AM to 2 PM for routine maintenance.', true),
          const SizedBox(height: 16),
          _buildPostCard('John Doe', '5 hrs ago', 'Lost Pet', 'Has anyone seen a golden retriever near Block A? He answers to the name Buster. Please DM if found.', false),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildPostCard(String author, String time, String title, String content, bool isOfficial) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: isOfficial ? AppTheme.primary : AppTheme.secondary,
                child: Icon(isOfficial ? Icons.admin_panel_settings : Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(author, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  Text(time, style: const TextStyle(fontSize: 12, color: AppTheme.outline)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.onSurface)),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(color: AppTheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
