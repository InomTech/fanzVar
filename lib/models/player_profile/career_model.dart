// To parse this JSON data, do
//
//     final careerModel = careerModelFromJson(jsonString);

import 'dart:convert';

CareerModel careerModelFromJson(String str) =>
    CareerModel.fromJson(json.decode(str));

String careerModelToJson(CareerModel data) => json.encode(data.toJson());

class CareerModel {
  CareerModel({
    required this.teamName,
    required this.teamAvatar,
    required this.apps,
    required this.goals,
    required this.year,
  });

  String teamName;
  String teamAvatar;
  String apps;
  String goals;
  String year;

  factory CareerModel.fromJson(Map<String, dynamic> json) => CareerModel(
        teamName: json["team_name"],
        teamAvatar: json["team_avatar"],
        apps: json["apps"],
        goals: json["goals"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "team_name": teamName,
        "team_avatar": teamAvatar,
        "apps": apps,
        "goals": goals,
        "year": year,
      };
}
