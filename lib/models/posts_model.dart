class FeedsModel {
  FeedsModel({
    this.posts,
  });

  List<Post>? posts;

  factory FeedsModel.fromJson(Map<String, dynamic> json) => FeedsModel(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    this.profileImg,
    this.name,
    this.profileId,
    this.date,
    this.caption,
    this.likesNo,
    this.commentsNo,
    this.sharedNo,
    this.savedPost,
    this.postImgs,
  });

  String? profileImg;
  String? name;
  String? profileId;
  String? date;
  String? caption;
  String? likesNo;
  String? commentsNo;
  String? sharedNo;
  bool? savedPost;
  List<String>? postImgs;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        profileImg: json["profile_img"],
        name: json["name"],
        profileId: json["profile_id"],
        date: json["date"],
        caption: json["caption"],
        likesNo: json["likes_no"],
        commentsNo: json["comments_no"],
        sharedNo: json["shared_no"],
        savedPost: json["saved_post"],
        postImgs: List<String>.from(json["post_imgs"].map((x) => x)),
      );

  get matchId => null;

  get value => null;

  get type => null;

  Map<String, dynamic> toJson() => {
        "profile_img": profileImg,
        "name": name,
        "profile_id": profileId,
        "date": date,
        "caption": caption,
        "likes_no": likesNo,
        "comments_no": commentsNo,
        "shared_no": sharedNo,
        "saved_post": savedPost,
        "post_imgs": List<dynamic>.from(postImgs!.map((x) => x)),
      };
}
