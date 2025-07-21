// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:water_tracker_app/app/extension/context_extension.dart';

class InsightMessage {
  InsightMessage._();

  static final _random = Random();

  static final _getRandomNumberForFacts = _random.nextInt(9);
  static final _getRandomNumberForBenefits = _random.nextInt(6);

  static String _getRandomFact(BuildContext context) {
    final index = _getRandomNumberForFacts;
    switch (index) {
      case 0:
        return context.loc.fact0;
      case 1:
        return context.loc.fact1;
      case 2:
        return context.loc.fact2;
      case 3:
        return context.loc.fact3;
      case 4:
        return context.loc.fact4;
      case 5:
        return context.loc.fact5;
      case 6:
        return context.loc.fact6;
      case 7:
        return context.loc.fact7;
      case 8:
        return context.loc.fact8;
      default:
        return context.loc.fact0;
    }
  }

  static String _getRandomBenefit(BuildContext context) {
    final index = _getRandomNumberForBenefits;
    switch (index) {
      case 0:
        return context.loc.benefit0;
      case 1:
        return context.loc.benefit1;
      case 2:
        return context.loc.benefit2;
      case 3:
        return context.loc.benefit3;
      case 4:
        return context.loc.benefit4;
      case 5:
        return context.loc.benefit5;
      default:
        return context.loc.benefit0;
    }
  }

  static Map<String, String> getHydrationFact(BuildContext context) {
    String icon = "💧";
    String title = context.loc.factTitle;
    String action = context.loc.factAction;

    return {
      "type": "fact",
      "icon": icon,
      "title": title,
      "content": _getRandomFact(context),
      "action": action,
    };
  }

  static Map<String, String> getHydrationBenefit(BuildContext context) {
    String icon = "🌟";
    String title = context.loc.benefitTitle;
    String action = context.loc.benefitAction;

    return {
      "type": "benefit",
      "icon": icon,
      "title": title,
      "content": '${_getRandomBenefit(context)}\n',
      "action": action,
    };
  }

  static Map<String, String> getHydrationReminderMessage(
    Duration timeUntilNextDrink,
  ) {
    String icon = "⏰";
    String title = "Next drink in";
    String content;
    String action;

    int minutes = timeUntilNextDrink.inMinutes;

    if (minutes <= 0) {
      content = "It's time to hydrate!";
      action = "Grab a glass of water now";
    } else if (minutes <= 10) {
      content = "$minutes minutes";
      action = "Get ready to hydrate soon";
    } else if (minutes <= 30) {
      content = "$minutes minutes";
      action = "Set a gentle reminder to keep you on track";
    } else {
      content = "$minutes minutes";
      action = "Stay mindful of your hydration schedule";
    }

    return {
      "type": "reminder",
      "icon": icon,
      "title": title,
      "content": '$content\n',
      "action": action,
    };
  }

  static Map<String, String> getAchievementMessage(
    BuildContext context,
    double progressPercentage,
  ) {
    String icon = "🏆";
    String title;
    String content;
    String action;

    int roundedProgress = progressPercentage.round();

    if (progressPercentage == 0) {
      title = context.loc.achievementTitle0;
      content = context.loc.achievementContent0;
      action = context.loc.achievementAction0;
    } else if (progressPercentage < 25) {
      title = context.loc.achievementTitle1;
      content = context.loc.achievementContent1(roundedProgress);
      action = context.loc.achievementAction1;
    } else if (progressPercentage < 50) {
      title = context.loc.achievementTitle2;
      content = context.loc.achievementContent2(roundedProgress);
      action = context.loc.achievementAction2;
    } else if (progressPercentage < 75) {
      title = context.loc.achievementTitle3;
      content = context.loc.achievementContent3(roundedProgress);
      action = context.loc.achievementAction3;
    } else if (progressPercentage < 100) {
      title = context.loc.achievementTitle4;
      content = context.loc.achievementContent4(roundedProgress);
      action = context.loc.achievementAction4;
    } else {
      title = context.loc.achievementTitle5;
      content = context.loc.achievementContent5;
      action = context.loc.achievementAction5;
    }

    return {
      "type": "achievement",
      "icon": icon,
      "title": title,
      "content": '$content\n',
      "action": action,
    };
  }

  static Map<String, String> getStreakMessage(
    BuildContext context,
    int currentStreak,
  ) {
    String icon = "🔥";
    String title;
    String content;
    String action;

    if (currentStreak == 0) {
      title = context.loc.streakTitle0;
      content = context.loc.streakContent0;
      action = context.loc.streakAction0;
    } else if (currentStreak < 1) {
      title = context.loc.streakTitle1;
      content = context.loc.streakContent1;
      action = context.loc.streakAction1;
    } else if (currentStreak < 5) {
      title = context.loc.streakTitle2(currentStreak);
      content = context.loc.streakContent2;
      action = context.loc.streakAction2;
    } else if (currentStreak < 10) {
      title = context.loc.streakTitle2(currentStreak);
      content = context.loc.streakContent3;
      action = context.loc.streakAction3;
    } else if (currentStreak < 30) {
      title = context.loc.streakTitle2(currentStreak);
      content = context.loc.streakContent4;
      action = context.loc.streakAction4;
    } else if (currentStreak < 100) {
      title = context.loc.streakTitle2(currentStreak);
      content = context.loc.streakContent5;
      action = context.loc.streakAction5;
    } else {
      title = context.loc.streakTitle2(currentStreak);
      content = context.loc.streakContent6;
      action = context.loc.streakAction6;
    }

    return {
      "type": "streak",
      "icon": icon,
      "title": title,
      "content": '$content\n',
      "action": action,
    };
  }
}
