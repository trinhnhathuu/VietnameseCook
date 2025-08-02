import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../entities/recipe.dart';
import '../repositories/recipe_repository.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';

class GetRecipes implements UseCase<List<Recipe>, GetRecipesParams> {
  final RecipeRepository repository;

  GetRecipes(this.repository);

  @override
  Future<Either<Failure, List<Recipe>>> call(GetRecipesParams params) async {
    return await repository.getRecipes(
      page: params.page,
      limit: params.limit,
      category: params.category,
      search: params.search,
    );
  }
}

class GetRecipesParams extends Equatable {
  final int page;
  final int limit;
  final String? category;
  final String? search;

  const GetRecipesParams({
    this.page = 1,
    this.limit = 10,
    this.category,
    this.search,
  });

  @override
  List<Object?> get props => [page, limit, category, search];
}