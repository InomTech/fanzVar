import 'dart:convert';

import 'package:fanzhashem/models/club_profile/club_more_model.dart';
import 'package:fanzhashem/models/club_profile/clubs_tab_model.dart';
import 'package:fanzhashem/models/player_profile/news_model.dart';

import 'club_profile/club_matches_model.dart';
import 'club_profile/club_play_list_model.dart';
import 'club_profile/club_project_model.dart';

GeneralMatchModel generalMatchModelFromJson(String str) =>
    GeneralMatchModel.fromJson(json.decode(str));

String generalMatchModelToJson(GeneralMatchModel data) =>
    json.encode(data.toJson());

class GeneralMatchModel {
  GeneralMatchModel({
    required this.matchId,
    required this.date,
    required this.countryTiming,
    required this.time,
    required this.score,
    required this.firstTeamId,
    required this.firstTeamName,
    required this.firstTeamScore,
    required this.firstTeamCountry,
    required this.firstTeamAvatar,
    required this.firstTeamCoach,
    required this.firstTeamCoachId,
    required this.firstTeamCoachAvatar,
    required this.firstTeamNews,
    required this.firstTeamClubs,
    required this.firstTeamMatches,
    required this.secondTeamId,
    required this.secondTeamName,
    required this.secondTeamScore,
    required this.secondTeamCountry,
    required this.secondTeamAvatar,
    required this.tvChannel,
    required this.league,
    required this.leagueAvatar,
    required this.secondTeamCoach,
    required this.secondTeamCoachId,
    required this.secondTeamCoachAvatar,
    required this.secondTeamNews,
    required this.secondTeamClubs,
    required this.secondTeamMatches,
    this.gallery,
    required this.firstClubYears,
    required this.secondClubYears,
    required this.firstClubMore,
    required this.secondClubMore,
    required this.teamMatches,
    required this.firstTeamWin,
    required this.teamsDrawn,
    required this.secondTeamWin,
    required this.firstTeamWLD,
    required this.secondTeamWLD,
    required this.firstTeamGoalScorrersName,
    required this.secondTeamGoalScorrersName,
    required this.firstTeamGoalScorrers,
    required this.secondTeamGoalScorrers,
    required this.firstTeamExpectationWin,
    required this.teamExpectationDrawn,
    required this.secondTeamGoalExpectationWin,
    required this.firstTeamVotes,
    required this.secondTeamVotes,
    required this.firstTeamFansNumber,
    required this.secondTeamFansNumber,
    required this.firstTeamRank,
    required this.secondTeamRank,
    required this.firstTeamFansAttendance,
    required this.secondTeamFansAttendance,
    required this.highLightsImages,
    required this.stadiumName,
    required this.firstTeamShootsOn,
    required this.secondTeamShootsOn,
    required this.firstTeamTarget,
    required this.secondTeamTarget,
    required this.firstTeamPossession,
    required this.secondTeamPossession,
    required this.firstTeamYellowCard,
    required this.secondTeamYellowCard,
    required this.firstTeamRedCard,
    required this.secondTeamRedCard,
    required this.firstTeamGoal,
    required this.secondTeamGoal,
    required this.firstTeamSaves,
    required this.secondTeamSaves,
    required this.firstTeamPassAccuracy,
    required this.secondTeamPassAccuracy,
    required this.firstTeamFansEvalution,
    required this.secondTeamFansEvalution,
    required this.firstTeamRefereePerformance,
    required this.secondTeamRefereePerformance,
    required this.manOfMatchPicture,
    this.firstClubGoalKeeper,
    this.firstClubDefender,
    this.firstClubCenter,
    this.firstClubAttack,
    this.secondClubGoalKeeper,
    this.secondClubDefender,
    this.secondClubCenter,
    this.secondClubAttack,
    this.firstClubGoalScorres,
    this.secondClubGoalScorres,
    required this.firstsugesstedProjects,
    required this.firstinprogressProjects,
    required this.firstfinishedProjects,
    required this.secondsugesstedProjects,
    required this.secondinprogressProjects,
    required this.secondfinishedProjects,
  });

  String matchId;
  String date;
  String countryTiming;
  String time;
  String score;
  String firstTeamId;
  String firstTeamName;
  String firstTeamScore;
  String firstTeamCountry;
  String firstTeamAvatar;
  String firstTeamCoach;
  String firstTeamCoachId;
  String firstTeamCoachAvatar;
  List<NewsModel> firstTeamNews;
  List<ClubsTabModel> firstTeamClubs;
  List<ClubMatchesModel> firstTeamMatches;
  String secondTeamId;
  String secondTeamName;
  String secondTeamScore;
  String secondTeamCountry;
  String secondTeamAvatar;
  String tvChannel;
  String league;
  String leagueAvatar;
  String secondTeamCoach;
  String secondTeamCoachId;
  String secondTeamCoachAvatar;
  List<NewsModel> secondTeamNews;
  List<ClubsTabModel> secondTeamClubs;
  List<ClubMatchesModel> secondTeamMatches;
  List<String>? gallery;
  List<FirstClubAttackModel>? firstClubGoalKeeper;
  List<FirstClubAttackModel>? firstClubDefender;
  List<FirstClubAttackModel>? firstClubCenter;
  List<FirstClubAttackModel>? firstClubAttack;
  List<FirstClubAttackModel>? secondClubGoalKeeper;
  List<FirstClubAttackModel>? secondClubDefender;
  List<FirstClubAttackModel>? secondClubCenter;
  List<FirstClubAttackModel>? secondClubAttack;
  List<FirstClubAttackModel>? firstClubGoalScorres;
  List<FirstClubAttackModel>? secondClubGoalScorres;
  List<String> firstClubYears;
  List<String> secondClubYears;
  List<ClubMoreModel> firstClubMore;
  List<ClubMoreModel> secondClubMore;
  List<ClubProjectModel> secondsugesstedProjects;
  List<ClubProjectModel> secondinprogressProjects;
  List<ClubProjectModel> secondfinishedProjects;
  List<ClubProjectModel> firstsugesstedProjects;
  List<ClubProjectModel> firstinprogressProjects;
  List<ClubProjectModel> firstfinishedProjects;
  String teamMatches;
  String firstTeamWin;
  String teamsDrawn;
  String secondTeamWin;
  String firstTeamWLD;
  String secondTeamWLD;
  String firstTeamGoalScorrersName;
  String secondTeamGoalScorrersName;
  String firstTeamGoalScorrers;
  String secondTeamGoalScorrers;
  String firstTeamExpectationWin;
  String teamExpectationDrawn;
  String secondTeamGoalExpectationWin;
  String firstTeamVotes;
  String secondTeamVotes;
  String firstTeamFansNumber;
  String secondTeamFansNumber;
  String firstTeamRank;
  String secondTeamRank;
  String firstTeamFansAttendance;
  String secondTeamFansAttendance;
  List<String> highLightsImages;
  String stadiumName;
  String firstTeamShootsOn;
  String secondTeamShootsOn;
  String firstTeamTarget;
  String secondTeamTarget;
  String firstTeamPossession;
  String secondTeamPossession;
  String firstTeamYellowCard;
  String secondTeamYellowCard;
  String firstTeamRedCard;
  String secondTeamRedCard;
  String firstTeamGoal;
  String secondTeamGoal;
  String firstTeamSaves;
  String secondTeamSaves;
  String firstTeamPassAccuracy;
  String secondTeamPassAccuracy;
  String firstTeamFansEvalution;
  String secondTeamFansEvalution;
  String firstTeamRefereePerformance;
  String secondTeamRefereePerformance;
  String manOfMatchPicture;

  factory GeneralMatchModel.fromJson(Map<String, dynamic> json) =>
      GeneralMatchModel(
        matchId: json["match_id"],
        date: json["date"],
        countryTiming: json["country_timing"],
        time: json["time"],
        score: json["score"],
        firstTeamId: json["first_team_id"],
        firstTeamName: json["first_team_name"],
        firstTeamScore: json["first_team_score"],
        firstTeamCountry: json["first_team_country"],
        firstTeamAvatar: json["first_team_avatar"],
        firstTeamCoach: json["first_team_coach"],
        firstTeamCoachId: json["first_team_coach_id"],
        firstTeamCoachAvatar: json["first_team_coach_avatar"],
        teamMatches: json["team_matches"],
        firstTeamWin: json["first_team_win"],
        teamsDrawn: json["teams_Drawn"],
        secondTeamWin: json["second_team_win"],
        firstTeamWLD: json["first_team_w_L_D"],
        secondTeamWLD: json["second_team_w_L_D"],
        firstTeamGoalScorrersName: json["first_team_Goal_scorrers_name"],
        secondTeamGoalScorrersName: json["second_team_Goal_scorrers_name"],
        firstTeamGoalScorrers: json["first_team_Goal_scorrers"],
        secondTeamGoalScorrers: json["second_team_Goal_scorrers"],
        firstTeamExpectationWin: json["first_team_Expectation_win"],
        teamExpectationDrawn: json["team__Expectation_drawn"],
        secondTeamGoalExpectationWin: json["second_team_Goal_Expectation_win"],
        firstTeamVotes: json["first_team_votes"],
        secondTeamVotes: json["second_team_votes"],
        firstTeamFansNumber: json["first_team_fans_number"],
        secondTeamFansNumber: json["second_team_fans_number"],
        firstTeamRank: json["first_team_rank"],
        secondTeamRank: json["second_team_rank"],
        firstTeamFansAttendance: json["first_team_fans_attendance"],
        secondTeamFansAttendance: json["second_team_fans_attendance"],
        highLightsImages:
            List<String>.from(json["HighLights_images"].map((x) => x)),
        // secondTeamMatches: List<TeamMatch>.from(json["second_team_matches"].map((x) => TeamMatch.fromJson(x))),
        stadiumName: json["stadium_name"],
        firstTeamShootsOn: json["first_team_Shoots_on"],
        secondTeamShootsOn: json["second_team_Shoots_on"],
        firstTeamTarget: json["first_team_target"],
        secondTeamTarget: json["second_team_target"],
        firstTeamPossession: json["first_team_Possession"],
        secondTeamPossession: json["second_team_Possession"],
        firstTeamYellowCard: json["first_team_Yellow_card"],
        secondTeamYellowCard: json["second_team_Yellow_card"],
        firstTeamRedCard: json["first_team_red_card"],
        secondTeamRedCard: json["second_team_red_card"],
        firstTeamGoal: json["first_team_goal"],
        secondTeamGoal: json["second_team_goal"],
        firstTeamSaves: json["first_team_saves"],
        secondTeamSaves: json["second_team_saves"],
        firstTeamPassAccuracy: json["first_team_pass_accuracy"],
        secondTeamPassAccuracy: json["second_team_pass_accuracy"],
        firstTeamFansEvalution: json["first_team_fans_evalution"],
        secondTeamFansEvalution: json["second_team_fans_evalution"],
        firstTeamRefereePerformance: json["first_team_Referee_performance"],
        secondTeamRefereePerformance: json["second_team_Referee_performance"],
        manOfMatchPicture: json["man_of_match_picture"],
        secondClubYears:
            List<String>.from(json["second_club_years"].map((x) => x)),
        firstClubYears:
            List<String>.from(json["first_club_years"].map((x) => x)),
        firstClubMore: List<ClubMoreModel>.from(
            json["first_club_more"].map((x) => ClubMoreModel.fromJson(x))),
        secondClubMore: List<ClubMoreModel>.from(
            json["second_club_more"].map((x) => ClubMoreModel.fromJson(x))),
        firstTeamNews: List<NewsModel>.from(
            json["first_team_news"].map((x) => NewsModel.fromJson(x))),
        firstTeamClubs: List<ClubsTabModel>.from(
            json["first_team_clubs"].map((x) => ClubsTabModel.fromJson(x))),
        firstTeamMatches: List<ClubMatchesModel>.from(json["first_team_matches"]
            .map((x) => ClubMatchesModel.fromJson(x))),
        secondTeamId: json["second_team_id"],
        secondTeamName: json["second_team_name"],
        secondTeamScore: json["second_team_score"],
        secondTeamCountry: json["second_team_country"],
        secondTeamAvatar: json["second_team_avatar"],
        tvChannel: json["tv_channel"],
        league: json["league"],
        leagueAvatar: json["league_avatar"],
        secondTeamCoach: json["second_team_coach"],
        secondTeamCoachId: json["second_team_coach_id"],
        secondTeamCoachAvatar: json["second_team_coach_avatar"],
        secondTeamNews: List<NewsModel>.from(
            json["second_team_news"].map((x) => NewsModel.fromJson(x))),
        secondTeamClubs: List<ClubsTabModel>.from(
            json["second_team_clubs"].map((x) => ClubsTabModel.fromJson(x))),
        secondTeamMatches: List<ClubMatchesModel>.from(
            json["first_team_matches"]
                .map((x) => ClubMatchesModel.fromJson(x))),
        // gallery: List<String>.from(json["Gallery"].map((x) => x)),
        gallery: json["Gallery"] == null
            ? null
            : List<String>.from(json["Gallery"].map((x) => x)),
        firstClubGoalKeeper: json["first_club_goalKeeper"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["first_club_goalKeeper"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        firstClubDefender: json["first_club_defender"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["first_club_defender"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        firstClubCenter: json["first_club_center"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["first_club_center"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        firstClubAttack: json["first_club_attack"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["first_club_attack"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        secondClubGoalKeeper: json["second_club_goalKeeper"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["second_club_goalKeeper"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        secondClubDefender: json["second_club_defender"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["second_club_defender"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        secondClubCenter: json["second_club_center"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["second_club_center"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        secondClubAttack: json["second_club_attack"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["second_club_attack"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        firstClubGoalScorres: json["first_club_goal_scorres"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["first_club_goal_scorres"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        secondClubGoalScorres: json["second_club_goal_scorres"] == null
            ? null
            : List<FirstClubAttackModel>.from(json["second_club_goal_scorres"]
                .map((x) => FirstClubAttackModel.fromJson(x))),
        firstsugesstedProjects: List<ClubProjectModel>.from(
            json["first_sugessted_projects"]
                .map((x) => ClubProjectModel.fromJson(x))),
        firstinprogressProjects: List<ClubProjectModel>.from(
            json["first_inprogress_projects"]
                .map((x) => ClubProjectModel.fromJson(x))),
        firstfinishedProjects: List<ClubProjectModel>.from(
            json["first_finished_projects"]
                .map((x) => ClubProjectModel.fromJson(x))),
        secondsugesstedProjects: List<ClubProjectModel>.from(
            json["second_sugessted_projects"]
                .map((x) => ClubProjectModel.fromJson(x))),
        secondinprogressProjects: List<ClubProjectModel>.from(
            json["second_inprogress_projects"]
                .map((x) => ClubProjectModel.fromJson(x))),
        secondfinishedProjects: List<ClubProjectModel>.from(
            json["second_finished_projects"]
                .map((x) => ClubProjectModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "match_id": matchId,
        "date": date,
        "country_timing": countryTiming,
        "time": time,
        "score": score,
        "first_team_id": firstTeamId,
        "first_team_name": firstTeamName,
        "first_team_score": firstTeamScore,
        "first_team_country": firstTeamCountry,
        "first_team_avatar": firstTeamAvatar,
        "first_team_coach": firstTeamCoach,
        "first_team_coach_id": firstTeamCoachId,
        "first_team_coach_avatar": firstTeamCoachAvatar,
        "team_matches": teamMatches,
        "first_team_win": firstTeamWin,
        "teams_Drawn": teamsDrawn,
        "second_team_win": secondTeamWin,
        "first_team_w_L_D": firstTeamWLD,
        "second_team_w_L_D": secondTeamWLD,
        "first_team_Goal_scorrers_name": firstTeamGoalScorrersName,
        "second_team_Goal_scorrers_name": secondTeamGoalScorrersName,
        "first_team_Goal_scorrers": firstTeamGoalScorrers,
        "second_team_Goal_scorrers": secondTeamGoalScorrers,
        "first_team_Expectation_win": firstTeamExpectationWin,
        "team__Expectation_drawn": teamExpectationDrawn,
        "second_team_Goal_Expectation_win": secondTeamGoalExpectationWin,
        "first_team_votes": firstTeamVotes,
        "second_team_votes": secondTeamVotes,
        "first_team_fans_number": firstTeamFansNumber,
        "second_team_fans_number": secondTeamFansNumber,
        "first_team_rank": firstTeamRank,
        "second_team_rank": secondTeamRank,
        "first_team_fans_attendance": firstTeamFansAttendance,
        "second_team_fans_attendance": secondTeamFansAttendance,
        "HighLights_images": List<dynamic>.from(highLightsImages.map((x) => x)),
        "first_team_news":
            List<dynamic>.from(firstTeamNews.map((x) => x.toJson())),
        "first_team_clubs":
            List<dynamic>.from(firstTeamClubs.map((x) => x.toJson())),
        "first_team_matches":
            List<dynamic>.from(firstTeamMatches.map((x) => x.toJson())),
        "first_sugessted_projects":
            List<dynamic>.from(firstsugesstedProjects.map((x) => x.toJson())),
        "first_inprogress_projects":
            List<dynamic>.from(firstinprogressProjects.map((x) => x.toJson())),
        "first_finished_projects":
            List<dynamic>.from(firstfinishedProjects.map((x) => x.toJson())),
        "second_sugessted_projects":
            List<dynamic>.from(secondsugesstedProjects.map((x) => x.toJson())),
        "second_inprogress_projects":
            List<dynamic>.from(secondinprogressProjects.map((x) => x.toJson())),
        "second_finished_projects":
            List<dynamic>.from(secondfinishedProjects.map((x) => x.toJson())),
        "second_team_id": secondTeamId,
        "second_team_name": secondTeamName,
        "second_team_score": secondTeamScore,
        "second_team_country": secondTeamCountry,
        "second_team_avatar": secondTeamAvatar,
        "tv_channel": tvChannel,
        "league": league,
        "league_avatar": leagueAvatar,
        "second_team_coach": secondTeamCoach,
        "second_team_coach_id": secondTeamCoachId,
        "second_team_coach_avatar": secondTeamCoachAvatar,
        "second_team_news":
            List<dynamic>.from(secondTeamNews.map((x) => x.toJson())),
        "second_team_clubs":
            List<dynamic>.from(secondTeamClubs.map((x) => x.toJson())),
        "second_team_matches":
            List<dynamic>.from(secondTeamMatches.map((x) => x.toJson())),
        "first_club_more":
            List<dynamic>.from(firstClubMore.map((x) => x.toJson())),
        "second_club_more":
            List<dynamic>.from(secondClubMore.map((x) => x.toJson())),
        "stadium_name": stadiumName,
        "first_team_Shoots_on": firstTeamShootsOn,
        "second_team_Shoots_on": secondTeamShootsOn,
        "first_team_target": firstTeamTarget,
        "second_team_target": secondTeamTarget,
        "first_team_Possession": firstTeamPossession,
        "second_team_Possession": secondTeamPossession,
        "first_team_Yellow_card": firstTeamYellowCard,
        "second_team_Yellow_card": secondTeamYellowCard,
        "first_team_red_card": firstTeamRedCard,
        "second_team_red_card": secondTeamRedCard,
        "first_team_goal": firstTeamGoal,
        "second_team_goal": secondTeamGoal,
        "first_team_saves": firstTeamSaves,
        "second_team_saves": secondTeamSaves,
        "first_team_pass_accuracy": firstTeamPassAccuracy,
        "second_team_pass_accuracy": secondTeamPassAccuracy,
        "first_team_fans_evalution": firstTeamFansEvalution,
        "second_team_fans_evalution": secondTeamFansEvalution,
        "first_team_Referee_performance": firstTeamRefereePerformance,
        "second_team_Referee_performance": secondTeamRefereePerformance,
        "man_of_match_picture": manOfMatchPicture,
        "second_club_years": List<dynamic>.from(secondClubYears.map((x) => x)),
        "first_club_years": List<dynamic>.from(firstClubYears.map((x) => x)),
        "Gallery":
            gallery == null ? null : List<dynamic>.from(gallery!.map((x) => x)),
        "first_club_goalKeeper": firstClubGoalKeeper == null
            ? null
            : List<dynamic>.from(firstClubGoalKeeper!.map((x) => x.toJson())),
        "first_club_defender": firstClubDefender == null
            ? null
            : List<dynamic>.from(firstClubDefender!.map((x) => x.toJson())),
        "first_club_center": firstClubCenter == null
            ? null
            : List<dynamic>.from(firstClubCenter!.map((x) => x.toJson())),
        "first_club_attack": firstClubAttack == null
            ? null
            : List<dynamic>.from(firstClubAttack!.map((x) => x.toJson())),
        "second_club_goalKeeper": secondClubGoalKeeper == null
            ? null
            : List<dynamic>.from(secondClubGoalKeeper!.map((x) => x.toJson())),
        "second_club_defender": secondClubDefender == null
            ? null
            : List<dynamic>.from(secondClubDefender!.map((x) => x.toJson())),
        "second_club_center": secondClubCenter == null
            ? null
            : List<dynamic>.from(secondClubCenter!.map((x) => x.toJson())),
        "second_club_attack": secondClubAttack == null
            ? null
            : List<dynamic>.from(secondClubAttack!.map((x) => x.toJson())),
        "first_club_goal_scorres": firstClubGoalScorres == null
            ? null
            : List<dynamic>.from(firstClubGoalScorres!.map((x) => x.toJson())),
        "second_club_goal_scorres": secondClubGoalScorres == null
            ? null
            : List<dynamic>.from(secondClubGoalScorres!.map((x) => x.toJson())),
      };
}
