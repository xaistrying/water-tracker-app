// Dart imports:
import 'dart:convert';

class DailyIntakeModel {
  double? intake;
  double? goal;
  String? day;

  DailyIntakeModel({this.intake, this.goal, this.day});

  DailyIntakeModel copyWith({double? intake, double? goal, String? day}) =>
      DailyIntakeModel(
        intake: intake ?? this.intake,
        goal: goal ?? this.goal,
        day: day ?? this.day,
      );

  factory DailyIntakeModel.fromRawJson(String str) =>
      DailyIntakeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyIntakeModel.fromJson(Map<String, dynamic> json) =>
      DailyIntakeModel(
        intake: json["intake"],
        goal: json["goal"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {"intake": intake, "goal": goal, "day": day};
}
