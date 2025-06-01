class FansModel {
  List<Fan>? fans;
  FansModel({this.fans});
  factory FansModel.fromJson(Map<String, dynamic> json) {
    {
      return FansModel(
        fans: List<Fan>.from(json["fans"].map((x) => Fan.fromJson(x))),
      );
    }
  }
}

class Fan {
  String? profileImg;
  String? name;
  String? profileId;
  String? lastMessage;
  Fan({
    this.profileImg,
    this.name,
    this.profileId,
    this.lastMessage,
  });
  factory Fan.fromJson(Map<String, dynamic> json) {
    {
      return Fan(
        profileImg: json["profile_img"],
        name: json["name"],
        profileId: json["profile_id"],
        lastMessage: json["last_message"],
      );
    }
  }
}
