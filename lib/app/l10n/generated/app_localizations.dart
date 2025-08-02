import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_vi.dart' deferred as app_localizations_vi;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @statistics_description.
  ///
  /// In en, this message translates to:
  /// **'Your hydration insights'**
  String get statistics_description;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @settings_description.
  ///
  /// In en, this message translates to:
  /// **'Customize your experience'**
  String get settings_description;

  /// Shows the current progress towards the daily goal
  ///
  /// In en, this message translates to:
  /// **'of {value}{unit} daily goal'**
  String dailyGoalText(Object value, Object unit);

  /// Shows current amount needed to reach daily goal
  ///
  /// In en, this message translates to:
  /// **'{value}{unit} remaining'**
  String remaining(Object value, Object unit);

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent'**
  String get recent;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @no_water_intake_data.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t had any water yet.'**
  String get no_water_intake_data;

  /// No description provided for @day_streak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get day_streak;

  /// No description provided for @weekly_avg.
  ///
  /// In en, this message translates to:
  /// **'Weekly Avg'**
  String get weekly_avg;

  /// No description provided for @this_week.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get this_week;

  /// No description provided for @this_month.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get this_month;

  /// No description provided for @mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get sun;

  /// No description provided for @goals_met.
  ///
  /// In en, this message translates to:
  /// **'Goals Met'**
  String get goals_met;

  /// No description provided for @success_rate.
  ///
  /// In en, this message translates to:
  /// **'Success Rate'**
  String get success_rate;

  /// No description provided for @daily_goal.
  ///
  /// In en, this message translates to:
  /// **'Daily Goal'**
  String get daily_goal;

  /// No description provided for @advanced_mode.
  ///
  /// In en, this message translates to:
  /// **'Advanced Mode'**
  String get advanced_mode;

  /// Advanced Mode Description
  ///
  /// In en, this message translates to:
  /// **'Unlock goal to {value}{unit}'**
  String advanced_mode_description(Object value, Object unit);

  /// No description provided for @advanced_mode_dialog.
  ///
  /// In en, this message translates to:
  /// **'Very high water intake goals should be discussed with a healthcare professional. Excessive water consumption can be harmful.'**
  String get advanced_mode_dialog;

  /// No description provided for @change_daily_goal.
  ///
  /// In en, this message translates to:
  /// **'Change Daily Goal'**
  String get change_daily_goal;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @change_daily_goal_dialog.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change your daily goal?'**
  String get change_daily_goal_dialog;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get dark_mode;

  /// No description provided for @dark_mode_description.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark theme'**
  String get dark_mode_description;

  /// No description provided for @units.
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get units;

  /// No description provided for @units_description.
  ///
  /// In en, this message translates to:
  /// **'Milliliters or fluuid ounces'**
  String get units_description;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @enable_reminders.
  ///
  /// In en, this message translates to:
  /// **'Enable Reminders'**
  String get enable_reminders;

  /// No description provided for @enable_reminders_description.
  ///
  /// In en, this message translates to:
  /// **'Get notified to drink water'**
  String get enable_reminders_description;

  /// No description provided for @sound_effects.
  ///
  /// In en, this message translates to:
  /// **'Sound Effects'**
  String get sound_effects;

  /// No description provided for @sound_effects_description.
  ///
  /// In en, this message translates to:
  /// **'Play sound for actions'**
  String get sound_effects_description;

  /// No description provided for @reminder_interval.
  ///
  /// In en, this message translates to:
  /// **'Reminder Interval'**
  String get reminder_interval;

  /// No description provided for @active_hours.
  ///
  /// In en, this message translates to:
  /// **'Active Hours'**
  String get active_hours;

  /// No description provided for @active_hours_description.
  ///
  /// In en, this message translates to:
  /// **'Reminders will be active during these hours'**
  String get active_hours_description;

  /// No description provided for @hydration_calculator.
  ///
  /// In en, this message translates to:
  /// **'Hydration Calculator'**
  String get hydration_calculator;

  /// No description provided for @hydration_calculator_description.
  ///
  /// In en, this message translates to:
  /// **'Calculate your personalized daily water goal based on your body weight and activity level'**
  String get hydration_calculator_description;

  /// No description provided for @body_weight.
  ///
  /// In en, this message translates to:
  /// **'Body Weight'**
  String get body_weight;

  /// No description provided for @daily_exercise_time.
  ///
  /// In en, this message translates to:
  /// **'Daily Exercise Time'**
  String get daily_exercise_time;

  /// No description provided for @recommended_daily_intake.
  ///
  /// In en, this message translates to:
  /// **'Recommended Daily Intake'**
  String get recommended_daily_intake;

  /// Base hydration calculator
  ///
  /// In en, this message translates to:
  /// **'Base: {value} (based on body weight)'**
  String base(Object value);

  /// Add exercise time hydration calculator
  ///
  /// In en, this message translates to:
  /// **'Exercise: +{value} ({min} min activity)'**
  String exercise(Object value, Object min);

  /// No description provided for @apply_recommended_goal.
  ///
  /// In en, this message translates to:
  /// **'Apply Recommended Goal'**
  String get apply_recommended_goal;

  /// Apply recommended goal success dialog
  ///
  /// In en, this message translates to:
  /// **'Your new daily goal will be set to {value}{unit}. Would you like to apply this change?'**
  String apply_recommended_goal_success_dialog(Object value, Object unit);

  /// Apply recommended goal failure dialog
  ///
  /// In en, this message translates to:
  /// **'Your goal should be between {value1}{unit} and {value2}{unit}. Let\'s tweak it and try again!'**
  String apply_recommended_goal_failure_dialog(
    Object value1,
    Object value2,
    Object unit,
  );

  /// No description provided for @invalid_goal_amount.
  ///
  /// In en, this message translates to:
  /// **'Invalid Goal Amount'**
  String get invalid_goal_amount;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @quick_add_amounts.
  ///
  /// In en, this message translates to:
  /// **'Quick Add Amounts'**
  String get quick_add_amounts;

  /// No description provided for @quick_add_amounts_description.
  ///
  /// In en, this message translates to:
  /// **'Customize your quick-add buttons for common drink sizes'**
  String get quick_add_amounts_description;

  /// No description provided for @button.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get button;

  /// No description provided for @tip.
  ///
  /// In en, this message translates to:
  /// **'Tip'**
  String get tip;

  /// No description provided for @quick_add_amounts_tip.
  ///
  /// In en, this message translates to:
  /// **'Set these to your most common drink sizes (e.g., your favorite glass, water bottle, or mug capacity)'**
  String get quick_add_amounts_tip;

  /// No description provided for @reset_to_default_value.
  ///
  /// In en, this message translates to:
  /// **'Reset to Default Value'**
  String get reset_to_default_value;

  /// No description provided for @reset_quick_add_confirmation.
  ///
  /// In en, this message translates to:
  /// **'This will reset your Quick-add buttons to their default values.'**
  String get reset_quick_add_confirmation;

  /// No description provided for @data_and_storage.
  ///
  /// In en, this message translates to:
  /// **'Data & Storage'**
  String get data_and_storage;

  /// No description provided for @data_and_storage_description.
  ///
  /// In en, this message translates to:
  /// **'Manage how your water intake data is stored and retained.'**
  String get data_and_storage_description;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get day;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @storage_info.
  ///
  /// In en, this message translates to:
  /// **'Storage Info'**
  String get storage_info;

  /// No description provided for @storage_info_content.
  ///
  /// In en, this message translates to:
  /// **'Your data is stored locally on your device. Shorter retention periods help keep your app running smoothly.'**
  String get storage_info_content;

  /// No description provided for @streakTitle0.
  ///
  /// In en, this message translates to:
  /// **'No streak yet – let\'s fix that!'**
  String get streakTitle0;

  /// No description provided for @streakTitle1.
  ///
  /// In en, this message translates to:
  /// **'First day streak!'**
  String get streakTitle1;

  /// Streak Title #2
  ///
  /// In en, this message translates to:
  /// **'{value} day streak!'**
  String streakTitle2(Object value);

  /// No description provided for @streakContent0.
  ///
  /// In en, this message translates to:
  /// **'Every habit starts with one small action.'**
  String get streakContent0;

  /// No description provided for @streakContent1.
  ///
  /// In en, this message translates to:
  /// **'Great start! A journey begins with a single step.'**
  String get streakContent1;

  /// No description provided for @streakContent2.
  ///
  /// In en, this message translates to:
  /// **'You\'re picking up steam. Small wins add up.'**
  String get streakContent2;

  /// No description provided for @streakContent3.
  ///
  /// In en, this message translates to:
  /// **'Solid progress! You\'re forming a strong habit.'**
  String get streakContent3;

  /// No description provided for @streakContent4.
  ///
  /// In en, this message translates to:
  /// **'Impressive dedication. You\'re making this a lifestyle.'**
  String get streakContent4;

  /// No description provided for @streakContent5.
  ///
  /// In en, this message translates to:
  /// **'You\'re a force of habit! This is how change happens.'**
  String get streakContent5;

  /// No description provided for @streakContent6.
  ///
  /// In en, this message translates to:
  /// **'Legendary commitment. You\'re an inspiration.'**
  String get streakContent6;

  /// No description provided for @streakAction0.
  ///
  /// In en, this message translates to:
  /// **'Take the first step'**
  String get streakAction0;

  /// No description provided for @streakAction1.
  ///
  /// In en, this message translates to:
  /// **'Keep the momentum going'**
  String get streakAction1;

  /// No description provided for @streakAction2.
  ///
  /// In en, this message translates to:
  /// **'Stay on track'**
  String get streakAction2;

  /// No description provided for @streakAction3.
  ///
  /// In en, this message translates to:
  /// **'Don\'t lose your rhythm'**
  String get streakAction3;

  /// No description provided for @streakAction4.
  ///
  /// In en, this message translates to:
  /// **'Keep pushing forward'**
  String get streakAction4;

  /// No description provided for @streakAction5.
  ///
  /// In en, this message translates to:
  /// **'Inspire others'**
  String get streakAction5;

  /// No description provided for @streakAction6.
  ///
  /// In en, this message translates to:
  /// **'Be proud and keep going'**
  String get streakAction6;

  /// No description provided for @achievementTitle0.
  ///
  /// In en, this message translates to:
  /// **'Let\'s begin!'**
  String get achievementTitle0;

  /// No description provided for @achievementTitle1.
  ///
  /// In en, this message translates to:
  /// **'Off to a start!'**
  String get achievementTitle1;

  /// No description provided for @achievementTitle2.
  ///
  /// In en, this message translates to:
  /// **'Making progress!'**
  String get achievementTitle2;

  /// No description provided for @achievementTitle3.
  ///
  /// In en, this message translates to:
  /// **'Over halfway!'**
  String get achievementTitle3;

  /// No description provided for @achievementTitle4.
  ///
  /// In en, this message translates to:
  /// **'Almost there!'**
  String get achievementTitle4;

  /// No description provided for @achievementTitle5.
  ///
  /// In en, this message translates to:
  /// **'Goal achieved!'**
  String get achievementTitle5;

  /// No description provided for @achievementContent0.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t started yet, but there\'s still time to crush your goal.'**
  String get achievementContent0;

  /// Achievement Content 1
  ///
  /// In en, this message translates to:
  /// **'You\'re {value}% towards your daily goal. Every bit counts!'**
  String achievementContent1(Object value);

  /// Achievement Content 2
  ///
  /// In en, this message translates to:
  /// **'You\'re {value}% there. Stay focused and keep moving!'**
  String achievementContent2(Object value);

  /// Achievement Content 3
  ///
  /// In en, this message translates to:
  /// **'You\'re {value}% towards your goal. Great effort so far!'**
  String achievementContent3(Object value);

  /// Achievement Content 4
  ///
  /// In en, this message translates to:
  /// **'You\'re {value}% in! One last push to reach your goal.'**
  String achievementContent4(Object value);

  /// No description provided for @achievementContent5.
  ///
  /// In en, this message translates to:
  /// **'You hit 100% of your daily goal. Amazing work!'**
  String get achievementContent5;

  /// No description provided for @achievementAction0.
  ///
  /// In en, this message translates to:
  /// **'Take the first step'**
  String get achievementAction0;

  /// No description provided for @achievementAction1.
  ///
  /// In en, this message translates to:
  /// **'Keep it going'**
  String get achievementAction1;

  /// No description provided for @achievementAction2.
  ///
  /// In en, this message translates to:
  /// **'You\'re halfway there'**
  String get achievementAction2;

  /// No description provided for @achievementAction3.
  ///
  /// In en, this message translates to:
  /// **'Push a little more'**
  String get achievementAction3;

  /// No description provided for @achievementAction4.
  ///
  /// In en, this message translates to:
  /// **'Finish strong'**
  String get achievementAction4;

  /// No description provided for @achievementAction5.
  ///
  /// In en, this message translates to:
  /// **'Celebrate your win'**
  String get achievementAction5;

  /// No description provided for @benefitTitle.
  ///
  /// In en, this message translates to:
  /// **'How water helps?'**
  String get benefitTitle;

  /// No description provided for @benefitAction.
  ///
  /// In en, this message translates to:
  /// **'Keep the good work going!'**
  String get benefitAction;

  /// No description provided for @fact0.
  ///
  /// In en, this message translates to:
  /// **'Your body is about 60% water, vital for nearly every function.'**
  String get fact0;

  /// No description provided for @fact1.
  ///
  /// In en, this message translates to:
  /// **'Your brain is 75% water. Even mild dehydration can affect concentration and mood.'**
  String get fact1;

  /// No description provided for @fact2.
  ///
  /// In en, this message translates to:
  /// **'You can live for weeks without food, but only days without water.'**
  String get fact2;

  /// No description provided for @fact3.
  ///
  /// In en, this message translates to:
  /// **'Hydration helps regulate your body temperature and prevent headaches.'**
  String get fact3;

  /// No description provided for @fact4.
  ///
  /// In en, this message translates to:
  /// **'Hydration improves circulation and supports a healthy immune system.'**
  String get fact4;

  /// No description provided for @fact5.
  ///
  /// In en, this message translates to:
  /// **'Drinking water helps cushion your joints and muscles during activity.'**
  String get fact5;

  /// No description provided for @fact6.
  ///
  /// In en, this message translates to:
  /// **'Staying hydrated helps your brain work better, improving focus and memory.'**
  String get fact6;

  /// No description provided for @fact7.
  ///
  /// In en, this message translates to:
  /// **'Water is aiding digestion and supporting your metabolism.'**
  String get fact7;

  /// No description provided for @fact8.
  ///
  /// In en, this message translates to:
  /// **'Water is helping deliver nutrients to your cells and boosting energy.'**
  String get fact8;

  /// No description provided for @factTitle.
  ///
  /// In en, this message translates to:
  /// **'Did you know?'**
  String get factTitle;

  /// No description provided for @factAction.
  ///
  /// In en, this message translates to:
  /// **'Keep the good work going!'**
  String get factAction;

  /// No description provided for @benefit0.
  ///
  /// In en, this message translates to:
  /// **'Water is helping flush toxins from your kidneys and keeping your skin glowing.'**
  String get benefit0;

  /// No description provided for @benefit1.
  ///
  /// In en, this message translates to:
  /// **'Hydration is supporting your joints and reducing fatigue.'**
  String get benefit1;

  /// No description provided for @benefit2.
  ///
  /// In en, this message translates to:
  /// **'You\'re maintaining focus and mental clarity by staying hydrated.'**
  String get benefit2;

  /// No description provided for @benefit3.
  ///
  /// In en, this message translates to:
  /// **'You\'re supporting healthy skin, mood, and overall well-being right now.'**
  String get benefit3;

  /// No description provided for @benefit4.
  ///
  /// In en, this message translates to:
  /// **'Your heart is working more efficiently thanks to proper hydration.'**
  String get benefit4;

  /// No description provided for @benefit5.
  ///
  /// In en, this message translates to:
  /// **'You\'re helping your whole body feel better just by staying hydrated.'**
  String get benefit5;

  /// No description provided for @notificationTitle0.
  ///
  /// In en, this message translates to:
  /// **'💧 A Little Water Break!'**
  String get notificationTitle0;

  /// Notification title with user name
  ///
  /// In en, this message translates to:
  /// **'💧 Hey {userName}! Time for a Water Break!'**
  String notificationTitle1(Object userName);

  /// No description provided for @notificationBody.
  ///
  /// In en, this message translates to:
  /// **'Nước giúp mọi thứ trở nên tốt hơn. Uống ngay để cảm thấy sảng khoái nhé!'**
  String get notificationBody;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @dont_allow.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Allow'**
  String get dont_allow;

  /// No description provided for @allow_notification.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allow_notification;

  /// No description provided for @allow_notification_dialog.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications to get regular reminders to drink water and stay hydrated.'**
  String get allow_notification_dialog;

  /// No description provided for @select_time.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get select_time;

  /// No description provided for @updateTitle.
  ///
  /// In en, this message translates to:
  /// **'New Update Available!'**
  String get updateTitle;

  /// No description provided for @updateContent.
  ///
  /// In en, this message translates to:
  /// **'A new version of the app is ready. Get the latest features and improvements.'**
  String get updateContent;

  /// No description provided for @updateAction.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateAction;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return app_localizations_en.loadLibrary().then(
        (dynamic _) => app_localizations_en.AppLocalizationsEn(),
      );
    case 'vi':
      return app_localizations_vi.loadLibrary().then(
        (dynamic _) => app_localizations_vi.AppLocalizationsVi(),
      );
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
