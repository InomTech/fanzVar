// To parse this JSON data, do
//
//     final coachClubsModel = coachClubsModelFromJson(jsonString);

import 'dart:convert';

CoachClubsModel coachClubsModelFromJson(String str) =>
    CoachClubsModel.fromJson(json.decode(str));

String coachClubsModelToJson(CoachClubsModel data) =>
    json.encode(data.toJson());

class CoachClubsModel {
  CoachClubsModel({
    required this.clubName,
    required this.year,
    required this.reward,
  });

  String clubName;
  String year;
  String reward;

  factory CoachClubsModel.fromJson(Map<String, dynamic> json) =>
      CoachClubsModel(
        clubName: json["club_name"],
        year: json["year"],
        reward: json["reward"],
      );

  Map<String, dynamic> toJson() => {
        "club_name": clubName,
        "year": year,
        "reward": reward,
      };
}
