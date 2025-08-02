import 'package:flutter/material.dart';
import '../../core/router/app_routes.dart';

class HeaderUtils {
  /// Get header height based on screen size
  static double getHeaderHeight(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 600) {
      return 60; // Small screens
    } else if (screenHeight < 800) {
      return 70; // Medium screens
    } else {
      return 80; // Large screens
    }
  }

  /// Get header padding based on screen size
  static EdgeInsets getHeaderPadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
    } else if (screenWidth < 900) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    } else {
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 12);
    }
  }

  /// Get logo font size based on screen size
  static double getLogoFontSize(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 20;
    } else if (screenWidth < 900) {
      return 22;
    } else {
      return 24;
    }
  }

  /// Get navigation item spacing based on screen size
  static double getNavItemSpacing(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 16;
    } else if (screenWidth < 900) {
      return 24;
    } else {
      return 32;
    }
  }

  /// Check if header should be compact
  static bool shouldUseCompactHeader(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 600;
  }

  /// Get responsive text style for header
  static TextStyle getResponsiveTextStyle(BuildContext context, {
    double? baseFontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = baseFontSize ?? 16;
    
    if (screenWidth < 600) {
      fontSize *= 0.9;
    } else if (screenWidth > 1200) {
      fontSize *= 1.1;
    }

    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
    );
  }

  // Navigation methods
  static void navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (route) => false,
    );
  }

  static void navigateToRecipes(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.recipes);
  }

  static void showMealPlanComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kế hoạch bữa ăn đang được phát triển')),
    );
  }

  static void showCommunityComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cộng đồng đang được phát triển')),
    );
  }

  static void showViewComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Chức năng xem đang được phát triển')),
    );
  }

  static void showRegisterComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Đăng ký đang được phát triển')),
    );
  }
}