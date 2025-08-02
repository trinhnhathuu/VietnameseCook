class ApiEndpoints {
  static const String baseUrl = 'https://api.vietnamesecooking.com';
  static const String apiVersion = '/api/v1';
  
  // Auth endpoints
  static const String login = '$apiVersion/auth/login';
  static const String register = '$apiVersion/auth/register';
  static const String logout = '$apiVersion/auth/logout';
  static const String refreshToken = '$apiVersion/auth/refresh';
  
  // Recipes endpoints
  static const String recipes = '$apiVersion/recipes';
  static const String recipeDetails = '$apiVersion/recipes/{id}';
  static const String featuredRecipes = '$apiVersion/recipes/featured';
  static const String searchRecipes = '$apiVersion/recipes/search';
  static const String categoriesRecipes = '$apiVersion/recipes/categories';
  
  // User endpoints
  static const String profile = '$apiVersion/user/profile';
  static const String favorites = '$apiVersion/user/favorites';
  static const String updateProfile = '$apiVersion/user/profile';
  
  // Categories endpoints
  static const String categories = '$apiVersion/categories';
  
  // Ingredients endpoints
  static const String ingredients = '$apiVersion/ingredients';
  static const String searchIngredients = '$apiVersion/ingredients/search';
  
  // Upload endpoints
  static const String uploadImage = '$apiVersion/upload/image';
  
  // Helper method to replace path parameters
  static String replacePathParams(String endpoint, Map<String, String> params) {
    String result = endpoint;
    params.forEach((key, value) {
      result = result.replaceAll('{$key}', value);
    });
    return result;
  }
} 