import 'package:flutter/material.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'community_button.dart';

class HeroSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const HeroSection({
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
          child: Flex(
            direction: isWideScreen ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Text Content
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: isWideScreen ? 80 : 0,
                    bottom: isWideScreen ? 0 : 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'Tham gia cộng đồng nấu ăn Việt Nam',
                        style: AppTextStyles.h1.copyWith(
                          color: const Color(0xFF040709),
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          letterSpacing: -0.72,
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Description
                      Text(
                        'Cộng đồng VietnameseChef là nơi bạn có thể chia sẻ và khám phá những công thức nấu ăn độc đáo từ khắp nơi. Hãy kết nối với những người đam mê ẩm thực và cùng nhau nâng cao kỹ năng nấu nướng.',
                        style: AppTextStyles.mediumNormal.copyWith(
                          color: const Color(0xFF040709),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Buttons
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        children: [
                          CommunityButton(
                            text: 'Tham gia',
                            backgroundColor: const Color(0xFFFF6347),
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                          CommunityButton(
                            text: 'Khám phá',
                            backgroundColor: Colors.transparent,
                            borderColor: const Color(0xFF040709),
                            textColor: const Color(0xFF040709),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              // Image
              Flexible(
                flex: 1,
                child: Container(
                  height: isWideScreen ? 600 : 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                      image: NetworkImage("https://placehold.co/600x600"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
