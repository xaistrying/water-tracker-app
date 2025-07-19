// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Project imports:
import 'package:water_tracker_app/app/bloc/app_data/app_data_cubit.dart';
import 'package:water_tracker_app/app/constant/insight_message.dart';
import 'package:water_tracker_app/app/theme/app_color.dart';
import '../../../app/enum/emoji_type.dart';
import '../../../app/theme/app_dimens.dart';

class HydrationInsightsCard extends StatefulWidget {
  const HydrationInsightsCard({super.key});

  @override
  State<HydrationInsightsCard> createState() => _HydrationInsightsCardState();
}

class _HydrationInsightsCardState extends State<HydrationInsightsCard> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return _insightCard(context);
  }

  Widget _insightCard(BuildContext context) {
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
          BlocBuilder<AppDataCubit, AppDataState>(
            builder: (context, state) {
              // Streak
              final streaks = state.data.numberOfStreak;

              // Achievement
              final dailyGoal = state.data.dailyGoal;
              final dailyIntake = state.data.dailyIntake;
              final progress = dailyIntake / dailyGoal * 100;

              return ExpandablePageView.builder(
                controller: _pageController,
                itemCount: EmojiType.values.length,
                itemBuilder: (BuildContext context, int index) {
                  var insight = {
                    "type": "",
                    "icon": "",
                    "title": "",
                    "content": "",
                    "action": "",
                  };
                  switch (EmojiType.values[index]) {
                    case EmojiType.streak:
                      insight = InsightMessage.getStreakMessage(streaks);
                      break;
                    case EmojiType.achievement:
                      insight = InsightMessage.getAchievementMessage(progress);
                      break;
                    case EmojiType.benefit:
                      insight = InsightMessage.getHydrationBenefit();
                      break;
                    case EmojiType.fact:
                      insight = InsightMessage.getHydrationFact();
                      break;
                    // case EmojiType.reminder:
                    //   insight = InsightMessage.getHydrationReminderMessage(
                    //     Duration(seconds: 120),
                    //   );
                    //   break;
                  }
                  return _insightContentCard(
                    context,
                    index: index,
                    emoji: insight['icon'] ?? '',
                    title: insight['title'] ?? '',
                    content: insight['content'] ?? '',
                    action: insight['action'] ?? '',
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _insightContentCard(
    BuildContext context, {
    required String emoji,
    required String title,
    required int index,
    required String content,
    required String action,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emoji icon
            RichText(
              text: TextSpan(
                text: emoji,
                style: TextStyle(fontFamily: 'NotoColorEmoji'),
              ),
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
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.getWhiteBlack(context),
                        ),
                      ),
                      AnimatedSmoothIndicator(
                        activeIndex: index,
                        count: EmojiType.values.length,
                        duration: Duration.zero,
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
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: AppColor.getContentColor(context),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Action
                  Text(
                    action,
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
    );
  }
}
