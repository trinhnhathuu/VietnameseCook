import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_sizes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ← Không cần Scaffold và AppHeader nữa, chỉ cần content
    return Padding(
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