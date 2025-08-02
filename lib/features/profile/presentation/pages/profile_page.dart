import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../widgets/common/app_header.dart';
import '../../../../core/router/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        onLogoTap: () {
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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Kế hoạch bữa ăn đang được phát triển')),
          );
        },
        onCommunityTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cộng đồng đang được phát triển')),
          );
        },
        onViewTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Chức năng xem đang được phát triển')),
          );
        },
        onRegisterTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng ký đang được phát triển')),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          children: [
            // Profile Header
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Người dùng',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: AppSizes.xs),
                          Text(
                            'user@example.com',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // TODO: Edit profile
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.lg),
            
            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(
                    context,
                    icon: Icons.favorite,
                    title: 'Món yêu thích',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.history,
                    title: 'Lịch sử xem',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.restaurant_menu,
                    title: 'Công thức của tôi',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.settings,
                    title: AppStrings.settings,
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.help,
                    title: 'Trợ giúp',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.info,
                    title: 'Về ứng dụng',
                    onTap: () {},
                  ),
                  _buildMenuItem(
                    context,
                    icon: Icons.logout,
                    title: 'Đăng xuất',
                    onTap: () {},
                    isDestructive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : null,
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
} 