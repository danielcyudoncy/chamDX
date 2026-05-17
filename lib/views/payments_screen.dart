import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('Payments & Billing', style: TextStyle(color: AppTheme.primary, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppTheme.primary),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            GlassCard(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text('OUTSTANDING BALANCE', style: TextStyle(color: AppTheme.outline, letterSpacing: 1.5)),
                  const SizedBox(height: 8),
                  const Text('â‚¦ 0.00', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Make a Payment'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Recent Transactions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.primary)),
            ),
            const SizedBox(height: 16),
            _buildTransactionTile('October Estate Dues', 'â‚¦ 50,000', 'Oct 1, 2026', true),
            _buildTransactionTile('Facility Booking - Tennis', 'â‚¦ 5,000', 'Sep 28, 2026', true),
            _buildTransactionTile('September Estate Dues', 'â‚¦ 50,000', 'Sep 1, 2026', true),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTile(String title, String amount, String date, bool isSuccess) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: isSuccess ? AppTheme.secondary.withValues(alpha: 0.1) : AppTheme.error.withValues(alpha: 0.1),
        child: Icon(isSuccess ? Icons.check : Icons.close, color: isSuccess ? AppTheme.secondary : AppTheme.error),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
      subtitle: Text(date, style: const TextStyle(color: AppTheme.outline)),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }
}

