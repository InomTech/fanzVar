import 'dart:convert';

// ignore: non_constant_identifier_names
FirstClubAttackModel FirstClubAttackModelFromJson(String str) =>
    FirstClubAttackModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String FirstClubAttackModelToJson(FirstClubAttackModel data) =>
    json.encode(data.toJson());

class FirstClubAttackModel {
  FirstClubAttackModel(
      {required this.id,
      required this.playerName,
      required this.playerPicture,
      this.numberGoals,
      this.clubName});

  int id;
  String playerName;
  String playerPicture;
  String? clubName;
  int? numberGoals;

  factory FirstClubAttackModel.fromJson(Map<String, dynamic> json) =>
      FirstClubAttackModel(
        id: json["id"],
        playerName: json["player_name"],
        playerPicture: json["player_picture"],
        clubName: json["club_name"],
        numberGoals: json["number_goals"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "player_name": playerName,
        "player_picture": playerPicture,
        "club_name": clubName,
        "number_goals": numberGoals,
      };
}
