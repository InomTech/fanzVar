class FanProfileModel {
  String? profileImg;
  String? name;
  String? profileId;
  String? followers;
  String? following;
  String? info;
  List<Room>? rooms;
  List<Post>? posts;
  List? photos;

  FanProfileModel({
    this.profileImg,
    this.name,
    this.profileId,
    this.followers,
    this.following,
    this.info,
    this.rooms,
    this.posts,
    this.photos,
  });
  factory FanProfileModel.fromJson(Map<String, dynamic> json) {
    {
      return FanProfileModel(
        profileImg: json["profile_img"],
        name: json["name"],
        profileId: json["profile_id"],
        followers: json["followers"],
        following: json["following"],
        info: json["info"],
        rooms: List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
        photos: json["photos"].map((x) => x.toString()).toList(),
      );
    }
  }
}

class Room {
  String? profileImg;
  String? name;
  String? followersNo;
  String? created;
  List? fellowersImgs;
  Room({
    this.profileImg,
    this.name,
    this.followersNo,
    this.created,
    this.fellowersImgs,
  });
  factory Room.fromJson(Map<String, dynamic> json) {
    {
      return Room(
        profileImg: json["profile_img"],
        name: json["name"],
        followersNo: json["followers_no"],
        created: json["created"],
        fellowersImgs: json["followers_imgs"].map((x) => x.toString()).toList(),
      );
    }
  }
}

class Post {
  Post({
    this.date,
    this.caption,
    this.likesNo,
    this.commentsNo,
    this.sharedNo,
    this.savedPost,
    this.postImgs,
  });

  String? date;
  String? caption;
  String? likesNo;
  String? commentsNo;
  String? sharedNo;
  bool? savedPost;
  List<String>? postImgs;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        date: json["date"],
        caption: json["caption"],
        likesNo: json["likes_no"],
        commentsNo: json["comments_no"],
        sharedNo: json["shared_no"],
        savedPost: json["saved_post"],
        postImgs: List<String>.from(json["post_imgs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "caption": caption,
        "likes_no": likesNo,
        "comments_no": commentsNo,
        "shared_no": sharedNo,
        "saved_post": savedPost,
        "post_imgs": List<dynamic>.from(postImgs!.map((x) => x)),
      };
}
