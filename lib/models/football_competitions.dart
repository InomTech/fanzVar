class FootballCompetitions {
  FootballCompetitions({
    this.competitions,
  });

  List<Competition>? competitions;

  factory FootballCompetitions.fromJson(Map<String, dynamic> json) {
    return FootballCompetitions(
      competitions: List<Competition>.from(
          json["competitions"].map((x) => Competition.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "competitions":
            List<dynamic>.from(competitions!.map((x) => x.toJson())),
      };
}

class Competition {
  Competition(
      {this.name,
      this.isAvailable,
      this.isJoined,
      this.teamName,
      this.age,
      this.country,
      this.city,
      this.dueDate,
      this.startDate,
      this.seats,
      this.location,
      this.longitude,
      this.latitude,
      this.matches,
      this.gallery,
      this.groups,
      this.groupResult,
      this.competitionRules,
      this.totalTeams,
      this.marketingAgency,
      this.marketingAgencyImage,
      this.maxTeams});

  String? name;
  bool? isAvailable;
  bool? isJoined;
  String? teamName;
  int? age;
  String? startDate;
  int? seats;
  String? location;
  double? longitude;
  double? latitude;
  List<Match>? matches;
  List<String>? gallery;
  List<Group>? groups;
  List<GroupResult>? groupResult;
  String? competitionRules;
  String? country;
  String? city;
  String? dueDate;
  String? marketingAgency;
  String? marketingAgencyImage;
  int? totalTeams;
  int? maxTeams;

  factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        name: json["name"],
        isAvailable: json["is_available"],
        isJoined: json["is_joined"],
        teamName: json["team_name"],
        marketingAgency: json["marketing_agency"],
        marketingAgencyImage: json["marketing_agency_image"],
        age: json["age"],
        country: json["country"],
        city: json["city"],
        dueDate: json["dueDate"],
        startDate: json["start_date"],
        seats: json["seats"],
        location: json["location"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        totalTeams: json["total_teams"],
        maxTeams: json["max_teams"],
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
        gallery: List.from(json["gallery"].map((x) => x.toString())),
        groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
        groupResult: List<GroupResult>.from(
            json["group_result"].map((x) => GroupResult.fromJson(x))),
        competitionRules: json["competition_rules"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "is_available": isAvailable,
        "is_joined": isJoined,
        "team_name": teamName,
        "age": age,
        "country": country,
        "city": city,
        "dueDate": dueDate,
        "start_date": startDate,
        "seats": seats,
        "location": location,
        "longitude": longitude,
        "latitude": latitude,
        "total_teams": totalTeams,
        "max_teams": maxTeams,
        "matches": List<dynamic>.from(matches!.map((x) => x.toJson())),
        "gallery": List<dynamic>.from(gallery!.map((x) => x)),
        "groups": List<dynamic>.from(groups!.map((x) => x.toJson())),
        "group_result": List<dynamic>.from(groupResult!.map((x) => x.toJson())),
        "competition_rules": competitionRules,
        "marketing_agency": marketingAgency,
        "marketing_agency_image": marketingAgencyImage,
      };
}

class GroupResult {
  GroupResult({
    this.groupName,
    this.teams,
  });

  String? groupName;
  List<GroupResultTeam>? teams;

  factory GroupResult.fromJson(Map<String, dynamic> json) => GroupResult(
        groupName: json["group_name"],
        teams: List<GroupResultTeam>.from(
            json["teams"].map((x) => GroupResultTeam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "group_name": groupName,
        "teams": List<dynamic>.from(teams!.map((x) => x.toJson())),
      };
}

class GroupResultTeam {
  GroupResultTeam({
    this.firstTeamName,
    this.firstTeamScore,
    this.secondTeamName,
    this.secondTeamScore,
  });

  String? firstTeamName;
  int? firstTeamScore;
  String? secondTeamName;
  int? secondTeamScore;

  factory GroupResultTeam.fromJson(Map<String, dynamic> json) =>
      GroupResultTeam(
        firstTeamName: json["first_team_name"],
        firstTeamScore: json["first_team_score"],
        secondTeamName: json["second_team_name"],
        secondTeamScore: json["second_team_score"],
      );

  Map<String, dynamic> toJson() => {
        "first_team_name": firstTeamName,
        "first_team_score": firstTeamScore,
        "second_team_name": secondTeamName,
        "second_team_score": secondTeamScore,
      };
}

class Group {
  Group({
    this.groupName,
    this.teams,
  });

  String? groupName;
  List<GroupTeam>? teams;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        groupName: json["group_name"],
        teams: List<GroupTeam>.from(
            json["teams"].map((x) => GroupTeam.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "group_name": groupName,
        "teams": List<dynamic>.from(teams!.map((x) => x.toJson())),
      };
}

class GroupTeam {
  GroupTeam({
    this.teamName,
    this.league,
    this.rate,
  });

  String? teamName;
  String? league;
  double? rate;

  factory GroupTeam.fromJson(Map<String, dynamic> json) => GroupTeam(
        teamName: json["team_name"],
        league: json["league"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "team_name": teamName,
        "league": league,
        "rate": rate,
      };
}

class Match {
  Match({
    this.firstTeamName,
    this.firstTeamScore,
    this.firstTeamImg,
    this.secondTeamName,
    this.secondTeamScore,
    this.secondTeamImg,
    this.date,
    this.firstTeamMatchDetails,
    this.secondTeamMatchDetails,
    this.tactcs,
    this.highlight,
  });

  String? firstTeamName;
  int? firstTeamScore;
  String? firstTeamImg;
  String? secondTeamName;
  int? secondTeamScore;
  String? secondTeamImg;
  String? date;
  TeamMatchDetails? firstTeamMatchDetails;
  TeamMatchDetails? secondTeamMatchDetails;
  String? tactcs;
  List? highlight;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        firstTeamName: json["first_team_name"],
        firstTeamScore: json["first_team_score"],
        firstTeamImg: json["first_team_img"],
        secondTeamName: json["second_team_name"],
        secondTeamScore: json["second_team_score"],
        secondTeamImg: json["second_team_img"],
        date: json["date"],
        firstTeamMatchDetails:
            TeamMatchDetails.fromJson(json["first_team_match_details"]),
        secondTeamMatchDetails:
            TeamMatchDetails.fromJson(json["second_team_match_details"]),
        tactcs: json["tactcs"],
        highlight: List.from(json["highlight"].map((x) => json[x])),
      );

  Map<String, dynamic> toJson() => {
        "first_team_name": firstTeamName,
        "first_team_score": firstTeamScore,
        "first_team_img": firstTeamImg,
        "second_team_name": secondTeamName,
        "second_team_score": secondTeamScore,
        "second_team_img": secondTeamImg,
        "date": date,
        "first_team_match_details": firstTeamMatchDetails!.toJson(),
        "second_team_match_details": secondTeamMatchDetails!.toJson(),
        "tactcs": tactcs,
        "highlight": List<dynamic>.from(highlight!.map((x) => x.toJson())),
      };
}

class TeamMatchDetails {
  TeamMatchDetails({
    this.played,
    this.won,
    this.drawn,
    this.lost,
    this.scored,
    this.conceded,
    this.points,
  });

  int? played;
  int? won;
  int? drawn;
  int? lost;
  int? scored;
  int? conceded;
  int? points;

  factory TeamMatchDetails.fromJson(Map<String, dynamic> json) =>
      TeamMatchDetails(
        played: json["played"],
        won: json["won"],
        drawn: json["drawn"],
        lost: json["lost"],
        scored: json["scored"],
        conceded: json["conceded"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "played": played,
        "won": won,
        "drawn": drawn,
        "lost": lost,
        "scored": scored,
        "conceded": conceded,
        "points": points,
      };
}
/*
class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
  
}
*/
