import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PremiumButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;
  final bool isError;
  final bool isLoading;

  const PremiumButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.isError = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppTheme.primaryContainer;
    if (isSecondary) backgroundColor = AppTheme.secondary;
    if (isError) backgroundColor = AppTheme.error;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
      ),
    );
  }
}
