// To parse this JSON data, do
//
//     final fanElectionModel = fanElectionModelFromJson(jsonString);

import 'dart:convert';

FanElectionModel fanElectionModelFromJson(String str) =>
    FanElectionModel.fromJson(json.decode(str));

String fanElectionModelToJson(FanElectionModel data) =>
    json.encode(data.toJson());

class FanElectionModel {
  FanElectionModel({
    required this.fanAvatar,
    required this.fanName,
    required this.votePercentage,
    required this.rate,
    required this.championAvatar,
  });

  String fanAvatar;
  String fanName;
  String votePercentage;
  String rate;
  String championAvatar;

  factory FanElectionModel.fromJson(Map<String, dynamic> json) =>
      FanElectionModel(
        fanAvatar: json["fan_avatar"],
        fanName: json["fan_Name"],
        votePercentage: json["vote_percentage"],
        rate: json["rate"],
        championAvatar: json["champion_avatar"],
      );

  Map<String, dynamic> toJson() => {
        "fan_avatar": fanAvatar,
        "fan_Name": fanName,
        "vote_percentage": votePercentage,
        "rate": rate,
        "champion_avatar": championAvatar,
      };
}
