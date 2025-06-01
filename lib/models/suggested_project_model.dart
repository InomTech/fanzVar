// To parse this JSON data, do
//
//     final suggestedProjectModel = suggestedProjectModelFromJson(jsonString);

import 'dart:convert';

SuggestedProjectModel suggestedProjectModelFromJson(String str) =>
    SuggestedProjectModel.fromJson(json.decode(str));

String suggestedProjectModelToJson(SuggestedProjectModel data) =>
    json.encode(data.toJson());

class SuggestedProjectModel {
  SuggestedProjectModel({
    required this.projectId,
    required this.projectName,
    required this.projectStatus,
    required this.commentsNum,
    required this.likesMun,
  });

  String projectId;
  String projectName;
  String projectStatus;
  String commentsNum;
  String likesMun;

  factory SuggestedProjectModel.fromJson(Map<String, dynamic> json) =>
      SuggestedProjectModel(
        projectId: json["project_id"],
        projectName: json["project_name"],
        projectStatus: json["project_status"],
        commentsNum: json["comments_num"],
        likesMun: json["likes_mun"],
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "project_name": projectName,
        "project_status": projectStatus,
        "comments_num": commentsNum,
        "likes_mun": likesMun,
      };
}
