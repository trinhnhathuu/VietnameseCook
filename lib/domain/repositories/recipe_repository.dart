import 'package:dartz/dartz.dart';
import '../entities/recipe.dart';
import '../../core/error/failures.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<Recipe>>> getRecipes({
    int page = 1,
    int limit = 10,
    String? category,
    String? search,
  });

  Future<Either<Failure, Recipe>> getRecipeById(String id);

  Future<Either<Failure, List<Recipe>>> getFeaturedRecipes();

  Future<Either<Failure, List<String>>> getCategories();

  Future<Either<Failure, List<Recipe>>> searchRecipes(String query);

  Future<Either<Failure, List<Recipe>>> getRecipesByCategory(String category);
}