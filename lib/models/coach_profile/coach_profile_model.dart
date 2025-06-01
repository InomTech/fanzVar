// To parse this JSON data, do
//
//     final coachProfileModel = coachProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:fanzhashem/models/coach_profile/coach_clubs_model.dart';
import 'package:fanzhashem/models/coach_profile/coach_teams_model.dart';
import 'package:fanzhashem/models/player_profile/news_model.dart';

import '../player_profile/news_model.dart';
import 'coach_clubs_model.dart';
import 'coach_teams_model.dart';

CoachProfileModel coachProfileModelFromJson(String str) =>
    CoachProfileModel.fromJson(json.decode(str));

String coachProfileModelToJson(CoachProfileModel data) =>
    json.encode(data.toJson());

class CoachProfileModel {
  CoachProfileModel({
    required this.coachId,
    required this.coachName,
    required this.coachAvatar,
    required this.age,
    required this.height,
    required this.position,
    required this.shirt,
    required this.city,
    required this.team,
    required this.country,
    required this.countryAvatar,
    required this.clubName,
    required this.teamAvatar,
    required this.news,
    required this.teams,
    required this.clubs,
    required this.latestResult,
    required this.favoritePosition,
    required this.weeklyRating,
    required this.audienceVote,
    required this.percentage,
  });

  String coachId;
  String coachName;
  String coachAvatar;
  String age;
  String height;
  String position;
  String shirt;
  String city;
  String team;
  String country;
  String countryAvatar;
  String clubName;
  String teamAvatar;
  List<NewsModel> news;
  List<CoachTeamsModel> teams;
  List<CoachClubsModel> clubs;
  String latestResult;
  String favoritePosition;
  String weeklyRating;
  String audienceVote;
  double percentage;
  factory CoachProfileModel.fromJson(Map<String, dynamic> json) =>
      CoachProfileModel(
        coachId: json["coach_id"],
        coachName: json["coach_name"],
        coachAvatar: json["coach_Avatar"],
        age: json["age"],
        height: json["Height"],
        position: json["position"],
        shirt: json["shirt"],
        city: json["city"],
        team: json["team"],
        country: json["country"],
        countryAvatar: json["country_avatar"],
        clubName: json["club_name"],
        teamAvatar: json["team_avatar"],
        news: List<NewsModel>.from(
            json["news"].map((x) => NewsModel.fromJson(x))),
        teams: List<CoachTeamsModel>.from(
            json["teams"].map((x) => CoachTeamsModel.fromJson(x))),
        clubs: List<CoachClubsModel>.from(
            json["clubs"].map((x) => CoachClubsModel.fromJson(x))),
        latestResult: json["latest_result"],
        favoritePosition: json["favorite_position"],
        weeklyRating: json["weekly_rating"],
        audienceVote: json["audience_vote"],
        percentage: json["percentage"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "coach_id": coachId,
        "coach_name": coachName,
        "coach_Avatar": coachAvatar,
        "age": age,
        "Height": height,
        "position": position,
        "shirt": shirt,
        "city": city,
        "team": team,
        "country": country,
        "country_avatar": countryAvatar,
        "club_name": clubName,
        "team_avatar": teamAvatar,
        "news": List<dynamic>.from(news.map((x) => x.toJson())),
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
        "clubs": List<dynamic>.from(clubs.map((x) => x.toJson())),
        "latest_result": latestResult,
        "favorite_position": favoritePosition,
        "weekly_rating": weeklyRating,
        "audience_vote": audienceVote,
        "percentage": percentage,
      };
}
