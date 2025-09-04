import 'package:flutter/material.dart';
import 'article_card.dart';
import '../../../../core/theme/app_text_styles.dart';

class SeasonRecipesSection extends StatelessWidget {
  final String sectionTitle;
  final String sectionSubtitle;
  final List<ArticleData> articles;
  final VoidCallback? onViewAll;

  const SeasonRecipesSection({
    super.key,
    required this.sectionTitle,
    required this.sectionSubtitle,
    required this.articles,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 48),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        spacing: 80,
        children: [
          _buildConstrainedContent(),
        ],
      ),
    );
  }

  Widget _buildConstrainedContent() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1280),
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 80,
          children: [
            _buildSectionHeader(),
            _buildArticlesGrid(),
            _buildViewAllButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 768),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          _buildBlogLabel(),
          _buildTitleAndSubtitle(),
        ],
      ),
    );
  }

  Widget _buildBlogLabel() {
    return Text(
      'Blog',
      style: AppTextStyles.withSize(AppTextStyles.regularSemiBold, 16),
    );
  }

  Widget _buildTitleAndSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 24,
      children: [
        SizedBox(
          width: 768,
          child: Text(
            sectionTitle,
            style: AppTextStyles.h2,
          ),
        ),
        SizedBox(
          width: 768,
          child: Text(
            sectionSubtitle,
            style: AppTextStyles.mediumNormal,
          ),
        ),
      ],
    );
  }

  Widget _buildArticlesGrid() {
    return Column(
      spacing: 64,
      children: [
        Row(
          spacing: 32,
          children: articles.map((article) => 
            ArticleCard(
              imageUrl: article.imageUrl,
              category: article.category,
              title: article.title,
              description: article.description,
              authorName: article.authorName,
              authorImageUrl: article.authorImageUrl,
              publishDate: article.publishDate,
              readTime: article.readTime,
              onTap: article.onTap,
            )
          ).toList(),
        ),
      ],
    );
  }

  Widget _buildViewAllButton() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 16,
        children: [
          GestureDetector(
            onTap: onViewAll,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFF040709),
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child:  Text(
                'Xem tất cả',
                style: AppTextStyles.mediumMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleData {
  final String imageUrl;
  final String category;
  final String title;
  final String description;
  final String authorName;
  final String authorImageUrl;
  final String publishDate;
  final String readTime;
  final VoidCallback? onTap;

  const ArticleData({
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.description,
    required this.authorName,
    required this.authorImageUrl,
    required this.publishDate,
    required this.readTime,
    this.onTap,
  });
}