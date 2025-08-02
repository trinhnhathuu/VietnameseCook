import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onRecipesTap;
  final VoidCallback? onMealPlanTap;
  final VoidCallback? onCommunityTap;
  final VoidCallback? onViewTap;
  final VoidCallback? onRegisterTap;

  const AppHeader({
    Key? key,
    this.onLogoTap,
    this.onRecipesTap,
    this.onMealPlanTap,
    this.onCommunityTap,
    this.onViewTap,
    this.onRegisterTap,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final GlobalKey _supportButtonKey = GlobalKey();
  final LayerLink _layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        height: 80,
        color: AppColors.headerBackground,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          children: [
            // Logo
            GestureDetector(
              onTap: widget.onLogoTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text(
                  AppStrings.logo,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.navTextColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 60),

            // Navigation Menu
            Expanded(
              child: Row(
                children: [
                  _buildNavItem(AppStrings.recipesNav, widget.onRecipesTap),
                  const SizedBox(width: 32),
                  _buildNavItem(AppStrings.mealPlan, widget.onMealPlanTap),
                  const SizedBox(width: 32),
                  _buildNavItem(AppStrings.community, widget.onCommunityTap),
                  const SizedBox(width: 32),
                  _buildSupportDropdown(),
                ],
              ),
            ),

            // Action Buttons
            Row(
              children: [
                _buildOutlineButton(AppStrings.view, widget.onViewTap),
                const SizedBox(width: 12),
                _buildFilledButton(AppStrings.register, widget.onRegisterTap),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  Widget _buildNavItem(String text, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.navTextColor,
          ),
        ),
      ),
    );
  }

  Widget _buildSupportDropdown() {
    return GestureDetector(
      key: _supportButtonKey,
      onTap: _toggleDropdown,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.support,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.navTextColor,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              _isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColors.navTextColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _createOverlay();
    }
  }

  void _createOverlay() {
    _removeOverlay();
    
    _overlayEntry = OverlayEntry(
      builder: (context) => _buildFullWidthDropdown(),
    );
    
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    if (_isDropdownOpen) {
      setState(() {
        _isDropdownOpen = false;
      });
    }
  }

  Widget _buildFullWidthDropdown() {
    return GestureDetector(
      onTap: _removeOverlay,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Backdrop
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            // Dropdown content
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: const Offset(0, 80), // Height of header
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.headerBackground,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Column 1: Khám phá món ăn
                    Expanded(
                      child: _buildDropdownColumn(
                        AppStrings.exploreFood,
                        [
                          _buildDropdownColumnItem(AppStrings.exploreFood, AppStrings.cookingFeatures, hasButton: true),
                          _buildDropdownColumnItem(AppStrings.cookingSkills, AppStrings.learnFromExperts),
                          _buildDropdownColumnItem(AppStrings.cookingTips, AppStrings.usefulTipsForKitchen),
                          _buildDropdownColumnItem(AppStrings.newRecipes, AppStrings.uniqueRecipes),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 40),
                    
                    // Column 2: Tin tức từ Blog
                    Expanded(
                      child: _buildDropdownColumn(
                        AppStrings.blogNews,
                        [
                          _buildDropdownColumnItem(AppStrings.exploreFood, AppStrings.discoverRecipes),
                          _buildDropdownColumnItem(AppStrings.cookingTechniques, AppStrings.easyForEveryone),
                          _buildDropdownColumnItem(AppStrings.cookingTipsMenu, AppStrings.tipsForFamily),
                          _buildDropdownColumnItem(AppStrings.newsMenu, AppStrings.latestNews),
                        ],
                      ),
                    ),
                    
                    const SizedBox(width: 40),
                    
                    // Column 3: Bài viết nổi bật
                    Expanded(
                      child: _buildDropdownColumn(
                        AppStrings.featuredPosts,
                        [
                          _buildDropdownColumnItem(AppStrings.deliciousRecipes, AppStrings.easyRecipes, hasImage: true),
                          _buildDropdownColumnItem(AppStrings.newDishes, AppStrings.discoverNewDishes, hasImage: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownColumn(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.navTextColor,
          ),
        ),
        const SizedBox(height: 16),
        ...items,
      ],
    );
  }

  Widget _buildDropdownColumnItem(String title, String subtitle, {bool hasButton = false, bool hasImage = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          _removeOverlay();
          // TODO: Handle item tap
        },
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon or Image placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: hasImage ? AppColors.background : AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: hasImage 
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 24,
                      ),
                    )
                  : const Icon(
                      Icons.restaurant_menu,
                      color: AppColors.navTextColor,
                      size: 24,
                    ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.navTextColor,
                            ),
                          ),
                        ),
                        if (hasButton)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.navTextColor),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              AppStrings.readMore,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.navTextColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOutlineButton(String text, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.buttonOutline),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.navTextColor,
          ),
        ),
      ),
    );
  }

  Widget _buildFilledButton(String text, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.buttonRegister,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}