import 'package:fanzhashem/modules/feeds/cubit/cubit.dart';
import 'package:fanzhashem/modules/feeds/post.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cubit/states.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final GlobalKey<ScaffoldState> _feedscaffoldKey =
  new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedsCubit>(
      create: (context) => FeedsCubit()..getFeedsData('feeds'),
      child: BlocConsumer<FeedsCubit, FeedsStates>(
        listener: (context, state) async {},
        builder: (context, state) {
          final posts = FeedsCubit.get(context).posts;
          return Scaffold(
            key: _feedscaffoldKey,
            backgroundColor: darkBlackColor,
            appBar: appBar(_feedscaffoldKey, "Feeds", context,
                isMain: false,
                isHome: true,
                goldEdgeColor: false,
                refresh: () {}),
            body: posts != null
                ? SingleChildScrollView(
              child: ScreenUtilInit(
                minTextAdapt: true,
                splitScreenMode: true,
                // builder: (ctx) => Container(
                //   margin:
                //   EdgeInsets.only(bottom: ScreenUtil().setHeight(12)),
                //   child: ListView.separated(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: posts.length,
                //     itemBuilder: (context, index) => PostItem(
                //       profileID: posts[index].profileId,
                //       profileImg: posts[index].profileImg,
                //       profileName: posts[index].name,
                //       caption: posts[index].caption,
                //       postImgs: posts[index].postImgs,
                //       comments: posts[index].commentsNo,
                //       likes: posts[index].likesNo,
                //       shares: posts[index].sharedNo,
                //       isMainScreen: true,
                //     ),
                //     separatorBuilder: (context, index) => SizedBox(
                //       height: ScreenUtil().setHeight(12),
                //     ),
                //   ),
                // ),
              ),
            )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
