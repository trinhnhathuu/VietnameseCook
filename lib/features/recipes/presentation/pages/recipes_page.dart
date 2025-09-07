import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../widgets/common/community_section.dart';
import '../../../../widgets/common/ingredient_section.dart';
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
            /// tiêu đề page
            _buildFeaturedSection(),
            /// Coong thưc nấu ăn
            _buildSeasonRecipesSection(),
            /// gợi ý công thức
            _buildIngredientSuggestionsSection(),

            CommunitySection(
              title: 'Hướng dẫn',
              subtitle: 'Hướng dẫn từng bước nấu ăn',
              description: 'Khám phá các công thức nấu ăn chi tiết với hướng dẫn từng bước. Chúng tôi giúp bạn dễ dàng thực hiện món ăn yêu thích.',
              cards: [
                CommunityCard(
                  image: 'https://images.pexels.com/photos/3152763 7/pexels-photo-31527637.jpeg',
                  title: 'Các bước thực hiện món ăn',
                  description: 'Mỗi công thức đều có hướng dẫn rõ ràng ',
                  icon: Icons.star_rate,
                ),
                CommunityCard(
                  image: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
                  title: 'Hướng dẫn sử dụng các nguyên liệu',
                  description: 'Chúng tôi cung cấp thông tin chi tiết về nguyên liệu.',
                  icon: Icons.emoji_events,
                ),
                CommunityCard(
                  image: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
                  title: 'Mẹo và kỹ thuật nấu ăn',
                  description: 'Nhận những mẹo hữu ích từ các đầu bếp chuyên nghiệp. ',
                  icon: Icons.people,
                ),
              ],
              primaryButtonText: 'Tìm hiểu',
              secondaryButtonText: 'Bắt đầu',
              onPrimaryButtonTap: () {
                // TODO: Implement primary button action
              },
              onSecondaryButtonTap: () {
                // TODO: Implement secondary button action
              },
            ),
            /// danh sách nguyên liệu
            IngredientSection(
              title: 'Nguyên liệu',
              subtitle: 'Danh sách nguyên liệu',
              description: 'Các nguyên liệu cần thiết cho công thức',
              cards: [
                IngredientCard(
                  title: 'Chi tiết nguyên liệu cho món ăn',
                  description: 'Tìm hiểu các nguyên liệu cần thiết',
                  buttonText: 'Xem',
                  imageUrl: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
                  onButtonTap: () {
                    // TODO: Implement view action
                  },
                ),
                IngredientCard(
                  title: 'Nguyên liệu chính cho công thức',
                  description: 'Khám phá các thành phần đặc trưng',
                  buttonText: 'Tìm',
                  onButtonTap: () {
                    // TODO: Implement search action
                  },
                ),
              ],
              imageUrl: 'https://images.pexels.com/photos/31527637/pexels-photo-31527637.jpeg',
            ),

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
        imageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
        category: "Món ăn",
        title: "Cách làm phở bò ngon tuyệt",
        description: "Hướng dẫn chi tiết từng bước để nấu phở bò.",
        authorName: "Nguyễn Văn A",
        authorImageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
        publishDate: "11 Jan 2022",
        readTime: "5 min read",
        onTap: () => _handleArticleTap("pho-bo"),
      ),
      ArticleData(
        imageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
        category: "Món ăn",
        title: "Cách làm bánh xèo miền Nam",
        description: "Bánh xèo giòn rụm, thơm ngon và dễ làm.",
        authorName: "Trần Thị B",
        authorImageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
        publishDate: "12 Jan 2022",
        readTime: "7 min read",
        onTap: () => _handleArticleTap("banh-xeo"),
      ),
      ArticleData(
        imageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
        category: "Món ăn",
        title: "Cách làm bánh xèo miền Nam",
        description: "Bánh xèo giòn rụm, thơm ngon và dễ làm.",
        authorName: "Trần Thị B",
        authorImageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
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
        imageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
        onButtonPressed: () => _handleSearchPressed(),
        onTap: () => _handleSuggestionTap("today-recipes"),
      ),
      SuggestionCardData(
        category: 'Nấu ăn',
        title: 'Công thức ngẫu nhiên',
        description: 'Khám phá công thức mới mỗi ngày',
        buttonText: 'Xem',
        imageUrl: "https://images.pexels.com/photos/33771009/pexels-photo-33771009.jpeg",
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