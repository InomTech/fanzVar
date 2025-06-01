import 'package:fanzhashem/modules/my_inbox/messages.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInboxScreen extends StatelessWidget {
  const MyInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List myInboxList = [
      {
        "name": "Ahmed Seroug",
        "username": "@hmed1299",
        "msg": "see u soon",
        "img": "b1.jpg"
      },
      {
        "name": "Marwan Kholy",
        "username": "@kholy22",
        "msg": "see u soon",
        "img": "b2.jpg"
      },
      {
        "name": "Ezz Eldien",
        "username": "@ezz_eldin",
        "msg": "see u soon",
        "img": "Adams.jpg"
      },
      {
        "name": "Sandra Tawfik",
        "username": "@nck2345",
        "msg": "see u soon",
        "img": "girl.png"
      },
      {
        "name": "Ahmed Mohammed",
        "username": "@ahmed1299",
        "msg": "see u soon",
        "img": "pf.jpg"
      },
      {
        "name": "Adham Ali",
        "username": "@adham_ali",
        "msg": "see u soon",
        "img": "slider4.png"
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("My Inbox"),
        centerTitle: true,
        backgroundColor: lightBlackColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => Container(
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
          child: SingleChildScrollView(
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: myInboxList.length,
              itemBuilder: (BuildContext context, int index) {
                return InboxItem(
                  info: myInboxList[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: ScreenUtil().setHeight(10));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class InboxItem extends StatelessWidget {
  final info;
  const InboxItem({required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => InkWell(
        onTap: () {
          navigateTo(context, InboxMessagesScreen(title: info["name"]));
        },
        child: Container(
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(18)),
          child: ListTile(
              // tileColor: lightBlackColor,
              leading: CircleAvatar(
                radius: ScreenUtil().setSp(27),
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: ScreenUtil().setSp(26),
                  backgroundImage:
                      AssetImage("$assetImageBaseUrl${info["img"]}"),
                ),
              ),
              title: Text(
                "${info["name"]}",
                style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${info["username"]}",
                    style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${info["msg"]}",
                    style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  // navigateTo(context, FanProfileScreen());
                },
                child: containerBtnWithShadow("Follow", 12),
              )),
        ),
      ),
    );
  }
}

containerBtnWithShadow(txt, double txtSize) {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(5),
        horizontal: ScreenUtil().setWidth(15)),
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFe6dfd8), primaryColor],
        // isJoined == true
        //     ? [lightBlackColor, lightBlackColor]
        //     : [Color(0xFFe6dfd8), primaryColor],
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
