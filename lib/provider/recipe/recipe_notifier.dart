import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/usecases/get_recipes.dart';

part 'recipe_notifier.freezed.dart';

@freezed
class RecipeState with _$RecipeState {
  const factory RecipeState.initial() = _Initial;
  const factory RecipeState.loading() = _Loading;
  const factory RecipeState.loaded(List<Recipe> recipes) = _Loaded;
  const factory RecipeState.error(String message) = _Error;
}

class RecipeNotifier extends StateNotifier<RecipeState> {
  final GetRecipes _getRecipes;

  RecipeNotifier(this._getRecipes) : super(const RecipeState.initial());

  Future<void> loadRecipes({
    int page = 1,
    int limit = 10,
    String? category,
    String? search,
  }) async {
    state = const RecipeState.loading();

    final result = await _getRecipes(
      GetRecipesParams(
        page: page,
        limit: limit,
        category: category,
        search: search,
      ),
    );

    result.fold(
      (failure) => state = RecipeState.error(failure.message),
      (recipes) => state = RecipeState.loaded(recipes),
    );
  }

  Future<void> searchRecipes(String query) async {
    await loadRecipes(search: query);
  }

  Future<void> filterByCategory(String category) async {
    await loadRecipes(category: category);
  }

  void resetState() {
    state = const RecipeState.initial();
  }
} 