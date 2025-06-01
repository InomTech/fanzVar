// To parse this JSON data, do
//
//     final chatMessageModel = chatMessageModelFromJson(jsonString);

import 'dart:convert';

ChatMessageModel chatMessageModelFromJson(String str) =>
    ChatMessageModel.fromJson(json.decode(str));

String chatMessageModelToJson(ChatMessageModel data) =>
    json.encode(data.toJson());

class ChatMessageModel {
  ChatMessageModel({
    required this.messageId,
    required this.messageContent,
    required this.messageTime,
    required this.messageDate,
    required this.isMe,
    required this.senderId,
    required this.senderName,
    required this.senderAvatar,
    required this.senderStatus,
  });

  String messageId;
  String messageContent;
  String messageTime;
  String messageDate;
  bool isMe;
  String senderId;
  String senderName;
  String senderAvatar;
  String senderStatus;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        messageId: json["message_id"],
        messageContent: json["message_content"],
        messageTime: json["message_time"],
        messageDate: json["message_date"],
        isMe: json["is_me"],
        senderId: json["sender_id"],
        senderName: json["sender_name"],
        senderAvatar: json["sender_avatar"],
        senderStatus: json["sender_status"],
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "message_content": messageContent,
        "message_time": messageTime,
        "message_date": messageDate,
        "is_me": isMe,
        "sender_id": senderId,
        "sender_name": senderName,
        "sender_avatar": senderAvatar,
        "sender_status": senderStatus,
      };
}
