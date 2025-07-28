// Dart imports:
import 'dart:convert';

class DailyIntakeModel {
  String? id;
  double? intake;
  double? goal;
  String? date;
  String? unit;
  bool? isDeleted;

  DailyIntakeModel({
    this.id,
    this.intake,
    this.goal,
    this.date,
    this.unit,
    this.isDeleted,
  });

  DailyIntakeModel copyWith({
    String? id,
    double? intake,
    double? goal,
    String? date,
    String? unit,
    bool? isDeleted,
  }) => DailyIntakeModel(
    id: id ?? this.id,
    intake: intake ?? this.intake,
    goal: goal ?? this.goal,
    date: date ?? this.date,
    unit: unit ?? this.unit,
    isDeleted: isDeleted ?? this.isDeleted,
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
        unit: json["unit"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "intake": intake,
    "goal": goal,
    "date": date,
    "unit": unit,
    "isDeleted": isDeleted,
  };

  static fromList(data) {
    var list = data as List;
    return list.map((map) => DailyIntakeModel.fromJson(map)).toList();
  }
}
