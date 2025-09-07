import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class ShareRecipeSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const ShareRecipeSection({
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
        vertical: isWideScreen ? 112 : 80,
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: isWideScreen ? 80 : 0,
                    bottom: isWideScreen ? 0 : 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chia sẻ công thức nấu ăn độc đáo của bạn với cộng đồng ẩm thực',
                        style: AppTextStyles.h2.copyWith(
                          color: const Color(0xFF040709),
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Bạn có thể đăng công thức nấu ăn của mình và nhận phản hồi từ những người yêu thích ẩm thực khác. Hãy cùng nhau khám phá và sáng tạo những món ăn mới!',
                        style: AppTextStyles.mediumNormal.copyWith(
                          color: const Color(0xFF040709),
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Image
              Expanded(
                child: Container(
                  height: isWideScreen ? 600 : 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                      image: NetworkImage("https://placehold.co/600x640"),
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
