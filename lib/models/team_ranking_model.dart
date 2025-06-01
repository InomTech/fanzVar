// To parse this JSON data, do
//
//     final teamRankingModel = teamRankingModelFromJson(jsonString);

import 'dart:convert';

TeamRankingModel teamRankingModelFromJson(String str) =>
    TeamRankingModel.fromJson(json.decode(str));

String teamRankingModelToJson(TeamRankingModel data) =>
    json.encode(data.toJson());

class TeamRankingModel {
  TeamRankingModel({
    required this.id,
    required this.rank,
    required this.teamName,
    required this.teamAvatar,
    required this.profit,
    required this.country,
    required this.fans,
  });
  String id;
  String rank;
  String teamName;
  String teamAvatar;
  int profit;
  String country;
  int fans;

  factory TeamRankingModel.fromJson(Map<String, dynamic> json) =>
      TeamRankingModel(
        id: json["id"],
        rank: json["rank"],
        teamName: json["team_name"],
        teamAvatar: json["team_avatar"],
        profit: json["profit"],
        country: json["country"],
        fans: json["fans"],
      );

  Map<String, dynamic> toJson() => {
        "id": "id",
        "rank": rank,
        "team_name": teamName,
        "team_avatar": teamAvatar,
        "profit": profit,
        "country": country,
        "fans": fans,
      };
}
