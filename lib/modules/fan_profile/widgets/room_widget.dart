// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/models/fan_profile.dart';
import 'package:fanzhashem/modules/fans/fans_item.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoomItem extends StatefulWidget {
  final Room room;
  const RoomItem({super.key, required this.room});

  @override
  State<RoomItem> createState() => _RoomItemState();
}

class _RoomItemState extends State<RoomItem> {
  bool isJoined = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(9)),
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setSp(35))),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(25),
                  backgroundImage: NetworkImage("${widget.room.profileImg}"),
                ),
                SizedBox(width: ScreenUtil().setWidth(5)),
                Expanded(
                    child: Text(
                  "${widget.room.name}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                )),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(38),
                  child: Stack(
                    children: [
                      Positioned(
                        left: ScreenUtil().setSp(20),
                        child: CircleAvatar(
                          radius: ScreenUtil().setSp(7),
                          backgroundImage:
                              NetworkImage("${widget.room.fellowersImgs![0]}"),
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setSp(15),
                        child: CircleAvatar(
                          radius: ScreenUtil().setSp(7),
                          backgroundImage:
                              NetworkImage("${widget.room.fellowersImgs![1]}"),
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setSp(10),
                        child: CircleAvatar(
                          radius: ScreenUtil().setSp(7),
                          backgroundImage:
                              NetworkImage("${widget.room.fellowersImgs![2]}"),
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setSp(5),
                        child: CircleAvatar(
                          radius: ScreenUtil().setSp(7),
                          backgroundImage:
                              NetworkImage("${widget.room.fellowersImgs![3]}"),
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          radius: ScreenUtil().setSp(7),
                          backgroundImage:
                              NetworkImage("${widget.room.fellowersImgs![4]}"),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.room.followersNo} Members",
                  style: TextStyle(fontSize: ScreenUtil().setSp(9)),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    Text(
                      "Created:${widget.room.created}",
                      style: TextStyle(fontSize: ScreenUtil().setSp(8)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    ////////////////////////////////////////////////////////

                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        contentPadding: EdgeInsets.only(top: 10.0),
                        title: Icon(
                          Icons.sports_football,
                          color: Colors.white,
                          size: 40,
                        ),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Join \" ${widget.room.name} \" room",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 12.0, top: 12.0),
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.0, 0.21],
                                    colors: isJoined == true
                                        ? [
                                            Colors.grey.withOpacity(0.5),
                                            Colors.grey.withOpacity(0.2),
                                          ]
                                        : [
                                            Color(0xD9F9F9F9),
                                            Color(0xffCDA250),
                                          ],
                                  ),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    shape: WidgetStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isJoined = !isJoined;
                                    });
                                    showToast(
                                        msg:
                                            "You have joined the room successfully");
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Join",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              // child: TxtButton(
                              //   color: primaryColor,
                              //   text: "join",
                              //   borderRadius: 10,
                              //   horizontalPadding: 35,
                              //   verticalPadding: 10,
                              //   onPressed: () {
                              //     // updateIsJoined();
                              //     setState(() {
                              //       isJoined = !isJoined;
                              //     });
                              //     showToast(
                              //         msg:
                              //             "You have joined the room successfully");
                              //     Navigator.pop(context);
                              //   },
                              // ),
                            ),
                          ),
                        ],
                      ),
                    );

                    ////////////////////////////////////////////////////////
                  },
                  child: containerBtnWithShadow(
                      isJoined == true ? "Joined" : "join", 10, isJoined),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
