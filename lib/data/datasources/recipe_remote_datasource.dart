import 'package:dio/dio.dart';
import '../models/recipe_model.dart';

abstract class RecipeRemoteDataSource {
  Future<List<RecipeModel>> getRecipes({
    int page = 1,
    int limit = 10,
    String? category,
    String? search,
  });

  Future<RecipeModel> getRecipeById(String id);

  Future<List<RecipeModel>> getFeaturedRecipes();

  Future<List<String>> getCategories();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final Dio dioClient;

  RecipeRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<List<RecipeModel>> getRecipes({
    int page = 1,
    int limit = 10,
    String? category,
    String? search,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'page': page,
        'limit': limit,
      };

      if (category != null && category.isNotEmpty) {
        queryParameters['category'] = category;
      }

      if (search != null && search.isNotEmpty) {
        queryParameters['search'] = search;
      }

      final response = await dioClient.get(
        '/recipes',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((json) => RecipeModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      // For now, return mock data
      return _getMockRecipes();
    }
  }

  @override
  Future<RecipeModel> getRecipeById(String id) async {
    try {
      final response = await dioClient.get('/recipes/$id');

      if (response.statusCode == 200) {
        return RecipeModel.fromJson(response.data['data']);
      } else {
        throw Exception('Failed to load recipe');
      }
    } catch (e) {
      // For now, return mock data
      final mockRecipes = _getMockRecipes();
      return mockRecipes.firstWhere((recipe) => recipe.id == id);
    }
  }

  @override
  Future<List<RecipeModel>> getFeaturedRecipes() async {
    try {
      final response = await dioClient.get('/recipes/featured');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((json) => RecipeModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load featured recipes');
      }
    } catch (e) {
      // For now, return mock data
      return _getMockRecipes().take(3).toList();
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await dioClient.get('/recipes/categories');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((category) => category.toString()).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      // For now, return mock data
      return ['Món chính', 'Món phụ', 'Tráng miệng', 'Đồ uống', 'Khai vị'];
    }
  }

  List<RecipeModel> _getMockRecipes() {
    return [
      RecipeModel(
        id: '1',
        title: 'Phở Bò',
        description: 'Món phở bò truyền thống Việt Nam với nước dùng đậm đà',
        imageUrl: 'https://example.com/pho.jpg',
        cookingTime: 120,
        servings: 4,
        difficulty: 'medium',
        ingredients: const [
          'Bánh phở',
          'Thịt bò',
          'Xương bò',
          'Gia vị phở',
          'Hành lá',
          'Ngò gai',
        ],
        instructions: const [
          'Nấu nước dùng từ xương bò',
          'Thái thịt bò mỏng',
          'Trụng bánh phở',
          'Thêm gia vị và rau',
        ],
        rating: 4.8,
        isFavorite: true,
        category: 'Món chính',
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
      ),
      RecipeModel(
        id: '2',
        title: 'Bánh Mì Thịt Nướng',
        description: 'Bánh mì Việt Nam với thịt nướng thơm ngon',
        imageUrl: 'https://example.com/banhmi.jpg',
        cookingTime: 45,
        servings: 2,
        difficulty: 'easy',
        ingredients: const [
          'Bánh mì',
          'Thịt heo',
          'Dưa leo',
          'Rau ngò',
          'Sốt mayonnaise',
        ],
        instructions: const [
          'Nướng thịt heo',
          'Cắt bánh mì',
          'Thêm rau và sốt',
          'Hoàn thành',
        ],
        rating: 4.5,
        isFavorite: false,
        category: 'Món ăn sáng',
        createdAt: DateTime.now().subtract(const Duration(days: 15)),
      ),
      RecipeModel(
        id: '3',
        title: 'Gỏi Cuốn',
        description: 'Gỏi cuốn tươi ngon với tôm và thịt',
        imageUrl: 'https://example.com/goicuon.jpg',
        cookingTime: 30,
        servings: 6,
        difficulty: 'easy',
        ingredients: const [
          'Bánh tráng',
          'Tôm',
          'Thịt heo',
          'Rau sống',
          'Bún',
        ],
        instructions: const [
          'Luộc tôm và thịt',
          'Chuẩn bị rau sống',
          'Cuốn bánh tráng',
          'Cắt khúc và thưởng thức',
        ],
        rating: 4.7,
        isFavorite: true,
        category: 'Khai vị',
        createdAt: DateTime.now().subtract(const Duration(days: 7)),
      ),
    ];
  }
}