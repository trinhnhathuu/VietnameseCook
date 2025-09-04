import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';

class FoodSuggestionsSection extends StatelessWidget {
  final List<FoodSuggestionItem> suggestions;

  const FoodSuggestionsSection({
    super.key,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return Card(
          margin: const EdgeInsets.only(bottom: AppSizes.md),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text('${index + 1}'),
            ),
            title: Text(suggestion.title),
            subtitle: Text(suggestion.description),
            trailing: IconButton(
              icon: Icon(
                suggestion.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: suggestion.isFavorite ? Colors.red : null,
              ),
              onPressed: suggestion.onFavoriteToggle,
            ),
            onTap: suggestion.onTap,
          ),
        );
      },
    );
  }
}

class FoodSuggestionItem {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;

  const FoodSuggestionItem({
    required this.title,
    required this.description,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
  });
}