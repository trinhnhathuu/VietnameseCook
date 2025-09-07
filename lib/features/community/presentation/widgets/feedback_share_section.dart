import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class FeedbackShareSection extends StatelessWidget {
  final bool isWideScreen;
  final double horizontalPadding;

  const FeedbackShareSection({
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 768),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cộng đồng',
                      style: AppTextStyles.mediumNormal.copyWith(
                        color: const Color(0xFF040709),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Chia sẻ công thức và nhận phản hồi',
                      style: AppTextStyles.h2.copyWith(
                        color: const Color(0xFF040709),
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Hãy tham gia cộng đồng nấu ăn của chúng tôi! Chia sẻ công thức độc đáo và nhận phản hồi từ những người yêu thích ẩm thực khác.',
                      style: AppTextStyles.mediumNormal.copyWith(
                        color: const Color(0xFF040709),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              
              // Features Grid
              _buildFeaturesGrid(),
              const SizedBox(height: 64),
              
              // Action Buttons
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturesGrid() {
    final features = [
      {
        'title': 'Khám phá công thức từ các thành viên',
        'description': 'Tìm kiếm và thử nghiệm những món ăn mới.',
      },
      {
        'title': 'Tham gia các thử thách nấu ăn hàng tuần',
        'description': 'Thể hiện tài năng nấu nướng của bạn và nhận giải thưởng.',
      },
      {
        'title': 'Nhận xét và đánh giá công thức',
        'description': 'Góp ý để cải thiện và phát triển công thức.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 3,
            crossAxisSpacing: 48,
            mainAxisSpacing: 40,
            childAspectRatio: isMobile ? 1.5 : 1,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon placeholder - replace with actual icon
        Container(
          width: 48,
          height: 48,
          margin: const EdgeInsets.only(bottom: 24),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Text(
          title,
          style: AppTextStyles.h3.copyWith(
            color: const Color(0xFF040709),
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: AppTextStyles.mediumNormal.copyWith(
            color: const Color(0xFF040709),
            height: 1.5,
          ),
          textAlign: TextAlign.center,
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
            side: const BorderSide(
              width: 2,
              color: Color(0xFF040709),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            'Gửi',
            style: AppTextStyles.mediumSemiBold.copyWith(
              color: const Color(0xFF040709),
            ),
          ),
        ),
        const SizedBox(width: 24),
        // View Button
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Row(
            children: [
              Text(
                'Xem',
                style: AppTextStyles.mediumSemiBold.copyWith(
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
