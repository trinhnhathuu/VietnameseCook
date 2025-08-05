import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ← Không cần Scaffold và AppHeader nữa, chỉ cần content
    return Padding(
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