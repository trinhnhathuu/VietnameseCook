import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/theme/app_text_styles.dart';

class IngredientCard {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonTap;
  final String? imageUrl;
  IngredientCard({
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonTap,
    this.imageUrl,
  });
}

class IngredientSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<IngredientCard> cards;
  final String? imageUrl;

  const IngredientSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.cards,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 80,
          children: [_buildHeader(), Expanded(child: _buildCardsSection())],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.regularSemiBold.copyWith(
            color: const Color(0xFF040709),
            height: 1.50,
          ),
        ),
        IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 24,
            children: [
              SizedBox(
                width: 768,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2.copyWith(
                    color: const Color(0xFF040709),
                    fontWeight: FontWeight.w500,
                    height: 1.20,
                    letterSpacing: -0.52,
                  ),
                ),
              ),
              SizedBox(
                width: 768,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumNormal.copyWith(
                    color: const Color(0xFF040709),
                    height: 1.50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardsSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              // Left cards
              ...cards
                  .take(2)
                  .map(
                    (card) => Expanded(
                      child: _IngredientCard(
                        title: card.title,
                        description: card.description,
                        buttonText: card.buttonText,
                        onButtonTap: card.onButtonTap,
                        imageUrl: card.imageUrl,
                      ),
                    ),
                  ),
              // Right image card
              if (imageUrl != null)
                Container(
                  width: 640,
                  height: 360,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            children: [
                              Text(
                                'Chọn',
                                style: AppTextStyles.regularSemiBold.copyWith(
                                  color: const Color(0xFF040709),
                                ),
                              ),
                              SizedBox(
                                width: 272,
                                child: Text(
                                  'Hướng dẫn sử dụng nguyên liệu',
                                  style: AppTextStyles.h5.copyWith(
                                    color: const Color(0xFF040709),
                                    fontWeight: FontWeight.w500,
                                    height: 1.40,
                                    letterSpacing: -0.28,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Cách sử dụng và bảo quản nguyên liệu',
                                  style: AppTextStyles.mediumNormal.copyWith(
                                    color: const Color(0xFF040709),
                                ),
                              ),),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      'Hướng dẫn',
                                      style: AppTextStyles.regularSemiBold.copyWith(
                                        color: const Color(0xFF040709),
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.black26,)
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
            ],
          ),
        ),
      ],
    );
  }
}

class _IngredientCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback? onButtonTap;
  final String? imageUrl;

  const _IngredientCard({
    required this.title,
    required this.description,
    required this.buttonText,
    this.onButtonTap,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            SizedBox(
              width: 240,
              child: Text(
                title,
                style: AppTextStyles.h5.copyWith(
                  color: const Color(0xFF040709),
                  height: 1.40,
                  letterSpacing: -0.28,
                ),
              ),
            ),
            SizedBox(
              width: 240,
              child: Text(
                description,
                style: AppTextStyles.mediumNormal.copyWith(
                  color: const Color(0xFF040709),
                  height: 1.50,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: onButtonTap,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: AppTextStyles.mediumNormal.copyWith(
                      color: const Color(0xFF040709),
                      height: 1.50,
                    ),
                  ),
                ),
              ),
            ),

            // Expanded(child: Image.network(imageUrl!))
          ],
        ),
      ),
    );
  }
}
