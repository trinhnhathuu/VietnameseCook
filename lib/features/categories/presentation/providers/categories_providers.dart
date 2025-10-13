import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/models/category_model.dart';
import '../../../../data/services/categories_service.dart';

class CategoriesQuery extends Equatable {
  final int page;
  final int pageSize;
  final String? search;
  final String? ordering;

  const CategoriesQuery({
    this.page = 1,
    this.pageSize = 20,
    this.search,
    this.ordering,
  });

  CategoriesQuery copyWith({
    int? page,
    int? pageSize,
    String? search,
    String? ordering,
  }) {
    return CategoriesQuery(
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
      search: search ?? this.search,
      ordering: ordering ?? this.ordering,
    );
  }

  @override
  List<Object?> get props => [page, pageSize, search, ordering];
}

final categoriesQueryProvider = StateProvider<CategoriesQuery>((ref) {
  return const CategoriesQuery();
});

final categoriesServiceProvider = Provider<CategoriesService>((ref) {
  return CategoriesService();
});

final categoriesFutureProvider = FutureProvider.autoDispose<PaginatedResponse<CategoryModel>>((ref) async {
  final service = ref.read(categoriesServiceProvider);
  final query = ref.watch(categoriesQueryProvider);
  final result = await service.getCategories(
    page: query.page,
    limit: query.pageSize,
    search: query.search,
    ordering: query.ordering,
  );
  
  if (result.success && result.data != null) {
    return result.data!;
  } else {
    // Return empty paginated response on error
    return const PaginatedResponse<CategoryModel>(
      count: 0,
      next: null,
      previous: null,
      results: [],
    );
  }
});


