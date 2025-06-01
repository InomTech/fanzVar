// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.title,
    required this.image,
    required this.link,
  });

  String title;
  String image;
  String link;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        title: json["title"],
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "image": image,
        "link": link,
      };
}
