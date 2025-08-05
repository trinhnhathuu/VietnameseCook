// Trang nội dung chính của Home
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/theme/app_text_styles.dart';

class HomeContentPage extends StatelessWidget {
  const HomeContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl * 2),

      child: SingleChildScrollView(
        child: Column(
          spacing: 112,
          children: [
            SizedBox(
              height: 900,
              child: Row(
                spacing: 50,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Khám phá ẩm thực Việt Nam cùng VietnameseChef',
                          style: AppTextStyles.h1,
                        ),
                        Text(
                          'Chúng tôi mang đến cho bạn trải nghiệm nấu ăn thông minh, từ việc lập kế hoạch bữa ăn đến thực hiện món ăn. Hãy cùng khám phá các công thức nấu ăn phong phú và dễ dàng với VietnameseChef.',
                          style: AppTextStyles.mediumNormal,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          spacing: 24,
                          children: [
                            // button
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.primary,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Tìm hiểu',
                                  style: AppTextStyles.regularMedium.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Colors.black),
                                  minimumSize: const Size(100, 50),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {},
                                child: Text('Tìm hiểu', style: AppTextStyles.regularMedium),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      spacing: 16,
                      children: [
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              separatorBuilder: (context, index) => const SizedBox(height: 16),
                              itemBuilder: (context, index) {
                                return Transform.translate(
                                  offset: const Offset(0, -100),
                                  child: Center(
                                    // Căn giữa container
                                    child: SizedBox(
                                      width: 331,
                                      height: 331,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(32),
                                        child: Image.network(
                                          'https://images.pexels.com/photos/11741320/pexels-photo-11741320.jpeg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              separatorBuilder: (context, index) => const SizedBox(height: 16),
                              itemBuilder: (context, index) {
                                return Center(
                                  // Căn giữa container
                                  child: SizedBox(
                                    width: 331,
                                    height: 331,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Image.network(
                                        'https://images.pexels.com/photos/11741320/pexels-photo-11741320.jpeg',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 650,
              child: Row(
                spacing: 24,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Khám Phá', style: AppTextStyles.tagline),
                        Text('Khám Phá Công Thức Nấu Ăn Thông Minh', style: AppTextStyles.h2),
                        Text(
                          'Với công nghệ AI, bạn có thể khám phá hàng ngàn công thức nấu ăn phù hợp với nguyên liệu có sẵn. Hãy để chúng tôi giúp bạn tìm ra món ăn hoàn hảo cho bữa tối hôm nay!',
                          style: AppTextStyles.mediumNormal,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          spacing: 24,
                          children: [
                            // button
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 50),
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.primary,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Tìm hiểu',
                                  style: AppTextStyles.regularMedium.copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(color: Colors.black),
                                  minimumSize: const Size(100, 50),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: () {},
                                child: Text('Khám phá', style: AppTextStyles.regularMedium),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                        'https://images.pexels.com/photos/2097090/pexels-photo-2097090.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 650,
              child: Column(
                children: [
                  Row(
                    spacing: 80,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Khám phá công thức nấu ăn thông minh với nguyên liệu có sẵn',
                          style: AppTextStyles.h3,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Bạn có thể nhập nguyên liệu mà mình có để tìm kiếm công thức phù hợp. Bộ lọc theo khu vực và chế độ ăn uống giúp bạn dễ dàng chọn lựa món ăn yêu thích. Hãy để AI gợi ý cho bạn những món ăn tuyệt vời nhất!',
                          style: AppTextStyles.mediumNormal,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      spacing: 64,
                      children: [
                        Expanded(
                          child: _card1(
                            title: 'Lựa chọn món ăn theo khu vực và chế độ ăn uống',
                            description: 'Phù hợp với khẩu vị và nhu cầu dinh dưỡng của bạn.',
                            image:
                                'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg',
                            textAction: 'Tìm hiểu',
                          ),
                        ),
                        Expanded(
                          child: _card1(
                            title: 'Thực đơn ngẫu nhiên "Nấu gì hôm nay?" cho bạn',
                            description: 'Khám phá món ăn mới mỗi ngày với sự ngẫu nhiên thú vị.',
                            image:
                                'https://images.pexels.com/photos/3217156/pexels-photo-3217156.jpeg',
                            textAction: 'Khám phá',
                          ),
                        ),
                        Expanded(
                          child: _card1(
                            title: 'Tùy chọn chế độ ăn uống cho mọi nhu cầu',
                            description:
                                'Hỗ trợ chế độ ăn kiêng, thuần chay và nhiều lựa chọn khác. ',
                            image:
                                'https://images.pexels.com/photos/27101539/pexels-photo-27101539.jpeg',
                            textAction: 'Xem',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 926,
              child: Column(
                children: [
                  Row(
                    spacing: 80,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Trợ lý nhà bếp thông minh hỗ trợ bạn từng bước trong nấu ăn',
                          style: AppTextStyles.h3,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Trợ lý nhà bếp của chúng tôi giúp bạn quản lý thời gian và quy trình nấu ăn một cách hiệu quả. Với hệ thống hẹn giờ đa bước và hướng dẫn chi tiết, bạn sẽ không bao giờ bỏ lỡ một bước nào. Hãy để chúng tôi đồng hành cùng bạn trong mỗi bữa ăn, từ khâu chuẩn bị đến hoàn thiện món ăn.',
                          style: AppTextStyles.mediumNormal,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Image.network(
                        'https://images.pexels.com/photos/4253303/pexels-photo-4253303.jpeg',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _lapKeHoach(),
            _chiaSeCongThuc(),
          ],
        ),
      ),
    );
  }
}

Widget _card1({
  required String title,
  required String description,
  required String image,
  required String textAction,
}) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 32,
      children: [
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            ),
          ),
        ),
        SizedBox(child: Text(title, style: AppTextStyles.h5)),
        SizedBox(child: Text(description, style: AppTextStyles.regularNormal)),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: AppColors.primary),
          onPressed: () {},
          child: Text(textAction, textAlign: TextAlign.left, style: AppTextStyles.regularNormal),
        ),
      ],
    ),
  );
}

Widget _lapKeHoach() {
  return Container(
    width: 1440,
    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 112),
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(color: Color(0xFFFFDFDA)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 768,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 768),
                    child: Text(
                      'Lập kế hoạch bữa ăn hàng tuần dễ dàng và hiệu quả',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.h3,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _featureCard(
                                icon: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                title: 'Tạo danh sách mua sắm tự động từ các công thức đã chọn',
                                description:
                                    'Giúp bạn tổ chức bữa ăn hàng tuần mà không cần lo lắng.',
                                buttonText: 'Tìm hiểu',
                              ),
                            ),
                            const SizedBox(width: 48),
                            Expanded(
                              child: _featureCard(
                                icon: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.recycling, color: Colors.white, size: 24),
                                ),
                                title: 'Quản lý thức ăn thừa thông minh và tiết kiệm',
                                description:
                                    'Đưa ra giải pháp sáng tạo để sử dụng thức ăn thừa hiệu quả.',
                                buttonText: 'Khám phá',
                              ),
                            ),
                            const SizedBox(width: 48),
                            Expanded(
                              child: _featureCard(
                                icon: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.account_balance_wallet_outlined,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                title: 'Tối ưu hóa ngân sách cho bữa ăn hàng tuần của bạn',
                                description:
                                    'Theo dõi chi phí và điều chỉnh ngân sách dễ dàng với chúng tôi.',
                                buttonText: 'Bắt đầu',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _featureCard({
  required Widget icon,
  required String title,
  required String description,
  required String buttonText,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 394.67,
                    child: Text(title, textAlign: TextAlign.center, style: AppTextStyles.h5),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 394.67,
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regularNormal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(buttonText, style: AppTextStyles.regularMedium),
                  const SizedBox(width: 8),
                  Container(
                    width: 24,
                    height: 24,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: const Stack(), // Placeholder for arrow icon
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _chiaSeCongThuc() {
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(color: Colors.white),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Cộng đồng', textAlign: TextAlign.center, style: AppTextStyles.regularSemiBold),
            const SizedBox(height: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 768,
                  child: Text(
                    'Chia sẻ công thức nấu ăn độc đáo',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 768,
                  child: Text(
                    'Người dùng có thể đăng tải công thức nấu ăn của riêng mình, giúp tạo ra một kho tàng ẩm thực phong phú. Hãy cùng nhau khám phá và học hỏi từ những món ăn mà mọi người chia sẻ!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mediumNormal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _communityCard(
                    image: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
                    title: 'Hệ thống đánh giá và nhận xét',
                    description:
                        'Người dùng có thể đánh giá và nhận xét công thức để giúp cải thiện chất lượng.',
                    icon: _buildIcon(Icons.star_rate),
                  ),
                ),
                const SizedBox(width: 48),
                Expanded(
                  child: _communityCard(
                    image: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
                    title: 'Thử thách nấu ăn hàng tuần',
                    description:
                        'Tham gia các thử thách nấu ăn thú vị để thể hiện tài năng của bạn.',
                    icon: _buildIcon(Icons.emoji_events),
                  ),
                ),
                const SizedBox(width: 48),
                Expanded(
                  child: _communityCard(
                    image: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
                    title: 'Kết nối và giao lưu với các đầu bếp',
                    description:
                        'Tạo kết nối với các đầu bếp khác để học hỏi và chia sẻ kinh nghiệm.',
                    icon: _buildIcon(Icons.people),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _communityCard({
  required String image,
  required String title,
  required String description,
  required Widget icon,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: double.infinity,
        height: 234,
        decoration: ShapeDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: 395,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, textAlign: TextAlign.center, style: AppTextStyles.h4),
            const SizedBox(height: 24),
            Text(description, textAlign: TextAlign.center, style: AppTextStyles.regularNormal),
          ],
        ),
      ),
    ],
  );
}

Widget _buildIcon(IconData iconData) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
    child: Icon(iconData, color: Colors.white, size: 24),
  );
}

Widget _lienHeChungtoi() {
  return Container(
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(color: Color(0xFF665600) /* Color-Scheme-4-Background */),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 80,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 80,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 768),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Liên hệ',
                              style: TextStyle(
                                color: Colors.white /* Color-Scheme-4-Text */,
                                fontSize: 16,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                height: 1.50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 24,
                            children: [
                              SizedBox(
                                width: 768,
                                child: Text(
                                  'Liên hệ chúng tôi',
                                  style: TextStyle(
                                    color: Colors.white /* Color-Scheme-4-Text */,
                                    fontSize: 52,
                                    fontFamily: 'Roboto Condensed',
                                    fontWeight: FontWeight.w500,
                                    height: 1.20,
                                    letterSpacing: -0.52,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 768,
                                child: Text(
                                  'Chúng tôi luôn sẵn sàng hỗ trợ bạn.',
                                  style: TextStyle(
                                    color: Colors.white /* Color-Scheme-4-Text */,
                                    fontSize: 18,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 1.50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 80,
                    children: [
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 40,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 16,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Stack(),
                                    ),
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 8,
                                        children: [
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              'Email',
                                              style: TextStyle(
                                                color: Colors.white /* Color-Scheme-4-Text */,
                                                fontSize: 22,
                                                fontFamily: 'Roboto Condensed',
                                                fontWeight: FontWeight.w500,
                                                height: 1.40,
                                                letterSpacing: -0.22,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              'Hãy gửi email cho chúng tôi',
                                              style: TextStyle(
                                                color: Colors.white /* Color-Scheme-4-Text */,
                                                fontSize: 16,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                                height: 1.50,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              'info@vietnamesechef.com',
                                              style: TextStyle(
                                                color: Colors.white /* Color-Scheme-4-Text */,
                                                fontSize: 16,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                                textDecoration: TextDecoration.underline,
                                                height: 1.50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 16,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Stack(),
                                    ),
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 8,
                                        children: [
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              'Điện thoại',
                                              style: TextStyle(
                                                color: Colors.white /* Color-Scheme-4-Text */,
                                                fontSize: 22,
                                                fontFamily: 'Roboto Condensed',
                                                fontWeight: FontWeight.w500,
                                                height: 1.40,
                                                letterSpacing: -0.22,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              'Gọi cho chúng tôi ngay',
                                              style: TextStyle(
                                                color: Colors.white /* Color-Scheme-4-Text */,
                                                fontSize: 16,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                                height: 1.50,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 400,
                                            child: Text(
                                              '+84 (123) 456-7890',
                                              style: TextStyle(
                                                color: Colors.white /* Color-Scheme-4-Text */,
                                                fontSize: 16,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                                textDecoration: TextDecoration.underline,
                                                height: 1.50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing: 16,
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: const Stack(),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        spacing: 16,
                                        children: [
                                          const SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              spacing: 8,
                                              children: [
                                                SizedBox(
                                                  width: 400,
                                                  child: Text(
                                                    'Văn phòng',
                                                    style: TextStyle(
                                                      color: Colors.white /* Color-Scheme-4-Text */,
                                                      fontSize: 22,
                                                      fontFamily: 'Roboto Condensed',
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.40,
                                                      letterSpacing: -0.22,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 400,
                                                  child: Text(
                                                    '123 Đường Mẫu, Thành phố Hồ Chí Minh',
                                                    style: TextStyle(
                                                      color: Colors.white /* Color-Scheme-4-Text */,
                                                      fontSize: 16,
                                                      fontFamily: 'Lato',
                                                      fontWeight: FontWeight.w400,
                                                      height: 1.50,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            spacing: 16,
                                            children: [
                                              Container(
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  spacing: 8,
                                                  children: [
                                                    const Text(
                                                      'Lấy chỉ đường',
                                                      style: TextStyle(
                                                        color: Colors.white /* Color-White */,
                                                        fontSize: 16,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w500,
                                                        height: 1.50,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 24,
                                                      height: 24,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: const BoxDecoration(),
                                                      child: const Stack(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 516,
                          decoration: ShapeDecoration(
                            image: const DecorationImage(
                              image: NetworkImage(
                                "https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg",
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
