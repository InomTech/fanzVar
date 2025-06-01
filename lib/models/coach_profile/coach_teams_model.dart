// To parse this JSON data, do
//
//     final coachTeamsModel = coachTeamsModelFromJson(jsonString);

import 'dart:convert';

CoachTeamsModel coachTeamsModelFromJson(String str) =>
    CoachTeamsModel.fromJson(json.decode(str));

String coachTeamsModelToJson(CoachTeamsModel data) =>
    json.encode(data.toJson());

class CoachTeamsModel {
  CoachTeamsModel({
    required this.teamName,
    required this.teamAvatar,
    required this.flag,
    required this.year,
  });

  String teamName;
  String teamAvatar;
  String flag;
  String year;

  factory CoachTeamsModel.fromJson(Map<String, dynamic> json) =>
      CoachTeamsModel(
        teamName: json["team_name"],
        teamAvatar: json["team_avatar"],
        flag: json["flag"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "team_name": teamName,
        "team_avatar": teamAvatar,
        "flag": flag,
        "year": year,
      };
}
