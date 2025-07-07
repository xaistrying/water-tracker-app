// Dart imports:
import 'dart:math';

class InsightMessage {
  InsightMessage._();

  static final List<String> _facts = [
    "Your body is about 60% water, vital for nearly every function.",
    "Your brain is 75% water. Even mild dehydration can affect concentration and mood.",
    "You can live for weeks without food, but only days without water.",
    "Hydration helps regulate your body temperature and prevent headaches.",
    "Hydration improves circulation and supports a healthy immune system.",
    "Drinking water helps cushion your joints and muscles during activity.",
    "Staying hydrated helps your brain work better, improving focus and memory.",
    "Water is aiding digestion and supporting your metabolism.",
    "Water is helping deliver nutrients to your cells and boosting energy.",
  ];

  static final List<String> _benefits = [
    "Water is helping flush toxins from your kidneys and keeping your skin glowing.",
    "Hydration is supporting your joints and reducing fatigue.",
    "You're maintaining focus and mental clarity by staying hydrated.",
    "You're supporting healthy skin, mood, and overall well-being right now.",
    "Your heart is working more efficiently thanks to proper hydration.",
    "You're helping your whole body feel better just by staying hydrated.",
  ];

  static final _random = Random();
  static final _factContent = _facts[_random.nextInt(_facts.length)];
  static final _benefitContent = _benefits[_random.nextInt(_benefits.length)];

  static Map<String, String> getHydrationFact() {
    String icon = "💧";
    String title = "Did you know?";
    String action = "Keep the good work going!";

    return {
      "type": "fact",
      "icon": icon,
      "title": title,
      "content": _factContent,
      "action": action,
    };
  }

  static Map<String, String> getHydrationBenefit() {
    String icon = "🌟";
    String title = "How water helps?";
    String action = "Keep the good work going!";

    return {
      "type": "benefit",
      "icon": icon,
      "title": title,
      "content": '$_benefitContent\n',
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

  static Map<String, String> getAchievementMessage(double progressPercentage) {
    String icon = "🏆";
    String title;
    String content;
    String action;

    int roundedProgress = progressPercentage.round();

    if (progressPercentage == 0) {
      title = "Let's begin!";
      content =
          "You haven't started yet, but there's still time to crush your goal.";
      action = "Take the first step";
    } else if (progressPercentage < 25) {
      title = "Off to a start!";
      content =
          "You're $roundedProgress% towards your daily goal. Every bit counts!";
      action = "Keep it going";
    } else if (progressPercentage < 50) {
      title = "Making progress!";
      content = "You're $roundedProgress% there. Stay focused and keep moving!";
      action = "You're halfway there";
    } else if (progressPercentage < 75) {
      title = "Over halfway!";
      content =
          "You're $roundedProgress% towards your goal. Great effort so far!";
      action = "Push a little more";
    } else if (progressPercentage < 100) {
      title = "Almost there!";
      content =
          "You're $roundedProgress% in! One last push to reach your goal.";
      action = "Finish strong";
    } else {
      title = "Goal achieved!";
      content = "You hit 100% of your daily goal. Amazing work!";
      action = "Celebrate your win";
    }

    return {
      "type": "achievement",
      "icon": icon,
      "title": title,
      "content": '$content\n',
      "action": action,
    };
  }

  static Map<String, String> getStreakMessage(int currentStreak) {
    String icon = "🔥";
    String title;
    String content;
    String action;

    if (currentStreak == 1) {
      title = "First day streak!";
      content = "Great start! A journey begins with a single step.";
      action = "Keep the momentum going";
    } else if (currentStreak < 5) {
      title = "$currentStreak day streak!";
      content = "You're picking up steam. Small wins add up.";
      action = "Stay on track";
    } else if (currentStreak < 10) {
      title = "$currentStreak day streak!";
      content = "Solid progress! You're forming a strong habit.";
      action = "Don't lose your rhythm";
    } else if (currentStreak < 30) {
      title = "$currentStreak day streak!";
      content = "Impressive dedication. You're making this a lifestyle.";
      action = "Keep pushing forward";
    } else if (currentStreak < 100) {
      title = "$currentStreak day streak!";
      content = "You're a force of habit! This is how change happens.";
      action = "Inspire others";
    } else {
      title = "$currentStreak day streak!";
      content = "Legendary commitment. You're an inspiration.";
      action = "Be proud and keep going";
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
