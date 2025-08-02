import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/recipes/presentation/pages/recipes_page.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import 'app_routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      // Splash
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      
      // Main App Routes with Shell
      ShellRoute(
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          // Home
          GoRoute(
            path: AppRoutes.home,
            name: 'home',
            builder: (context, state) => const HomePage(),
          ),
          
          // Recipes
          GoRoute(
            path: AppRoutes.recipes,
            name: 'recipes',
            builder: (context, state) => const RecipesPage(),
          ),
          
          // Favorites
          GoRoute(
            path: AppRoutes.favorites,
            name: 'favorites',
            builder: (context, state) => const FavoritesPage(),
          ),
          
          // Profile
          GoRoute(
            path: AppRoutes.profile,
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
});

// Main Shell with Bottom Navigation
class MainShell extends StatefulWidget {
  final Widget child;
  
  const MainShell({super.key, required this.child});
  
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int currentIndex = 0;
  
  final List<BottomNavigationBarItem> _tabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Trang chủ',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      label: 'Công thức',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Yêu thích',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Cá nhân',
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          
          switch (index) {
            case 0:
              context.go(AppRoutes.home);
              break;
            case 1:
              context.go(AppRoutes.recipes);
              break;
            case 2:
              context.go(AppRoutes.favorites);
              break;
            case 3:
              context.go(AppRoutes.profile);
              break;
          }
        },
        items: _tabs,
      ),
    );
  }
} 