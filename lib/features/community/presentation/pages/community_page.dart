import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/share_recipe_section.dart';
import '../widgets/feedback_share_section.dart';
import '../widgets/rating_system_section.dart';
import '../widgets/cooking_knowledge_section.dart';
import '../widgets/favorite_chefs_section.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 1024;
        final horizontalPadding = isWideScreen ? 64.0 : 24.0;
        
        return SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(
                isWideScreen: isWideScreen,
                horizontalPadding: horizontalPadding,
              ),
              // Recipe Sharing Section
              ShareRecipeSection(
                isWideScreen: isWideScreen,
                horizontalPadding: horizontalPadding,
              ),
              // Feedback and Sharing Section
              FeedbackShareSection(
                isWideScreen: isWideScreen,
                horizontalPadding: horizontalPadding,
              ),
              // Rating System Section
              RatingSystemSection(
                isWideScreen: isWideScreen,
                horizontalPadding: horizontalPadding,
              ),
              // Cooking Knowledge Section
              CookingKnowledgeSection(
                isWideScreen: isWideScreen,
                horizontalPadding: horizontalPadding,
              ),
              // Favorite Chefs Section
              FavoriteChefsSection(
                isWideScreen: isWideScreen,
                horizontalPadding: horizontalPadding,
              )

            ],
          ),
        );
      },
    );
  }
}