import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class FeaturedIntro extends StatelessWidget {
  final String title;
  final String subtitle;

  const FeaturedIntro({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.h1,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.mediumNormal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}