import 'package:flutter/material.dart';
import '../../core/router/app_routes.dart';
import 'app_header.dart';

/// Base page widget to avoid code duplication
abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});

  /// Current page route to highlight in header
  String get currentRoute;
  
  /// Main body content of the page
  Widget buildBody(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        onLogoTap: () => _navigateToHome(context),
        onRecipesTap: () => _navigateToRecipes(context),
        onMealPlanTap: () => _showFeatureInDevelopment(context, 'Kế hoạch bữa ăn'),
        onCommunityTap: () => _showFeatureInDevelopment(context, 'Cộng đồng'),
        onViewTap: () => _showFeatureInDevelopment(context, 'Chức năng xem'),
        onRegisterTap: () => _showFeatureInDevelopment(context, 'Đăng ký'),
      ),
      body: buildBody(context),
    );
  }

  void _navigateToHome(BuildContext context) {
    if (currentRoute != AppRoutes.home) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false,
      );
    }
  }

  void _navigateToRecipes(BuildContext context) {
    if (currentRoute != AppRoutes.recipes) {
      Navigator.pushNamed(context, AppRoutes.recipes);
    }
  }

  void _showFeatureInDevelopment(BuildContext context, String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$featureName đang được phát triển')),
    );
  }
}