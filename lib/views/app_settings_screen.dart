import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: ListView(
        children: [
          _buildSectionHeader('Preferences'),
          _buildSwitchTile('Push Notifications', true),
          _buildSwitchTile('Email Alerts', false),
          _buildSwitchTile('Dark Mode', false),
          
          _buildSectionHeader('Account'),
          _buildListTile('Change Password', Icons.lock),
          _buildListTile('Privacy Policy', Icons.privacy_tip),
          _buildListTile('Terms of Service', Icons.description),
          
          _buildSectionHeader('Danger Zone'),
          ListTile(
            leading: const Icon(Icons.logout, color: AppTheme.error),
            title: const Text('Log Out', style: TextStyle(color: AppTheme.error, fontWeight: FontWeight.bold)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary, fontSize: 16)),
    );
  }

  Widget _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      activeThumbColor: AppTheme.primary,
      onChanged: (bool v) {},
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.outline),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.outline),
      onTap: () {},
    );
  }
}

