class OtherSports {
  List<Sports>? sports;

  OtherSports({this.sports});

  OtherSports.fromJson(Map<String, dynamic> json) {
    if (json['Sports'] != null) {
      sports = <Sports>[];
      json['Sports'].forEach((v) {
        sports!.add(Sports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sports != null) {
      data['Sports'] = sports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sports {
  String? name;
  String? type;
  String? imageProfile;

  Sports({this.name, this.type, this.imageProfile});

  Sports.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    imageProfile = json['image_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['image_profile'] = imageProfile;
    return data;
  }
}
