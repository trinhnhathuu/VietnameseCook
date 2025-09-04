import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String title;
  final String description;
  final String authorName;
  final String authorImageUrl;
  final String publishDate;
  final String readTime;
  final VoidCallback? onTap;

  const ArticleCard({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: Color(0xFF040709),
              ),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildImage(),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: 270,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          _buildArticleInfo(),
          _buildAuthorInfo(),
        ],
      ),
    );
  }

  Widget _buildArticleInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        _buildCategoryChip(),
        _buildTitle(),
        _buildDescription(),
      ],
    );
  }

  Widget _buildCategoryChip() {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        category,
        style: AppTextStyles.withSize(
          AppTextStyles.regularSemiBold,
          14,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: AppTextStyles.h5,
    );
  }

  Widget _buildDescription() {
    return Text(
      description,
      style: AppTextStyles.regularNormal,
    );
  }

  Widget _buildAuthorInfo() {
    return Row(
      spacing: 16,
      children: [
        _buildAuthorAvatar(),
        _buildAuthorDetails(),
      ],
    );
  }

  Widget _buildAuthorAvatar() {
    return Container(
      width: 48,
      height: 48,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: NetworkImage(authorImageUrl),
          fit: BoxFit.cover,
        ),
        shape: const OvalBorder(),
      ),
    );
  }

  Widget _buildAuthorDetails() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            authorName,
            style: AppTextStyles.withSize(
              AppTextStyles.regularSemiBold,
              14,
            ),
          ),
          Row(
            spacing: 8,
            children: [
              Text(
                publishDate,
                style: AppTextStyles.withSize(
                  AppTextStyles.regularNormal,
                  14,
                ),
              ),
              Text(
                '•',
                style: AppTextStyles.withSize(
                  AppTextStyles.mediumNormal,
                  18,
                ),
              ),
              Text(
                readTime,
                style: AppTextStyles.withSize(
                  AppTextStyles.regularNormal,
                  14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}