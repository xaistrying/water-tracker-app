// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get statistics => 'Statistics';

  @override
  String get statistics_description => 'Your hydration insights';

  @override
  String get settings => 'Settings';

  @override
  String get settings_description => 'Customize your experience';

  @override
  String dailyGoalText(Object value, Object unit) {
    return 'of $value$unit daily goal';
  }

  @override
  String remaining(Object value, Object unit) {
    return '$value$unit remaining';
  }

  @override
  String get custom => 'Custom';

  @override
  String get recent => 'Recent';

  @override
  String get more => 'More';

  @override
  String get no_water_intake_data => 'You haven\'t had any water yet.';

  @override
  String get day_streak => 'Day Streak';

  @override
  String get weekly_avg => 'Weekly Avg';

  @override
  String get this_week => 'This Week';

  @override
  String get this_month => 'This Month';

  @override
  String get mon => 'Mon';

  @override
  String get tue => 'Tue';

  @override
  String get wed => 'Wed';

  @override
  String get thu => 'Thu';

  @override
  String get fri => 'Fri';

  @override
  String get sat => 'Sat';

  @override
  String get sun => 'Sun';

  @override
  String get goals_met => 'Goals Met';

  @override
  String get success_rate => 'Success Rate';

  @override
  String get daily_goal => 'Daily Goal';

  @override
  String get advanced_mode => 'Advanced Mode';

  @override
  String advanced_mode_description(Object value, Object unit) {
    return 'Unlock goal to $value$unit';
  }

  @override
  String get advanced_mode_dialog =>
      'Very high water intake goals should be discussed with a healthcare professional. Excessive water consumption can be harmful.';

  @override
  String get change_daily_goal => 'Change Daily Goal';

  @override
  String get confirm => 'Confirm';

  @override
  String get cancel => 'Cancel';

  @override
  String get change_daily_goal_dialog =>
      'Are you sure you want to change your daily goal?';

  @override
  String get appearance => 'Appearance';

  @override
  String get dark_mode => 'Dark Mode';

  @override
  String get dark_mode_description => 'Switch to dark theme';

  @override
  String get units => 'Units';

  @override
  String get units_description => 'Milliliters or fluuid ounces';

  @override
  String get language => 'Language';

  @override
  String get reminders => 'Reminders';

  @override
  String get enable_reminders => 'Enable Reminders';

  @override
  String get enable_reminders_description => 'Get notified to drink water';

  @override
  String get sound_effects => 'Sound Effects';

  @override
  String get sound_effects_description => 'Play sound for actions';

  @override
  String get reminder_interval => 'Reminder Interval';

  @override
  String get active_hours => 'Active Hours';

  @override
  String get active_hours_description =>
      'Reminders will be active during these hours';

  @override
  String get hydration_calculator => 'Hydration Calculator';

  @override
  String get hydration_calculator_description =>
      'Calculate your personalized daily water goal based on your body weight and activity level';

  @override
  String get body_weight => 'Body Weight';

  @override
  String get daily_exercise_time => 'Daily Exercise Time';

  @override
  String get recommended_daily_intake => 'Recommended Daily Intake';

  @override
  String base(Object value) {
    return 'Base: $value (based on body weight)';
  }

  @override
  String exercise(Object value, Object min) {
    return 'Exercise: +$value ($min min activity)';
  }

  @override
  String get apply_recommended_goal => 'Apply Recommended Goal';

  @override
  String apply_recommended_goal_success_dialog(Object value, Object unit) {
    return 'Your new daily goal will be set to $value$unit. Would you like to apply this change?';
  }

  @override
  String apply_recommended_goal_failure_dialog(
    Object value1,
    Object value2,
    Object unit,
  ) {
    return 'Your goal should be between $value1$unit and $value2$unit. Let\'s tweak it and try again!';
  }

  @override
  String get invalid_goal_amount => 'Invalid Goal Amount';

  @override
  String get close => 'Close';

  @override
  String get quick_add_amounts => 'Quick Add Amounts';

  @override
  String get quick_add_amounts_description =>
      'Customize your quick-add buttons for common drink sizes';

  @override
  String get button => 'Button';

  @override
  String get tip => 'Tip';

  @override
  String get quick_add_amounts_tip =>
      'Set these to your most common drink sizes (e.g., your favorite glass, water bottle, or mug capacity)';

  @override
  String get reset_to_default_value => 'Reset to Default Value';

  @override
  String get reset_quick_add_confirmation =>
      'This will reset your Quick-add buttons to their default values.';

  @override
  String get data_and_storage => 'Data & Storage';

  @override
  String get data_and_storage_description =>
      'Manage how your water intake data is stored and retained.';

  @override
  String get day => 'Day';

  @override
  String get week => 'Week';

  @override
  String get month => 'Month';

  @override
  String get storage_info => 'Storage Info';

  @override
  String get storage_info_content =>
      'Your data is stored locally on your device. Shorter retention periods help keep your app running smoothly.';

  @override
  String get streakTitle0 => 'No streak yet – let\'s fix that!';

  @override
  String get streakTitle1 => 'First day streak!';

  @override
  String streakTitle2(Object value) {
    return '$value day streak!';
  }

  @override
  String get streakContent0 => 'Every habit starts with one small action.';

  @override
  String get streakContent1 =>
      'Great start! A journey begins with a single step.';

  @override
  String get streakContent2 => 'You\'re picking up steam. Small wins add up.';

  @override
  String get streakContent3 =>
      'Solid progress! You\'re forming a strong habit.';

  @override
  String get streakContent4 =>
      'Impressive dedication. You\'re making this a lifestyle.';

  @override
  String get streakContent5 =>
      'You\'re a force of habit! This is how change happens.';

  @override
  String get streakContent6 => 'Legendary commitment. You\'re an inspiration.';

  @override
  String get streakAction0 => 'Take the first step';

  @override
  String get streakAction1 => 'Keep the momentum going';

  @override
  String get streakAction2 => 'Stay on track';

  @override
  String get streakAction3 => 'Don\'t lose your rhythm';

  @override
  String get streakAction4 => 'Keep pushing forward';

  @override
  String get streakAction5 => 'Inspire others';

  @override
  String get streakAction6 => 'Be proud and keep going';

  @override
  String get achievementTitle0 => 'Let\'s begin!';

  @override
  String get achievementTitle1 => 'Off to a start!';

  @override
  String get achievementTitle2 => 'Making progress!';

  @override
  String get achievementTitle3 => 'Over halfway!';

  @override
  String get achievementTitle4 => 'Almost there!';

  @override
  String get achievementTitle5 => 'Goal achieved!';

  @override
  String get achievementContent0 =>
      'You haven\'t started yet, but there\'s still time to crush your goal.';

  @override
  String achievementContent1(Object value) {
    return 'You\'re $value% towards your daily goal. Every bit counts!';
  }

  @override
  String achievementContent2(Object value) {
    return 'You\'re $value% there. Stay focused and keep moving!';
  }

  @override
  String achievementContent3(Object value) {
    return 'You\'re $value% towards your goal. Great effort so far!';
  }

  @override
  String achievementContent4(Object value) {
    return 'You\'re $value% in! One last push to reach your goal.';
  }

  @override
  String get achievementContent5 =>
      'You hit 100% of your daily goal. Amazing work!';

  @override
  String get achievementAction0 => 'Take the first step';

  @override
  String get achievementAction1 => 'Keep it going';

  @override
  String get achievementAction2 => 'You\'re halfway there';

  @override
  String get achievementAction3 => 'Push a little more';

  @override
  String get achievementAction4 => 'Finish strong';

  @override
  String get achievementAction5 => 'Celebrate your win';

  @override
  String get benefitTitle => 'How water helps?';

  @override
  String get benefitAction => 'Keep the good work going!';

  @override
  String get fact0 =>
      'Your body is about 60% water, vital for nearly every function.';

  @override
  String get fact1 =>
      'Your brain is 75% water. Even mild dehydration can affect concentration and mood.';

  @override
  String get fact2 =>
      'You can live for weeks without food, but only days without water.';

  @override
  String get fact3 =>
      'Hydration helps regulate your body temperature and prevent headaches.';

  @override
  String get fact4 =>
      'Hydration improves circulation and supports a healthy immune system.';

  @override
  String get fact5 =>
      'Drinking water helps cushion your joints and muscles during activity.';

  @override
  String get fact6 =>
      'Staying hydrated helps your brain work better, improving focus and memory.';

  @override
  String get fact7 =>
      'Water is aiding digestion and supporting your metabolism.';

  @override
  String get fact8 =>
      'Water is helping deliver nutrients to your cells and boosting energy.';

  @override
  String get factTitle => 'Did you know?';

  @override
  String get factAction => 'Keep the good work going!';

  @override
  String get benefit0 =>
      'Water is helping flush toxins from your kidneys and keeping your skin glowing.';

  @override
  String get benefit1 =>
      'Hydration is supporting your joints and reducing fatigue.';

  @override
  String get benefit2 =>
      'You\'re maintaining focus and mental clarity by staying hydrated.';

  @override
  String get benefit3 =>
      'You\'re supporting healthy skin, mood, and overall well-being right now.';

  @override
  String get benefit4 =>
      'Your heart is working more efficiently thanks to proper hydration.';

  @override
  String get benefit5 =>
      'You\'re helping your whole body feel better just by staying hydrated.';

  @override
  String get notificationTitle0 => '💧 A Little Water Break!';

  @override
  String notificationTitle1(Object userName) {
    return '💧 Hey $userName! Time for a Water Break!';
  }

  @override
  String get notificationBody =>
      'Nước giúp mọi thứ trở nên tốt hơn. Uống ngay để cảm thấy sảng khoái nhé!';

  @override
  String get allow => 'Allow';

  @override
  String get dont_allow => 'Don\'t Allow';

  @override
  String get allow_notification => 'Allow Notifications';

  @override
  String get allow_notification_dialog =>
      'Enable notifications to get regular reminders to drink water and stay hydrated.';

  @override
  String get select_time => 'Select Time';
}
