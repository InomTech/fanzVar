import 'package:fanzhashem/modules/fan_profile/photos_tap_view.dart';
import 'package:fanzhashem/modules/fan_profile/rooms_tap_view.dart';
import 'package:fanzhashem/modules/fan_profile/widgets/widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'info_section.dart';
import 'posts_tap_view.dart';

class FanProfileScreen extends StatefulWidget {
  const FanProfileScreen({super.key});

  @override
  State<FanProfileScreen> createState() => _FanProfileScreenState();
}

class _FanProfileScreenState extends State<FanProfileScreen> {
  final GlobalKey<ScaffoldState> _fanscaffoldKey = GlobalKey<ScaffoldState>();
  int currentindx = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FanProfileCubit>(
      create: (context) => FanProfileCubit()..getFanData(),
      child: BlocConsumer<FanProfileCubit, FansProfileStates>(
        listener: (context, state) async {},
        builder: (context, state) {
          final fanProfile = FanProfileCubit.get(context).fanProfile;
          //this list for the tab bar pages (rooms, posts, photos)
          List<Widget> tabViewPages = [
            RoomsTapView(fanProfile: fanProfile),
            fanProfile != null
                ? PostsTabView(fanProfile: fanProfile)
                : SizedBox(),
            fanProfile != null
                ? PhotosTapView(photos: fanProfile.photos!)
                : SizedBox(),
          ];
          return Scaffold(
            key: _fanscaffoldKey,
            backgroundColor: darkBlackColor,
            appBar: appBar(_fanscaffoldKey, "Ahmed seroug", context,
                isMain: false,
                isHome: true,
                goldEdgeColor: false,
                refresh: () {}),
            body: fanProfile != null
                ? ScreenUtilInit(
                    minTextAdapt: true,
                    splitScreenMode: true,
                    builder: (context, child) => SingleChildScrollView(
                      child: Container(
                        margin:
                            EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InfoSection(fanProfile: fanProfile),
                            SizedBox(height: ScreenUtil().setHeight(15)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                tabBarBtn("Rooms", currentindx == 0,
                                    () => setState(() => currentindx = 0)),
                                tabBarBtn("Posts", currentindx == 1,
                                    () => setState(() => currentindx = 1)),
                                tabBarBtn("Photos", currentindx == 2,
                                    () => setState(() => currentindx = 2)),
                              ],
                            ),
                            tabViewPages[currentindx],
                            // Text(
                            //   "see more",
                            //   style: TextStyle(fontSize: ScreenUtil().setSp(9)),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
