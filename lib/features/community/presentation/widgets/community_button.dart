import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CommunityButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const CommunityButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: borderColor != null
                ? Border.all(color: borderColor!, width: 2)
                : null,
          ),
          child: Text(
            text,
            style: AppTextStyles.mediumSemiBold.copyWith(
              color: textColor ?? const Color(0xFF040709),
            ),
          ),
        ),
      ),
    );
  }
}
