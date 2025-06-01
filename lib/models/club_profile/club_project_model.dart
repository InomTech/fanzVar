import 'dart:convert';

// ignore: non_constant_identifier_names
ClubProjectModel ClubProjectModelFromJson(String str) =>
    ClubProjectModel.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String ClubProjectModelToJson(ClubProjectModel data) =>
    json.encode(data.toJson());

class ClubProjectModel {
  ClubProjectModel(
      {required this.projectName,
      required this.location,
      required this.budgets,
      required this.revenue,
      required this.cost,
      required this.voting,
      required this.bidingDate,
      required this.vacanciesNumberOfWorkers,
      required this.companies,
      required this.consultation,
      required this.projectDescription});

  String projectName;
  String location;
  String budgets;
  String revenue;
  String cost;
  String voting;
  String bidingDate;
  String projectDescription;
  String vacanciesNumberOfWorkers;
  List<String> companies;
  List<String> consultation;
  factory ClubProjectModel.fromJson(Map<String, dynamic> json) =>
      ClubProjectModel(
        projectName: json["project_name"],
        projectDescription: json["Description_projects"],
        location: json["location"],
        budgets: json["budgets"],
        revenue: json["revenue"],
        cost: json["cost"],
        voting: json["voting"],
        bidingDate: json["biding_date"],
        vacanciesNumberOfWorkers: json["vacancies_Number_of_workers "],
        companies: List<String>.from(json["companies"].map((x) => x)),
        consultation: List<String>.from(json["consultation"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "project_name": projectName,
        "Description_projects": projectDescription,
        "location": location,
        "budgets": budgets,
        "revenue": revenue,
        "cost": cost,
        "voting": voting,
        "biding_date": bidingDate,
        "vacancies_Number_of_workers ": vacanciesNumberOfWorkers,
        "companies": List<dynamic>.from(companies.map((x) => x)),
        "consultation": List<dynamic>.from(consultation.map((x) => x)),
      };
}
