import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../widgets/common/app_header.dart';
import '../../../../core/router/app_routes.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

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
            Text(
              'Các món ăn yêu thích của bạn',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSizes.lg),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Mock data
                itemBuilder: (context, index) {
                  return _buildFavoriteCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          ),
          child: Icon(
            Icons.restaurant_menu,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text('Món yêu thích ${index + 1}'),
        subtitle: Text('Thời gian nấu: ${(index + 1) * 15} phút'),
        trailing: IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: () {
            // TODO: Remove from favorites
          },
        ),
        onTap: () {
          // TODO: Navigate to recipe details
        },
      ),
    );
  }
} 