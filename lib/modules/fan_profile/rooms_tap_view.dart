import 'package:fanzhashem/modules/fan_profile/widgets/room_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomsTapView extends StatefulWidget {
  final fanProfile;
  const RoomsTapView({super.key, required this.fanProfile});

  @override
  State<RoomsTapView> createState() => _RoomsTapViewState();
}

class _RoomsTapViewState extends State<RoomsTapView> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
        child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: ScreenUtil().setWidth(210),
              childAspectRatio: 3 / 2.2,
              crossAxisSpacing: ScreenUtil().setWidth(5),
              mainAxisSpacing: ScreenUtil().setHeight(20),
            ),
            itemCount: widget.fanProfile.rooms!.length,
            itemBuilder: (context, index) => RoomItem(
                  room: widget.fanProfile.rooms![index],
                )),
      ),
    );
  }
}
