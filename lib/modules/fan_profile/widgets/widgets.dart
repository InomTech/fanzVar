import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

followContainer(txt, double txtSize, bool isFollowing) {
  return ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(10),
          horizontal: ScreenUtil().setWidth(20)),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: isFollowing == true
              ? [lightBlackColor, lightBlackColor]
              : [Color(0xFFe6dfd8), primaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setSp(17))),
        ),
      ),
      child: Text(
        isFollowing == true ? "Following" : "Follow",
        // "$txt",
        style: TextStyle(fontSize: ScreenUtil().setSp(txtSize)),
      ),
    ),
  );
}

messageContainer(txt, double txtSize) {
  return ScreenUtilInit(
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(10),
          horizontal: ScreenUtil().setWidth(20)),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe6dfd8), primaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setSp(17))),
        ),
      ),
      child: Text(
        "$txt",
        style: TextStyle(fontSize: ScreenUtil().setSp(txtSize)),
      ),
    ),
  );
}

Widget tabBarBtn(txt, isSelected, onTapFun) {
  return GestureDetector(
    onTap: onTapFun,
    child: ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Container(
        width: ScreenUtil().setWidth(90),
        padding: EdgeInsets.symmetric(
          // horizontal: ScreenUtil().setWidth(12),
          vertical: ScreenUtil().setWidth(9),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenUtil().setSp(9)),
          color: isSelected ? primaryColor : Colors.white10,
        ),
        child: Center(
          child: Text(
            "$txt",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16),
              color: isSelected ? Colors.black : primaryColor,
            ),
          ),
        ),
      ),
    ),
  );
}
