import 'package:flutter/material.dart';
import 'package:vietnamesecooking/features/home/presentation/pages/content_home_page.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../widgets/common/app_header.dart';
import '../../../community/presentation/pages/community_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../recipes/presentation/pages/recipes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // Danh sách các page con
  final List<Widget> _pages = [
    const HomeContentPage(),
    const RecipesPage(),
    const CommunityPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppHeader(
        onLogoTap: () {
          setState(() {
            currentIndex = 0; // Về trang chủ
          });
        },
        onRecipesTap: () {
          setState(() {
            currentIndex = 1; // Chuyển sang trang công thức
          });
        },
        onMealPlanTap: () {
          // TODO: Navigate to meal plan
          setState(() {
            currentIndex = 2; // Chuyển sang trang công thức
          });
        },
        onCommunityTap: () {
          // TODO: Navigate to community
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Cộng đồng đang được phát triển')));
        },
        onViewTap: () {
          // TODO: Implement view action
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Chức năng xem đang được phát triển')));
        },
        onRegisterTap: () {
          // TODO: Navigate to register
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Đăng ký đang được phát triển')));
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _pages, // ← Chỉ phần body thay đổi, header giữ nguyên
      ),
      // ← Thêm FloatingActionButton cho RecipesPage
      floatingActionButton:
          currentIndex == 1
              ? FloatingActionButton(
                onPressed: () {
                  // TODO: Add new recipe
                },
                child: const Icon(Icons.add),
              )
              : null,
    );
  }
}


  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to respective feature
        },
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: AppSizes.iconXl, color: Theme.of(context).primaryColor),
              const SizedBox(height: AppSizes.sm),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

