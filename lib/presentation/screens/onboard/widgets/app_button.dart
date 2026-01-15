import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isDarkMode; // Add this parameter

  const AppButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isDarkMode = false, // Default to light mode
  });

  @override
  Widget build(BuildContext context) {
    // Use provided colors or default based on theme
    final btnColor = backgroundColor ?? AppColors.kAccentPink;
    final txtColor = textColor ?? AppColors.kWhite;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24.0,
                width: 24.0,
                child: CircularProgressIndicator(
                  color: AppColors.kWhite,
                  strokeWidth: 3,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: txtColor,
                ),
              ),
      ),
    );
  }
}
