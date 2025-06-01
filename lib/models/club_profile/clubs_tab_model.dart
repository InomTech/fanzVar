// To parse this JSON data, do
//
//     final clubsTabModel = clubsTabModelFromJson(jsonString);

import 'dart:convert';

ClubsTabModel clubsTabModelFromJson(String str) =>
    ClubsTabModel.fromJson(json.decode(str));

String clubsTabModelToJson(ClubsTabModel data) => json.encode(data.toJson());

class ClubsTabModel {
  ClubsTabModel({
    required this.pos,
    required this.club,
    required this.clubImg,
    required this.p,
    required this.gd,
    required this.pts,
  });

  String pos;
  String club;
  String clubImg;
  String p;
  String gd;
  String pts;

  factory ClubsTabModel.fromJson(Map<String, dynamic> json) => ClubsTabModel(
        pos: json["pos"],
        club: json["club"],
        clubImg: json["club_img"],
        p: json["p"],
        gd: json["gd"],
        pts: json["pts"],
      );

  Map<String, dynamic> toJson() => {
        "pos": pos,
        "club": club,
        "club_img": clubImg,
        "p": p,
        "gd": gd,
        "pts": pts,
      };
}
