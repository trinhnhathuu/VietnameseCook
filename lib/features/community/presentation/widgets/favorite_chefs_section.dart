import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class FavoriteChefsSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const FavoriteChefsSection({
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
        vertical: 112,
      ),
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _buildContentSection(),
            ),
            if (isWideScreen) 
              Expanded(
                child: _buildImageSection(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon placeholder
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Title and description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theo dõi đầu bếp yêu thích và khám phá công thức mới mỗi ngày',
              style: AppTextStyles.h2.copyWith(
                color: const Color(0xFF040709),
                fontSize: 44,
                height: 1.2,
                letterSpacing: -0.44,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Tham gia cộng đồng nấu ăn sôi động, nơi bạn có thể theo dõi các đầu bếp và blogger ẩm thực. Nhận thông báo về các công thức mới, thử thách nấu ăn và chia sẻ trải nghiệm của bạn với những người đam mê ẩm thực khác.',
              style: AppTextStyles.mediumNormal.copyWith(
                color: const Color(0xFF040709),
                height: 1.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return Container(
      height: 640,
      margin: const EdgeInsets.only(left: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: NetworkImage("https://placehold.co/600x640"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
