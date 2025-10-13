import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../core/theme/app_text_styles.dart';

class CommunityCard {
  final String image;
  final String title;
  final String description;
  final IconData icon;

  CommunityCard({
    required this.image,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class CommunitySection extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<CommunityCard> cards;
  final String primaryButtonText;
  final String secondaryButtonText;
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;

  const CommunitySection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.cards,
    required this.primaryButtonText,
    required this.secondaryButtonText,
    this.onPrimaryButtonTap,
    this.onSecondaryButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.xl * 2, vertical: AppSizes.xl * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 32,
        children: [
          Text(title, textAlign: TextAlign.center, style: AppTextStyles.regularSemiBold),
          const SizedBox(height: 16),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 768,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: 768,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.mediumNormal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 60,
            children: cards.map((card) => Expanded(
              child: _CommunityCard(
                image: card.image,
                title: card.title,
                description: card.description,
                icon: _buildIcon(card.icon),
              ),
            )).toList(),
          ),
          Center(
            child: SizedBox(
              width: 400,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 24,
                children: [
                  GestureDetector(
                    onTap: onPrimaryButtonTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      clipBehavior: Clip.antiAlias,
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
                      child: Text(
                        primaryButtonText,
                        style: const TextStyle(
                          color: Color(0xFF040709),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onSecondaryButtonTap,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Text(
                            secondaryButtonText,
                            style: const TextStyle(
                              color: Color(0xFF040709),
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined, size: 12, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData iconData) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(iconData, color: Colors.white, size: 24),
    );
  }
}

class _CommunityCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Widget icon;

  const _CommunityCard({
    required this.image,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 407.68
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            width: double.infinity,
            height: 234,
            decoration: ShapeDecoration(
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 395,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, textAlign: TextAlign.center, style: AppTextStyles.h4),
                const SizedBox(height: 24),
                Text(description, textAlign: TextAlign.center, style: AppTextStyles.regularNormal),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

