import 'package:fanzhashem/models/fan_profile.dart';
import 'package:fanzhashem/modules/feeds/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsTabView extends StatelessWidget {
  final FanProfileModel fanProfile;
  const PostsTabView({super.key, required this.fanProfile});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: fanProfile.posts!.length,
        itemBuilder: (context, index) => PostItem(
          profileID: fanProfile.profileId,
          profileImg: fanProfile.profileImg,
          profileName: fanProfile.name,
          caption: fanProfile.posts![index].caption,
          postImgs: fanProfile.posts![index].postImgs,
          comments: fanProfile.posts![index].commentsNo,
          likes: fanProfile.posts![index].likesNo,
          shares: fanProfile.posts![index].sharedNo,
          isMainScreen: false,
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: ScreenUtil().setHeight(12),
        ),
      ),
    );
  }
}
