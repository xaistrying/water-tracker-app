// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:water_tracker_app/app/theme/app_color.dart';
import '../../../app/theme/app_dimens.dart';

class HydrationInsightsCard extends StatelessWidget {
  const HydrationInsightsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded example data
    final currentInsight = {
      "type": "benefit",
      "icon": "✨",
      "title": "Right now",
      "content":
          "Water is helping flush toxins from your kidneys and keeping your skin glowing.",
      "action": "Keep the good work going!",
    };

    return Container(
      decoration: BoxDecoration(
        gradient: AppColor.getHydrationInsightsCardColor(context),
        borderRadius: BorderRadius.circular(AppDimens.borderRadius8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Gradient-like soft circle background decorations
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColor.getTopRightCircleColor(context),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: -40,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColor.getBottomLeftCircleColor(context),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Main card content
          Padding(
            padding: const EdgeInsets.all(AppDimens.padding16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Emoji icon
                Text(
                  currentInsight["icon"]!,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(width: 12),

                // Insight content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title + indicators
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentInsight["title"]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.getWhiteBlack(context),
                            ),
                          ),
                          AnimatedSmoothIndicator(
                            activeIndex: 1,
                            count: 6,
                            effect: SwapEffect(
                              dotHeight: 8,
                              dotWidth: 8,
                              spacing: 4,
                              activeDotColor: AppColor.getProgressDotColor(
                                context,
                                isActive: true,
                              ),
                              dotColor: AppColor.getProgressDotColor(
                                context,
                                isActive: false,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Content
                      Text(
                        currentInsight["content"]!,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: AppColor.getContentColor(context),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Action
                      Text(
                        currentInsight["action"]!,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColor.getBlueCyanColor(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
