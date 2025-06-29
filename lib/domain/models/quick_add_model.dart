// Dart imports:
import 'dart:convert';

class QuickAddModel {
  List<int>? values;

  QuickAddModel({this.values});

  QuickAddModel copyWith({List<int>? values}) =>
      QuickAddModel(values: values ?? this.values);

  factory QuickAddModel.fromRawJson(String str) =>
      QuickAddModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuickAddModel.fromJson(Map<String, dynamic> json) => QuickAddModel(
    values: json["values"] == null
        ? []
        : List<int>.from(json["values"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
  };

  static fromList(data) {
    var list = data as List;
    return list.map((map) => QuickAddModel.fromJson(map)).toList();
  }
}
