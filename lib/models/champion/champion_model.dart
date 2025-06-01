// //  "Name": "Cup 1",
// //                   "Avatar": "https://picsum.photos/250?image=9",
// //                   "About": " Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. ",
// //                   "Country": "Italy",
// //                   "Founded": "1990",
// //                   "NumOfTeams": "32",
// //                   "NextDate": "Mon, Nov 21,2022",
// //                   "MostSuccessfulTeam": "Brazil",
// //                   "Website": "https://www.fifa.com/tournaments/mens/worldcup"

// class ChampionModel {
//   String? name,
//       avatar,
//       about,
//       country,
//       founded,
//       numOfTeams,
//       nextDate,
//       mostSuccessfulTeam,
//       website;

//   ChampionModel(
//       {this.name,
//       this.avatar,
//       this.about,
//       this.country,
//       this.founded,
//       this.numOfTeams,
//       this.nextDate,
//       this.mostSuccessfulTeam,
//       this.website});

//   factory ChampionModel.fromJson(Map<String, dynamic> json) {
//     {
//       return ChampionModel(
//         name: json["Name"],
//         avatar: json["Avatar"],
//         about: json["About"],
//         country: json["Country"],
//         founded: json["founded"],
//         numOfTeams: json["NumOfTeams"],
//         nextDate: json["NextDate"],
//         mostSuccessfulTeam: json["MostSuccessfulTeam"],
//         website: json["Website"],
//       );
//     }
//   }
// }

// To parse this JSON data, do
//
//     final championModel = championModelFromJson(jsonString);

import 'dart:convert';

ChampionModel championModelFromJson(String str) =>
    ChampionModel.fromJson(json.decode(str));

String championModelToJson(ChampionModel data) => json.encode(data.toJson());

class ChampionModel {
  ChampionModel({
    required this.championships,
  });

  List<Championship> championships;

  factory ChampionModel.fromJson(Map<String, dynamic> json) => ChampionModel(
        championships: List<Championship>.from(
            json["Championships"].map((x) => Championship.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Championships":
            List<dynamic>.from(championships.map((x) => x.toJson())),
      };
}

class Championship {
  Championship({
    required this.id,
    required this.categoryName,
    required this.championList,
  });

  String id;
  String categoryName;
  List<ChampionList> championList;

  factory Championship.fromJson(Map<String, dynamic> json) => Championship(
        id: json["id"],
        categoryName: json["categoryName"],
        championList: List<ChampionList>.from(
            json["championList"].map((x) => ChampionList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "championList": List<dynamic>.from(championList.map((x) => x.toJson())),
      };
}

class ChampionList {
  ChampionList({
    required this.name,
    required this.avatar,
    required this.about,
    required this.country,
    required this.founded,
    required this.numOfTeams,
    required this.nextDate,
    required this.mostSuccessfulTeam,
    required this.website,
  });

  String name;
  String avatar;
  String about;
  String country;
  String founded;
  String numOfTeams;
  String nextDate;
  String mostSuccessfulTeam;
  String website;

  factory ChampionList.fromJson(Map<String, dynamic> json) => ChampionList(
        name: json["name"],
        avatar: json["avatar"],
        about: json["about"],
        country: json["country"],
        founded: json["founded"],
        numOfTeams: json["numOfTeams"],
        nextDate: json["nextDate"],
        mostSuccessfulTeam: json["mostSuccessfulTeam"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "about": about,
        "country": country,
        "founded": founded,
        "numOfTeams": numOfTeams,
        "nextDate": nextDate,
        "mostSuccessfulTeam": mostSuccessfulTeam,
        "website": website,
      };
}
