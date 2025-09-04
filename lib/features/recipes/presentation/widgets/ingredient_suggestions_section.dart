import 'package:flutter/material.dart';
import 'suggestion_card.dart';
import '../../../../core/theme/app_text_styles.dart';

class IngredientSuggestionsSection extends StatelessWidget {
  final String sectionLabel;
  final String sectionTitle;
  final String sectionDescription;
  final List<SuggestionCardData> suggestions;

  const IngredientSuggestionsSection({
    super.key,
    required this.sectionLabel,
    required this.sectionTitle,
    required this.sectionDescription,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 48),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Color(0xFFFFDFDA),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 80,
        children: [
          _buildSectionHeader(),
          _buildSuggestionsGrid(),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 768),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          _buildSectionLabel(),
          _buildTitleAndDescription(),
        ],
      ),
    );
  }

  Widget _buildSectionLabel() {
    return Text(
      sectionLabel,
      textAlign: TextAlign.center,
      style: AppTextStyles.withSize(AppTextStyles.regularSemiBold, 16),
    );
  }

  Widget _buildTitleAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 24,
      children: [
        SizedBox(
          width: 768,
          child: Text(
            sectionTitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2,
          ),
        ),
        SizedBox(
          width: 768,
          child: Text(
            sectionDescription,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumNormal,
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestionsGrid() {
    return Column(
      spacing: 32,
      children: [
        Row(
          spacing: 32,
          children: [
            _buildLargeCard(),
            ...suggestions.map((suggestion) => 
              SuggestionCard(
                category: suggestion.category,
                title: suggestion.title,
                description: suggestion.description,
                buttonText: suggestion.buttonText,
                imageUrl: suggestion.imageUrl,
                onButtonPressed: suggestion.onButtonPressed,
                onTap: suggestion.onTap,
              )
            ).toList(),
          ],
        ),
      ],
    );
  }

  Widget _buildLargeCard() {
    return Container(
      width: 640,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFFDFDA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Color(0xFF040709),
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 24,
                children: [
                  _buildLargeCardContent(),
                  _buildLargeCardButton(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 394,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://placehold.co/320x394"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeCardContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Công thức',
          style: AppTextStyles.withSize(AppTextStyles.regularSemiBold, 16),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            SizedBox(
              width: 272,
              child: Text(
                'Gợi ý theo nguyên liệu có sẵn',
                style: AppTextStyles.h5,
              ),
            ),
            SizedBox(
              width: 272,
              child: Text(
                'Khám phá món ăn từ nguyên liệu của bạn',
                style: AppTextStyles.regularNormal,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLargeCardButton() {
    return GestureDetector(
      onTap: () {
        // TODO: Handle ingredient search
        debugPrint('Ingredient search pressed');
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Text(
            'Khám phá',
            style: AppTextStyles.mediumMedium,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(),
            child: const Icon(
              Icons.explore,
              size: 24,
              color: Color(0xFF040709),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionCardData {
  final String category;
  final String title;
  final String description;
  final String buttonText;
  final String? imageUrl;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onTap;

  const SuggestionCardData({
    required this.category,
    required this.title,
    required this.description,
    required this.buttonText,
    this.imageUrl,
    this.onButtonPressed,
    this.onTap,
  });
}