import 'package:flutter/material.dart';
import '../widgets/common/app_header.dart';
import '../widgets/utils/header_utils.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';

class HeaderDemoPage extends StatelessWidget {
  const HeaderDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        onLogoTap: () => HeaderUtils.navigateToHome(context),
        onRecipesTap: () => HeaderUtils.navigateToRecipes(context),
        onMealPlanTap: () => HeaderUtils.showMealPlanComingSoon(context),
        onCommunityTap: () => HeaderUtils.showCommunityComingSoon(context),
        onViewTap: () => HeaderUtils.showViewComingSoon(context),
        onRegisterTap: () => HeaderUtils.showRegisterComingSoon(context),
      ),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              
              // Title
              Text(
                'Header Widget Demo',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.navTextColor,
                ),
              ),
              
              const SizedBox(height: 16),
              
                              Text(
                  'Đây là demo của header widget với dropdown menu "Hỗ trợ" full width.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.navTextColor,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '✨ Tính năng mới:',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Dropdown menu full width màn hình\n'
                        '• Bố cục 3 cột như thiết kế\n'
                        '• Hiển thị ngay dưới header\n'
                        '• Background overlay khi mở dropdown\n'
                        '• Animation mượt mà',
                        style: TextStyle(
                          color: AppColors.navTextColor,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              
              const SizedBox(height: 32),
              
              // Feature Cards
              _buildFeatureSection(context),
              
              const SizedBox(height: 40),
              
              // Instructions
              _buildInstructionsSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tính năng Header:',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.navTextColor,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _buildFeatureItem(
                  context,
                  Icons.menu,
                  'Navigation Menu',
                  'Công thức nấu, Kế hoạch bữa, Cộng đồng, Hỗ trợ',
                ),
                const Divider(height: 32),
                _buildFeatureItem(
                  context,
                  Icons.arrow_drop_down,
                  'Full Width Dropdown "Hỗ trợ"',
                  'Menu dropdown full màn hình với 3 cột: Khám phá món ăn, Tin tức từ Blog, Bài viết nổi bật',
                ),
                const Divider(height: 32),
                _buildFeatureItem(
                  context,
                  Icons.touch_app,
                  'Interactive Buttons',
                  'Button "Xem" (outline) và "Đăng ký" (filled)',
                ),
                const Divider(height: 32),
                _buildFeatureItem(
                  context,
                  Icons.palette,
                  'Vietnamese Theme',
                  'Màu sắc và thiết kế theo phong cách Việt Nam',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, IconData icon, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.navTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hướng dẫn sử dụng:',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.navTextColor,
          ),
        ),
        
        const SizedBox(height: 16),
        
        Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInstruction('1. Nhấn vào "Hỗ trợ" ở header để mở dropdown menu full width'),
                const SizedBox(height: 12),
                _buildInstruction('2. Menu sẽ hiển thị 3 cột với background overlay'),
                const SizedBox(height: 12),
                _buildInstruction('3. Cột 1: Khám phá món ăn (4 items với icon)'),
                const SizedBox(height: 12),
                _buildInstruction('4. Cột 2: Tin tức từ Blog (4 items với icon)'),
                const SizedBox(height: 12),
                _buildInstruction('5. Cột 3: Bài viết nổi bật (2 items với hình ảnh)'),
                const SizedBox(height: 12),
                _buildInstruction('6. Click bất kỳ đâu ngoài dropdown để đóng'),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sử dụng trong code:',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'AppHeader(\n'
                        '  onLogoTap: () => navigateToHome(),\n'
                        '  onRecipesTap: () => navigateToRecipes(),\n'
                        '  onMealPlanTap: () => showComingSoon(),\n'
                        '  // ... other callbacks\n'
                        ')',
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: AppColors.navTextColor,
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
    );
  }

  Widget _buildInstruction(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(top: 8),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.navTextColor,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
} 