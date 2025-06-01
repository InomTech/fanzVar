import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendMsgWidget extends StatelessWidget {
  const SendMsgWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController msgController = TextEditingController();

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Container(
        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
        decoration: BoxDecoration(
          color: lightBlackColor,
          borderRadius:
              BorderRadius.all(Radius.circular(ScreenUtil().setSp(25))),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: ScreenUtil().setSp(12),
              backgroundImage: NetworkImage(
                  "https://previews.123rf.com/images/anaken2012/anaken20121206/anaken2012120604063/14076799-fani-pi%C5%82ki-no%C5%BCnej.jpg"),
            ),
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                child: TextField(
                  controller: msgController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Write your message',
                    labelStyle: TextStyle(fontSize: ScreenUtil().setSp(9)),
                  ),
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                  color: primaryColor,
                  size: ScreenUtil().setSp(14),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.emoji_emotions_outlined,
                  color: primaryColor,
                  size: ScreenUtil().setSp(14),
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: primaryColor,
                  size: ScreenUtil().setSp(14),
                ))
          ],
        ),
      ),
    );
  }
}
