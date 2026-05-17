import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EstateChatsScreen extends StatelessWidget {
  const EstateChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Estate Chats', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: ListView(
        children: [
          _buildChatTile('Estate Management', 'Please remember to pay your dues.', '10:30 AM', true),
          const Divider(),
          _buildChatTile('Security Gate', 'Your visitor has arrived.', 'Yesterday', false),
          const Divider(),
          _buildChatTile('Residents Group', 'Anyone watching the game tonight?', 'Yesterday', false),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primary,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildChatTile(String name, String lastMessage, String time, bool isOfficial) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: isOfficial ? AppTheme.primary : AppTheme.secondary,
        child: Icon(isOfficial ? Icons.admin_panel_settings : Icons.group, color: Colors.white),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(lastMessage, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(time, style: const TextStyle(color: AppTheme.outline, fontSize: 12)),
      onTap: () {},
    );
  }
}
