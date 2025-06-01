// To parse this JSON data, do
//
//     final chatUserModel = chatUserModelFromJson(jsonString);

import 'dart:convert';

ChatUserModel chatUserModelFromJson(String str) =>
    ChatUserModel.fromJson(json.decode(str));

String chatUserModelToJson(ChatUserModel data) => json.encode(data.toJson());

class ChatUserModel {
  ChatUserModel({
    required this.memberId,
    required this.memberName,
    required this.memberAvatar,
    required this.memberStatus,
  });

  String memberId;
  String memberName;
  String memberAvatar;
  String memberStatus;

  factory ChatUserModel.fromJson(Map<String, dynamic> json) => ChatUserModel(
        memberId: json["member_id"],
        memberName: json["member_name"],
        memberAvatar: json["member_avatar"],
        memberStatus: json["member_status"],
      );

  Map<String, dynamic> toJson() => {
        "member_id": memberId,
        "member_name": memberName,
        "member_avatar": memberAvatar,
        "member_status": memberStatus,
      };
}
