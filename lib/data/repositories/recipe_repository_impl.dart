import 'package:dartz/dartz.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipe_repository.dart';
import '../../core/error/failures.dart';
import '../../core/error/exceptions.dart';
import '../../core/network/network_info.dart';
import '../datasources/recipe_remote_datasource.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecipeRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Recipe>>> getRecipes({
    int page = 1,
    int limit = 10,
    String? category,
    String? search,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final recipeModels = await remoteDataSource.getRecipes(
          page: page,
          limit: limit,
          category: category,
          search: search,
        );
        final recipes = recipeModels.map((model) => model.toEntity()).toList();
        return Right(recipes);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Recipe>> getRecipeById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final recipeModel = await remoteDataSource.getRecipeById(id);
        return Right(recipeModel.toEntity());
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getFeaturedRecipes() async {
    if (await networkInfo.isConnected) {
      try {
        final recipeModels = await remoteDataSource.getFeaturedRecipes();
        final recipes = recipeModels.map((model) => model.toEntity()).toList();
        return Right(recipes);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final categories = await remoteDataSource.getCategories();
        return Right(categories);
      } on ServerException {
        return const Left(ServerFailure('Server error occurred'));
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> searchRecipes(String query) async {
    return await getRecipes(search: query);
  }

  @override
  Future<Either<Failure, List<Recipe>>> getRecipesByCategory(String category) async {
    return await getRecipes(category: category);
  }
}