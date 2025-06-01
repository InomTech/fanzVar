import 'package:fanzhashem/models/fans_model.dart';
import 'package:fanzhashem/modules/fan_profile/fan_profile_screen.dart';
import 'package:fanzhashem/modules/fans/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/cubit.dart';

class FanItem extends StatelessWidget {
  final Fan fan;
  const FanItem({super.key, required this.fan});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FansCubit(),
      child: BlocConsumer<FansCubit, FansStates>(
        listener: (context, state) async {
          // if (state is GetSuggestedProjectsState) {
          //   suggestedProjects = state.suggestedProjects;
          // }
        },
        builder: (context, state) {
          var cubit = FansCubit.get(context);
          return ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) => Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(18)),
              child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      navigateTo(context, FanProfileScreen());
                    },
                    child: CircleAvatar(
                      radius: ScreenUtil().setSp(27),
                      backgroundColor: Colors.grey,
                      child: CircleAvatar(
                        radius: ScreenUtil().setSp(26),
                        backgroundImage: NetworkImage("${fan.profileImg}"),
                      ),
                    ),
                  ),
                  title: InkWell(
                    onTap: () {
                      navigateTo(context, FanProfileScreen());
                    },
                    child: Text(
                      "${fan.name}",
                      style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      navigateTo(context, FanProfileScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${fan.profileId}",
                          style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${fan.lastMessage}",
                          style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      cubit.following();
                      // navigateTo(context, FanProfileScreen());
                    },
                    child: cubit.follow
                        ? containerBtnWithShadow("Follow", 12, false)
                        : containerBtnWithShadow("Following", 12, false),
                  )),
            ),
          );
        },
      ),
    );
  }
}

containerBtnWithShadow(txt, double txtSize, bool isJoined) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(5),
        horizontal: ScreenUtil().setWidth(15)),
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        colors: isJoined == true
            ? [lightBlackColor, lightBlackColor]
            : [Color(0xFFe6dfd8), primaryColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.4],
        tileMode: TileMode.clamp,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(25))),
      ),
    ),
    child: Text(
      "$txt",
      style: TextStyle(fontSize: ScreenUtil().setSp(txtSize)),
    ),
  );
}
