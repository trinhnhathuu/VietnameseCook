import 'package:flutter/material.dart';
import 'section_header.dart';

class FeaturesSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const FeaturesSection({
    super.key,
    required this.isWideScreen,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isWideScreen ? 112 : 64,
      ),
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SectionHeader(
                title: 'Tính năng nổi bật',
                subtitle: 'Khám phá những tính năng giúp bạn kết nối và học hỏi từ cộng đồng nấu ăn lớn nhất Việt Nam',
              ),
              const SizedBox(height: 64),
              
              // Feature items will be added here
              // You can create a separate FeatureItem widget if needed
              
            ],
          ),
        ),
      ),
    );
  }
}
