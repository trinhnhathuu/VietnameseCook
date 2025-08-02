import '../models/recipe.dart';
import '../models/api_response.dart';
import 'api_service.dart';

/// Recipe service for handling recipe-related API calls
class RecipeService {
  final ApiService _apiService;

  RecipeService() : _apiService = ApiService();

  /// Get recipes with pagination and filters
  Future<ApiResponse<List<Recipe>>> getRecipes({
    int page = 1,
    int limit = 10,
    String? category,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'page': page,
      'limit': limit,
    };

    if (category != null) queryParams['category'] = category;
    if (search != null) queryParams['search'] = search;

    return await _apiService.get<List<Recipe>>(
      '/recipes',
      queryParameters: queryParams,
      fromJson: (json) => (json as List)
          .map((item) => Recipe.fromJson(item))
          .toList(),
    );
  }

  /// Get recipe by ID
  Future<ApiResponse<Recipe>> getRecipeById(String id) async {
    return await _apiService.get<Recipe>(
      '/recipes/$id',
      fromJson: (json) => Recipe.fromJson(json),
    );
  }

  /// Get featured recipes
  Future<ApiResponse<List<Recipe>>> getFeaturedRecipes() async {
    return await _apiService.get<List<Recipe>>(
      '/recipes/featured',
      fromJson: (json) => (json as List)
          .map((item) => Recipe.fromJson(item))
          .toList(),
    );
  }

  /// Toggle favorite status
  Future<ApiResponse<Recipe>> toggleFavorite(String recipeId) async {
    return await _apiService.post<Recipe>(
      '/favorites/$recipeId',
      fromJson: (json) => Recipe.fromJson(json),
    );
  }

  /// Mock data for development
  Future<ApiResponse<List<Recipe>>> getMockRecipes() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final mockRecipes = [
      Recipe(
        id: '1',
        title: 'Phở Bò Hà Nội',
        description: 'Món phở bò truyền thống Hà Nội với nước dùng đậm đà',
        imageUrl: 'https://example.com/pho-bo.jpg',
        cookingTime: 120,
        servings: 4,
        difficulty: 'medium',
        ingredients: [
          '500g xương bò',
          '300g thịt bò',
          'Bánh phở',
          'Hành lá',
          'Ngò gai',
        ],
        instructions: [
          'Ninh xương bò trong 2 tiếng',
          'Thái thịt bò mỏng',
          'Trụng bánh phở',
          'Cho tất cả vào tô và đổ nước dùng',
        ],
        categories: ['Món chính', 'Món Việt'],
        rating: 4.8,
        reviewCount: 150,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Recipe(
        id: '2',
        title: 'Bánh Mì Việt Nam',
        description: 'Bánh mì giòn với nhân thịt và rau củ',
        imageUrl: 'https://example.com/banh-mi.jpg',
        cookingTime: 30,
        servings: 2,
        difficulty: 'easy',
        ingredients: [
          'Bánh mì',
          'Thịt nướng',
          'Rau cải',
          'Cà rót',
          'Tương ớt',
        ],
        instructions: [
          'Nướng bánh mì cho giòn',
          'Cắt bánh và cho nhân vào',
          'Thêm rau và tương ớt',
        ],
        categories: ['Món ăn sáng', 'Món Việt'],
        rating: 4.5,
        reviewCount: 89,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];

    return ApiResponse.success(data: mockRecipes);
  }
}