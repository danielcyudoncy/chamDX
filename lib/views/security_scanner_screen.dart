import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SecurityScannerScreen extends StatelessWidget {
  const SecurityScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Scan Pass', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.secondary, width: 2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Center(
                child: Text('Camera View', style: TextStyle(color: Colors.white54)),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Column(
              children: [
                const Text('Align QR code within the frame to scan', style: TextStyle(color: Colors.white)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppTheme.primaryContainer,
                  ),
                  child: const Text('Enter Code Manually', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
