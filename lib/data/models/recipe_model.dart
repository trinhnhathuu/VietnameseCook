import '../../domain/entities/recipe.dart';

class RecipeModel extends Recipe {
  const RecipeModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.cookingTime,
    required super.servings,
    required super.difficulty,
    required super.ingredients,
    required super.instructions,
    required super.rating,
    required super.isFavorite,
    required super.category,
    required super.createdAt,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      cookingTime: json['cookingTime'] ?? 0,
      servings: json['servings'] ?? 1,
      difficulty: json['difficulty'] ?? 'easy',
      ingredients: List<String>.from(json['ingredients'] ?? []),
      instructions: List<String>.from(json['instructions'] ?? []),
      rating: (json['rating'] ?? 0.0).toDouble(),
      isFavorite: json['isFavorite'] ?? false,
      category: json['category'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'cookingTime': cookingTime,
      'servings': servings,
      'difficulty': difficulty,
      'ingredients': ingredients,
      'instructions': instructions,
      'rating': rating,
      'isFavorite': isFavorite,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory RecipeModel.fromEntity(Recipe recipe) {
    return RecipeModel(
      id: recipe.id,
      title: recipe.title,
      description: recipe.description,
      imageUrl: recipe.imageUrl,
      cookingTime: recipe.cookingTime,
      servings: recipe.servings,
      difficulty: recipe.difficulty,
      ingredients: recipe.ingredients,
      instructions: recipe.instructions,
      rating: recipe.rating,
      isFavorite: recipe.isFavorite,
      category: recipe.category,
      createdAt: recipe.createdAt,
    );
  }

  Recipe toEntity() {
    return Recipe(
      id: id,
      title: title,
      description: description,
      imageUrl: imageUrl,
      cookingTime: cookingTime,
      servings: servings,
      difficulty: difficulty,
      ingredients: ingredients,
      instructions: instructions,
      rating: rating,
      isFavorite: isFavorite,
      category: category,
      createdAt: createdAt,
    );
  }
}