class AppRoutes {
  // Base routes
  static const String splash = '/';
  static const String home = '/home';
  
  // Main navigation routes
  static const String recipes = '/recipes';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  
  // Recipe routes
  static const String recipeDetails = '/recipes/:id';
  static const String addRecipe = '/recipes/add';
  static const String editRecipe = '/recipes/:id/edit';
  
  // Auth routes
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  
  // Settings routes
  static const String settings = '/settings';
  static const String about = '/settings/about';
  static const String privacy = '/settings/privacy';
  
  // Search routes
  static const String search = '/search';
  static const String searchResults = '/search/results';
  
  // Category routes
  static const String categories = '/categories';
  static const String categoryRecipes = '/categories/:id/recipes';
} 