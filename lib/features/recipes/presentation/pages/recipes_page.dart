import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/filter_chips_row.dart';
import '../widgets/featured_intro.dart';
import '../widgets/season_recipes_section.dart';
import '../widgets/ingredient_suggestions_section.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String _selectedFilter = 'Tất cả';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchSection(),
            const SizedBox(height: AppSizes.md),
            _buildFilterSection(),
            const SizedBox(height: AppSizes.md),
            _buildFeaturedSection(),
            _buildSeasonRecipesSection(),
            _buildIngredientSuggestionsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return SearchBarWidget(
      controller: _searchController,
      onChanged: _handleSearchChanged,
      onSubmitted: _handleSearchSubmitted,
    );
  }

  Widget _buildFilterSection() {
    return FilterChipsRow(
      filters: const [
        'Tất cả',
        'Món chính',
        'Món phụ',
        'Tráng miệng',
        'Đồ uống',
      ],
      selectedFilter: _selectedFilter,
      onFilterSelected: _handleFilterSelected,
    );
  }

  Widget _buildFeaturedSection() {
    return const FeaturedIntro(
      title: 'Công thức nổi bật',
      subtitle: 'Khám phá những công thức nấu ăn độc đáo và hấp dẫn từ khắp nơi Việt Nam.',
    );
  }

  Widget _buildSeasonRecipesSection() {
    return SeasonRecipesSection(
      sectionTitle: 'Công thức Mùa Xuân',
      sectionSubtitle: 'Khám phá công thức nấu ăn mùa này',
      articles: _getSampleArticles(),
      onViewAll: _handleViewAllPressed,
    );
  }

  List<ArticleData> _getSampleArticles() {
    return [
      ArticleData(
        imageUrl: "https://placehold.co/405x270",
        category: "Món ăn",
        title: "Cách làm phở bò ngon tuyệt",
        description: "Hướng dẫn chi tiết từng bước để nấu phở bò.",
        authorName: "Nguyễn Văn A",
        authorImageUrl: "https://placehold.co/48x48",
        publishDate: "11 Jan 2022",
        readTime: "5 min read",
        onTap: () => _handleArticleTap("pho-bo"),
      ),
      ArticleData(
        imageUrl: "https://placehold.co/405x270",
        category: "Món ăn",
        title: "Cách làm bánh xèo miền Nam",
        description: "Bánh xèo giòn rụm, thơm ngon và dễ làm.",
        authorName: "Trần Thị B",
        authorImageUrl: "https://placehold.co/48x48",
        publishDate: "12 Jan 2022",
        readTime: "7 min read",
        onTap: () => _handleArticleTap("banh-xeo"),
      ),
      ArticleData(
        imageUrl: "https://placehold.co/405x270",
        category: "Món ăn",
        title: "Cách làm bánh xèo miền Nam",
        description: "Bánh xèo giòn rụm, thơm ngon và dễ làm.",
        authorName: "Trần Thị B",
        authorImageUrl: "https://placehold.co/48x48",
        publishDate: "12 Jan 2022",
        readTime: "7 min read",
        onTap: () => _handleArticleTap("banh-xeo"),
      ),
    ];
  }

  Widget _buildIngredientSuggestionsSection() {
    return IngredientSuggestionsSection(
      sectionLabel: 'Nguyên liệu',
      sectionTitle: 'Gợi ý công thức nấu',
      sectionDescription: 'Nhập nguyên liệu và khám phá công thức',
      suggestions: _getSuggestionCards(),
    );
  }

  List<SuggestionCardData> _getSuggestionCards() {
    return [
      SuggestionCardData(
        category: 'Gợi ý',
        title: 'Công thức hôm nay',
        description: 'Tìm công thức phù hợp với nguyên liệu của bạn',
        buttonText: 'Tìm kiếm',
        imageUrl: "https://placehold.co/288x171",
        onButtonPressed: () => _handleSearchPressed(),
        onTap: () => _handleSuggestionTap("today-recipes"),
      ),
      SuggestionCardData(
        category: 'Nấu ăn',
        title: 'Công thức ngẫu nhiên',
        description: 'Khám phá công thức mới mỗi ngày',
        buttonText: 'Xem',
        imageUrl: "https://placehold.co/288x171",
        onButtonPressed: () => _handleRandomRecipePressed(),
        onTap: () => _handleSuggestionTap("random-recipes"),
      ),
    ];
  }

  // Event Handlers
  void _handleSearchChanged(String value) {
    // TODO: Implement search functionality
    debugPrint('Search changed: $value');
  }

  void _handleSearchSubmitted() {
    // TODO: Implement search submission
    debugPrint('Search submitted: ${_searchController.text}');
  }

  void _handleFilterSelected(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
    // TODO: Implement filter logic
    debugPrint('Filter selected: $filter');
  }

  void _handleViewAllPressed() {
    // TODO: Navigate to all recipes page
    debugPrint('View all pressed');
  }

  void _handleArticleTap(String articleId) {
    // TODO: Navigate to article detail page
    debugPrint('Article tapped: $articleId');
  }

  void _handleSearchPressed() {
    // TODO: Implement search functionality
    debugPrint('Search button pressed');
  }

  void _handleRandomRecipePressed() {
    // TODO: Implement random recipe functionality
    debugPrint('Random recipe button pressed');
  }

  void _handleSuggestionTap(String suggestionId) {
    // TODO: Navigate to suggestion detail page
    debugPrint('Suggestion tapped: $suggestionId');
  }
}