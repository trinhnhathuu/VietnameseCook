import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double maxWidth;
  final CrossAxisAlignment crossAxisAlignment;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.maxWidth = 768,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            style: AppTextStyles.h2.copyWith(
              color: const Color(0xFF040709),
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
            textAlign: crossAxisAlignment == CrossAxisAlignment.center 
                ? TextAlign.center 
                : TextAlign.start,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 24),
            Text(
              subtitle!,
              style: AppTextStyles.mediumNormal.copyWith(
                color: const Color(0xFF040709),
                height: 1.5,
              ),
              textAlign: crossAxisAlignment == CrossAxisAlignment.center 
                  ? TextAlign.center 
                  : TextAlign.start,
            ),
          ],
        ],
      ),
    );
  }
}
