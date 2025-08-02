import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../widgets/common/app_header.dart';
import '../../../../core/router/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        onLogoTap: () {
          // Navigate to home
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (route) => false,
          );
        },
        onRecipesTap: () {
          Navigator.pushNamed(context, AppRoutes.recipes);
        },
        onMealPlanTap: () {
          // TODO: Navigate to meal plan
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kế hoạch bữa ăn đang được phát triển')),
          );
        },
        onCommunityTap: () {
          // TODO: Navigate to community
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cộng đồng đang được phát triển')),
          );
        },
        onViewTap: () {
          // TODO: Implement view action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Chức năng xem đang được phát triển')),
          );
        },
        onRegisterTap: () {
          // TODO: Navigate to register
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng ký đang được phát triển')),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chào mừng đến với ${AppStrings.appName}!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppSizes.md),
            Text(
              'Khám phá những món ăn Việt Nam ngon nhất',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSizes.lg),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: AppSizes.md,
                mainAxisSpacing: AppSizes.md,
                children: [
                  _buildFeatureCard(
                    context,
                    icon: Icons.restaurant_menu,
                    title: 'Công thức mới',
                    subtitle: 'Khám phá món mới',
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.favorite,
                    title: 'Yêu thích',
                    subtitle: 'Món ăn ưa thích',
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.trending_up,
                    title: 'Thịnh hành',
                    subtitle: 'Món ăn hot nhất',
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.category,
                    title: 'Danh mục',
                    subtitle: 'Phân loại món ăn',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
              Icon(
                icon,
                size: AppSizes.iconXl,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
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
} 