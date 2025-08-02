import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/network_info.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../domain/usecases/get_recipes.dart';
import '../../data/datasources/recipe_remote_datasource.dart';
import '../../data/repositories/recipe_repository_impl.dart';
import 'recipe_notifier.dart';

// Data Source Provider
final recipeRemoteDataSourceProvider = Provider<RecipeRemoteDataSource>((ref) {
  final dioClient = ref.watch(dioProvider);
  return RecipeRemoteDataSourceImpl(dioClient: dioClient.dio);
});

// Repository Provider
final recipeRepositoryProvider = Provider<RecipeRepository>((ref) {
  final remoteDataSource = ref.watch(recipeRemoteDataSourceProvider);
  final networkInfo = ref.watch(networkInfoProvider);
   
  return RecipeRepositoryImpl(
    remoteDataSource: remoteDataSource,
    networkInfo: networkInfo,
  );
});

// Use Cases Providers
final getRecipesUseCaseProvider = Provider<GetRecipes>((ref) {
  final repository = ref.watch(recipeRepositoryProvider);
  return GetRecipes(repository);
});

// State Notifier Provider
final recipeNotifierProvider = StateNotifierProvider<RecipeNotifier, RecipeState>((ref) {
  final getRecipesUseCase = ref.watch(getRecipesUseCaseProvider);
  return RecipeNotifier(getRecipesUseCase);
});

// Featured Recipes Provider
final featuredRecipesProvider = FutureProvider((ref) async {
  final repository = ref.watch(recipeRepositoryProvider);
  final result = await repository.getFeaturedRecipes();
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (recipes) => recipes,
  );
});

// Categories Provider
final categoriesProvider = FutureProvider((ref) async {
  final repository = ref.watch(recipeRepositoryProvider);
  final result = await repository.getCategories();
  
  return result.fold(
    (failure) => throw Exception(failure.message),
    (categories) => categories,
  );
}); 