import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class CookingKnowledgeSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const CookingKnowledgeSection({
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1280),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 80),
                _buildFeaturesGrid(),
                const SizedBox(height: 48),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 768),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Tag
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Đánh giá',
                style: AppTextStyles.mediumSemiBold.copyWith(
                  color: const Color(0xFF040709),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Title
          Text(
            'Chia sẻ ý kiến về công thức nấu ăn',
            textAlign: TextAlign.center,
            style: AppTextStyles.h2.copyWith(
              color: const Color(0xFF040709),
            ),
          ),
          const SizedBox(height: 24),
          // Description
          Text(
            'Hãy cho chúng tôi biết cảm nhận của bạn về các công thức nấu ăn mà bạn đã thử. Đánh giá và nhận xét của bạn sẽ giúp cộng đồng yêu thích ẩm thực phát triển hơn.',
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumMedium.copyWith(
              color: const Color(0xFF040709),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturesGrid() {
    final features = [
      {
        'title': 'Cách để để lại nhận xét chi tiết',
        'description': 'Chỉ cần nhấp vào công thức và chia sẻ trải nghiệm của bạn.',
      },
      {
        'title': 'Tại sao đánh giá lại quan trọng?',
        'description': 'Đánh giá giúp người khác tìm kiếm công thức phù hợp hơn.',
      },
      {
        'title': 'Khám phá các công thức nổi bật',
        'description': 'Hãy xem những công thức được yêu thích nhất từ cộng đồng.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isNarrow ? 1 : 3,
            crossAxisSpacing: 48,
            mainAxisSpacing: 48,
            childAspectRatio: isNarrow ? 1.5 : 0.9,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) => _buildFeatureItem(
            title: features[index]['title']!,
            description: features[index]['description']!,
          ),
        );
      },
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Placeholder for icon
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        // Title
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.largeMedium.copyWith(
            color: const Color(0xFF040709),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        // Description
        Text(
          description,
          textAlign: TextAlign.center,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        // Send Button
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
        // View Button
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
