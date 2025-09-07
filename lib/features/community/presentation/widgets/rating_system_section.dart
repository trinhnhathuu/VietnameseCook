import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class RatingSystemSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const RatingSystemSection({
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
            // Image Section
            if (isWideScreen) ...[
              Expanded(
                child: Container(
                  height: 640,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(
                      image: NetworkImage("https://placehold.co/600x640"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 80),
            ],
            // Content Section
            Expanded(
              child: _buildContentSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        _buildHeaderSection(),
        const SizedBox(height: 32),
        // Features Grid
        _buildFeaturesGrid(),
        const SizedBox(height: 32),
        // Action Buttons
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đánh giá',
          style: AppTextStyles.mediumSemiBold.copyWith(
            color: const Color(0xFF040709),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Hệ thống đánh giá và nhận xét của chúng tôi',
          style: AppTextStyles.h2.copyWith(
            color: const Color(0xFF040709),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Chia sẻ trải nghiệm nấu ăn của bạn với cộng đồng. Đánh giá và nhận xét giúp cải thiện công thức và kết nối với những người yêu thích ẩm thực.',
          style: AppTextStyles.mediumMedium.copyWith(
            color: const Color(0xFF040709),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturesGrid() {
    final features = [
      {
        'title': 'Đánh giá người dùng',
        'description': 'Nhận xét từ cộng đồng giúp bạn chọn công thức tốt nhất.',
      },
      {
        'title': 'Chia sẻ công thức',
        'description': 'Gửi công thức của bạn và nhận phản hồi từ những người khác.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 600;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isNarrow ? 1 : 2,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: 2.5,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            return _buildFeatureItem(
              title: features[index]['title']!,
              description: features[index]['description']!,
            );
          },
        );
      },
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.largeMedium.copyWith(
            color: const Color(0xFF040709),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: AppTextStyles.regularLight.copyWith(
            color: const Color(0xFF040709),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            side: const BorderSide(
              width: 2,
              color: Color(0xFF040709),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            'Gửi',
            style: AppTextStyles.regularMedium.copyWith(
              color: const Color(0xFF040709),
            ),
          ),
        ),
        const SizedBox(width: 24),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                'Xem',
                style: AppTextStyles.regularMedium.copyWith(
                  color: const Color(0xFF040709),
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                size: 20,
                color: Color(0xFF040709),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
