import 'package:fanzhashem/modules/feeds/cubit/cubit.dart';
import 'package:fanzhashem/modules/feeds/cubit/states.dart';
import 'package:fanzhashem/modules/feeds/post.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FanBook extends StatefulWidget {
  final title;

  const FanBook({required this.title, super.key});

  @override
  State<FanBook> createState() => _FanBookState();
}

class _FanBookState extends State<FanBook> {
  final GlobalKey<ScaffoldState> _feedscaffoldKey = GlobalKey<ScaffoldState>();
  bool isShowSearching = true;

  @override
  Widget build(BuildContext context) {
    var blocConsumer = BlocConsumer<FeedsCubit, FeedsStates>(
      listener: (context, state) async {},
      builder: (context, state) {
        final posts = FeedsCubit.get(context).posts;
        // widget.title == 'Annual Festival Day'
        //     ? Text('Incoming Events')
        //     : SizedBox();
        return Scaffold(
            key: _feedscaffoldKey,
            backgroundColor: darkBlackColor,
            appBar: appBar(_feedscaffoldKey, widget.title, context,
                isMain: false,
                isHome: true,
                goldEdgeColor: false,
                isShowSearch: isShowSearching,
                isSearchScreen: !isShowSearching, refresh: () {
              if (mounted) {
                setState(() {
                  isShowSearching = !isShowSearching;
                });
              }
            }),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  widget.title == 'Annual Festival Day'
                      ? Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            'Incoming Eventss',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      : SizedBox(),
                  posts != null
                      ? ScreenUtilInit(
                          minTextAdapt: true,
                          splitScreenMode: true,
                          builder: (context, child) => Container(
                            margin: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(12)),
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: posts.length,
                              itemBuilder: (context, index) => PostItem(
                                profileID: posts[index].profileId,
                                profileImg: posts[index].profileImg,
                                profileName: posts[index].name,
                                caption: posts[index].caption,
                                postImgs: posts[index].postImgs,
                                comments: posts[index].commentsNo,
                                likes: posts[index].likesNo,
                                shares: posts[index].sharedNo,
                                isMainScreen: true,
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                //height: ScreenUtil().setHeight(12),
                              ),
                            ),
                          ),
                        )
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
            ));
      },
    );
    return BlocProvider<FeedsCubit>(
      create: (context) => FeedsCubit()..getFeedsData(widget.title),
      child: blocConsumer,
    );
  }
}
