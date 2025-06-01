// To parse this JSON data, do
//
//     final statsModel = statsModelFromJson(jsonString);

import 'dart:convert';

StatsModel statsModelFromJson(String str) =>
    StatsModel.fromJson(json.decode(str));

String statsModelToJson(StatsModel data) => json.encode(data.toJson());

class StatsModel {
  StatsModel({
    required this.year,
    required this.goals,
    required this.redCard,
    required this.yellowCard,
    required this.greenCard,
    required this.assist,
  });

  String year;
  String goals;
  String redCard;
  String yellowCard;
  String greenCard;
  String assist;

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        year: json["year"],
        goals: json["goals"],
        redCard: json["red_card"],
        yellowCard: json["yellow_card"],
        greenCard: json["green_card"],
        assist: json["assist"]
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "goals": goals,
        "red_card": redCard,
        "yellow_card": yellowCard,
        "green_card": greenCard,
        "assist" : assist
      };
}
