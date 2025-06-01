import 'dart:convert';

// ignore: non_constant_identifier_names
ClubMoreModel ClubMoreModelFromJson(String str) =>
    ClubMoreModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String ClubMoreModelToJson(ClubMoreModel data) => json.encode(data.toJson());

class ClubMoreModel {
  ClubMoreModel(
      {required this.champoinName,
      required this.numOfChampoin,
      required this.founded,
      required this.numOfFuns,
      required this.numOfProjects,
      required this.sharePrice,
      required this.pointValue,
      required this.managementFansLink,
      required this.managementBoardLink});

  String champoinName;
  String numOfChampoin;
  String founded;
  String numOfFuns;
  String numOfProjects;
  String sharePrice;
  String pointValue;
  String managementFansLink;
  String managementBoardLink;
  factory ClubMoreModel.fromJson(Map<String, dynamic> json) => ClubMoreModel(
        champoinName: json["champoin_name"],
        numOfChampoin: json["num_of_champoin"],
        founded: json["founded"],
        numOfFuns: json["num_of_funs"],
        numOfProjects: json["num_of_projects"],
        sharePrice: json["share_price"],
        pointValue: json["point_value"],
        managementFansLink: json["Management_fans_link"],
        managementBoardLink: json["Management_board_link"],
      );

  Map<String, dynamic> toJson() => {
        "champoin_name": champoinName,
        "num_of_champoin": numOfChampoin,
        "founded": founded,
        "num_of_funs": numOfFuns,
        "num_of_projects": numOfProjects,
        "share_price": sharePrice,
        "point_value": pointValue,
        "Management_fans_link": managementFansLink,
        "Management_board_link": managementBoardLink
      };
}
