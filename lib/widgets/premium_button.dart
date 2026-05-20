import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PremiumButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSecondary;
  final bool isError;
  final bool isLoading;
  final bool isNeon;

  const PremiumButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isSecondary = false,
    this.isError = false,
    this.isLoading = false,
    this.isNeon = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppTheme.primaryContainer;
    Color textColor = Colors.white;

    if (isSecondary) backgroundColor = AppTheme.secondary;
    if (isError) backgroundColor = AppTheme.error;
    if (isNeon) {
      backgroundColor = const Color(0xFF6CF8BB);
      textColor = const Color(0xFF061447);
    }

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isNeon ? 16.0 : 8.0),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: isNeon ? const Color(0xFF061447) : Colors.white,
                  strokeWidth: 2,
                ),
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
