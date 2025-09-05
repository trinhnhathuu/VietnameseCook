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
              if (imageUrl != null) Expanded(child: _buildImage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
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
          child: Text(
            title,
            style: AppTextStyles.h5,
          ),
        ),
        SizedBox(
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
      height: 171,
      child: Image.network(
        imageUrl!,
        fit: BoxFit.fill,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[200],
            child: Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: 50,
            ),
          );
        },
      ),
    );
  }
}