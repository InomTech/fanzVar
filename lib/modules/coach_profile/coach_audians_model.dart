// To parse this JSON data, do
//
//     final coachClubsModel = coachClubsModelFromJson(jsonString);

import 'dart:convert';

ClubAuidanModel coachaudienceModelFromJson(String str) =>
    ClubAuidanModel.fromJson(json.decode(str));

String coachaudienceModelToJson(ClubAuidanModel data) =>
    json.encode(data.toJson());

class ClubAuidanModel {
  ClubAuidanModel({
    required this.latestResult,
    required this.favoriteWayToPlay,
    required this.WeekRating,
    required this.publicVote
  });

  String latestResult;
  String favoriteWayToPlay;
  String WeekRating;
  String publicVote;

  factory ClubAuidanModel.fromJson(Map<String, dynamic> json) =>
      ClubAuidanModel(
        latestResult: json["latestResult"],
        favoriteWayToPlay: json["favoriteWayToPlay"],
        WeekRating: json["WeekRating"],
        publicVote: json["publicVote"]
      );

  Map<String, dynamic> toJson() => {
        "club_name": latestResult,
        "favoriteWayToPlay": favoriteWayToPlay,
        "WeekRating": WeekRating,
      };
}
