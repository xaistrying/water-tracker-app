// Dart imports:
import 'dart:convert';

class DailyIntakeModel {
  String? id;
  double? intake;
  double? goal;
  String? date;

  DailyIntakeModel({this.id, this.intake, this.goal, this.date});

  DailyIntakeModel copyWith({
    String? id,
    double? intake,
    double? goal,
    String? date,
  }) => DailyIntakeModel(
    id: id ?? this.id,
    intake: intake ?? this.intake,
    goal: goal ?? this.goal,
    date: date ?? this.date,
  );

  factory DailyIntakeModel.fromRawJson(String str) =>
      DailyIntakeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DailyIntakeModel.fromJson(Map<String, dynamic> json) =>
      DailyIntakeModel(
        id: json["id"],
        intake: json["intake"],
        goal: json["goal"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "intake": intake,
    "goal": goal,
    "date": date,
  };

  static fromList(data) {
    var list = data as List;
    return list.map((map) => DailyIntakeModel.fromJson(map)).toList();
  }
}
