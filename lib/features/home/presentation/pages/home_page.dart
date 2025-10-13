import 'package:flutter/material.dart';
import 'package:vietnamesecooking/features/home/presentation/pages/content_home_page.dart';

import '../../../../widgets/common/app_header.dart';
import '../../../categories/presentation/pages/categories_page.dart';
import '../../../community/presentation/pages/community_page.dart';
import '../../../recipes/presentation/pages/recipes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  // Danh sách các page con
  final List<Widget> _pages = [
    const HomeContentPage(),
    const RecipesPage(),
    const CommunityPage(),
    const CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppHeader(
        onLogoTap: () {
          setState(() {
            currentIndex = 0; // Về trang chủ
          });
        },
        onRecipesTap: () {
          setState(() {
            currentIndex = 1; // Chuyển sang trang công thức
          });
        },
        onMealPlanTap: () {
          // TODO: Navigate to meal plan
          setState(() {
            currentIndex = 2; // Chuyển sang trang công thức
          });
        },
        onCommunityTap: () {
          setState(() {
            currentIndex = 3; // Chuyển sang trang công thức
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: _pages, // ← Chỉ phần body thay đổi, header giữ nguyên
      ),
    );
  }
}
