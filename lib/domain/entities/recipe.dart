import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int cookingTime;
  final int servings;
  final String difficulty;
  final List<String> ingredients;
  final List<String> instructions;
  final double rating;
  final bool isFavorite;
  final String category;
  final DateTime createdAt;

  const Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cookingTime,
    required this.servings,
    required this.difficulty,
    required this.ingredients,
    required this.instructions,
    required this.rating,
    required this.isFavorite,
    required this.category,
    required this.createdAt,
  });

  Recipe copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    int? cookingTime,
    int? servings,
    String? difficulty,
    List<String>? ingredients,
    List<String>? instructions,
    double? rating,
    bool? isFavorite,
    String? category,
    DateTime? createdAt,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      cookingTime: cookingTime ?? this.cookingTime,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        description,
        imageUrl,
        cookingTime,
        servings,
        difficulty,
        ingredients,
        instructions,
        rating,
        isFavorite,
        category,
        createdAt,
      ];
}