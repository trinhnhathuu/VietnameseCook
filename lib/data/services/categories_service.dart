import '../models/api_response.dart';
import '../models/category_model.dart';
import 'api_service.dart';

/// Categories service for handling category-related API calls
class CategoriesService {
  final ApiService _apiService;

  CategoriesService() : _apiService = ApiService();

  /// Get categories with pagination and filters
  Future<ApiResponse<PaginatedResponse<CategoryModel>>> getCategories({
    int page = 1,
    int limit = 10,
    String? search,
    String? ordering,
  }) async {
    final queryParams = <String, dynamic>{'page': page, 'limit': limit};

    if (search != null && search.isNotEmpty) queryParams['search'] = search;
    if (ordering != null && ordering.isNotEmpty) queryParams['ordering'] = ordering;
    final result = await _apiService.get<PaginatedResponse<CategoryModel>>(
      '/categories/',
      queryParameters: queryParams,
      fromJson:
          (json) => PaginatedResponse<CategoryModel>.fromJson(
            json,
            (item) => CategoryModel.fromJson(item),
          ),
    );
    print('result: $result');
    return result;
  }

  /// Get category by ID
  Future<ApiResponse<CategoryModel>> getCategoryById(int id) async {
    return await _apiService.get<CategoryModel>(
      '/categories/$id',
      fromJson: (json) => CategoryModel.fromJson(json),
    );
  }

  /// Mock data for development
  Future<ApiResponse<List<CategoryModel>>> getMockCategories() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final mockCategories = [
      CategoryModel(
        id: 1,
        name: 'Món chính',
        nameVi: 'Món chính',
        sortOrder: 1,
        createdAt: DateTime.now(),
      ),
      CategoryModel(
        id: 2,
        name: 'Món ăn sáng',
        nameVi: 'Món ăn sáng',
        sortOrder: 2,
        createdAt: DateTime.now(),
      ),
      CategoryModel(
        id: 3,
        name: 'Món Việt',
        nameVi: 'Món Việt',
        sortOrder: 3,
        createdAt: DateTime.now(),
      ),
      CategoryModel(
        id: 4,
        name: 'Món tráng miệng',
        nameVi: 'Món tráng miệng',
        sortOrder: 4,
        createdAt: DateTime.now(),
      ),
    ];

    return ApiResponse.success(data: mockCategories);
  }
}
