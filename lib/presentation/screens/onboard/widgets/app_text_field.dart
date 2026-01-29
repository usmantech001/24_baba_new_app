import 'package:baba_24/utils/app_colors.dart';
import 'package:flutter/material.dart';

/// A styled text field widget for authentication screens.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hintText,
    required this.controller,
    this.isPassword = false,
    this.obscureText = false,
    this.onToggleVisibility,
    this.keyboardType = TextInputType.text,
    this.isDarkMode = false,
    this.decoration,
    this.readOnly = false,
    this.minLines,
    this.maxLines,
    this.prefixIcon,
    this.onSubmitted, // <-- ADD THIS
    this.onChanged,
  });

  final String? label;
  final String? hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool obscureText;
  final VoidCallback? onToggleVisibility;
  final TextInputType keyboardType;
  final bool isDarkMode;
  final InputDecoration? decoration;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final Widget? prefixIcon;

  final void Function(String)? onSubmitted; // <-- ADD THIS
  final void Function(String)? onChanged; // <-- Added onChanged

  @override
  Widget build(BuildContext context) {
    final labelColor = isDarkMode ? AppColors.kWhite : AppColors.kBlack;
    final textColor = isDarkMode ? AppColors.kWhite : AppColors.kBlack;
    final iconColor = isDarkMode
        ? AppColors.kWhite.withOpacity(0.7)
        : AppColors.kGrey;
    final backgroundColor = isDarkMode
        ? const Color(0xFF1E1E1E)
        : AppColors.kGrey.withOpacity(0.1);
    final borderColor = isDarkMode
        ? const Color(0xFF333333)
        : Colors.grey.withValues(alpha: .2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        if (label != null)
          Text(label!, style: TextStyle(color: labelColor, fontSize: 16)),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(color: textColor),
          readOnly: readOnly,
          cursorColor: AppColors.kAccentPink,
          minLines: minLines,
          maxLines: maxLines,
          onFieldSubmitted: onSubmitted, // <-- FORWARD HERE
          decoration:
              decoration ??
              InputDecoration(
                prefixIcon: prefixIcon,
                filled: true,
                fillColor: backgroundColor,
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.kAccentPink.withValues(alpha: .5),
                    width: 1,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: iconColor,
                          size: 18,
                        ),
                        onPressed: onToggleVisibility,
                      )
                    : null,
              ),
        ),
      ],
    );
  }
}
