// To parse this JSON data, do
//
//     final clubMatchesModel = clubMatchesModelFromJson(jsonString);

import 'dart:convert';

ClubMatchesModel clubMatchesModelFromJson(String str) =>
    ClubMatchesModel.fromJson(json.decode(str));

String clubMatchesModelToJson(ClubMatchesModel data) =>
    json.encode(data.toJson());

class ClubMatchesModel {
  ClubMatchesModel({
    required this.date,
    required this.time,
    required this.score,
    required this.firstTeamName,
    required this.firstTeamImg,
    required this.secondTeamName,
    required this.secondTeamImg,
  });

  String date;
  String time;
  String score;
  String firstTeamName;
  String firstTeamImg;
  String secondTeamName;
  String secondTeamImg;

  factory ClubMatchesModel.fromJson(Map<String, dynamic> json) =>
      ClubMatchesModel(
        date: json["date"],
        time: json["time"],
        score: json["score"],
        firstTeamName: json["first_team_name"],
        firstTeamImg: json["first_team_img"],
        secondTeamName: json["second_team_name"],
        secondTeamImg: json["second_team_img"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "score": score,
        "first_team_name": firstTeamName,
        "first_team_img": firstTeamImg,
        "second_team_name": secondTeamName,
        "second_team_img": secondTeamImg,
      };
}
