import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../widgets/common/app_header.dart';
import '../../../../core/router/app_routes.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

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
          // Already on recipes page
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
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: AppStrings.search,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                ),
              ),
            ),
            const SizedBox(height: AppSizes.md),
            
            // Filter Chips
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFilterChip('Tất cả', true),
                  _buildFilterChip('Món chính', false),
                  _buildFilterChip('Món phụ', false),
                  _buildFilterChip('Tráng miệng', false),
                  _buildFilterChip('Đồ uống', false),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.md),
            
            // Recipe List
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Mock data
                itemBuilder: (context, index) {
                  return _buildRecipeCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add new recipe
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.sm),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          // TODO: Implement filter
        },
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Text('${index + 1}'),
        ),
        title: Text('Món ăn ${index + 1}'),
        subtitle: Text('Mô tả ngắn cho món ăn ${index + 1}'),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {
            // TODO: Add to favorites
          },
        ),
        onTap: () {
          // TODO: Navigate to recipe details
        },
      ),
    );
  }
} 