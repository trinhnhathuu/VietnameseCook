import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';

class SuggestionCard extends StatelessWidget {
  final String category;
  final String title;
  final String description;
  final String buttonText;
  final String? imageUrl;
  final VoidCallback? onButtonPressed;
  final VoidCallback? onTap;

  const SuggestionCard({
    super.key,
    required this.category,
    required this.title,
    required this.description,
    required this.buttonText,
    this.imageUrl,
    this.onButtonPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 394,
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
          child: Column(
            children: [
              _buildContent(),
              if (imageUrl != null) _buildImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 24,
        children: [
          _buildTextContent(),
          _buildActionButton(),
        ],
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        _buildCategoryLabel(),
        _buildTitleAndDescription(),
      ],
    );
  }

  Widget _buildCategoryLabel() {
    return Text(
      category,
      style: AppTextStyles.withSize(AppTextStyles.regularSemiBold, 16),
    );
  }

  Widget _buildTitleAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        SizedBox(
          width: 272,
          child: Text(
            title,
            style: AppTextStyles.h5,
          ),
        ),
        SizedBox(
          width: 272,
          child: Text(
            description,
            style: AppTextStyles.regularNormal,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Text(
              buttonText,
              style: AppTextStyles.mediumMedium,
            ),
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(),
              child: const Icon(
                Icons.arrow_forward,
                size: 24,
                color: Color(0xFF040709),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      width: double.infinity,
      height: 171,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}