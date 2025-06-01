import 'package:fanzhashem/modules/fan_profile/widgets/widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoSection extends StatefulWidget {
  final fanProfile;

  const InfoSection({super.key, required this.fanProfile});

  @override
  State<InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> {
  bool isFollowing = false;
  var msgController = TextEditingController();
  var msgForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Column(
        children: [
          CircleAvatar(
            radius: ScreenUtil().setSp(37),
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: ScreenUtil().setSp(36),
              backgroundImage: NetworkImage("${widget.fanProfile.profileImg}"),
            ),
          ),
          SizedBox(width: double.infinity, height: ScreenUtil().setHeight(15)),
          Text(
            "${widget.fanProfile.name}",
            style: TextStyle(fontSize: ScreenUtil().setSp(9)),
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "${widget.fanProfile.followers}",
                    style: TextStyle(fontSize: ScreenUtil().setSp(17)),
                  ),
                  Text(
                    "Followers",
                    style: TextStyle(fontSize: ScreenUtil().setSp(9)),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "${widget.fanProfile.following}",
                    style: TextStyle(fontSize: ScreenUtil().setSp(17)),
                  ),
                  Text(
                    "Following",
                    style: TextStyle(fontSize: ScreenUtil().setSp(9)),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                child: followContainer("Follow", 16, isFollowing),
              ),
              GestureDetector(
                onTap: () {
                  ///////////////////////////////////////////////////
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      contentPadding: EdgeInsets.only(top: 10.0),
                      title: Icon(
                        Icons.message_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                      content: Form(
                        key: msgForm,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: height / 22,
                              width: width / 1.8,
                              decoration: BoxDecoration(
                                color: lightBlackColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width / 1.8,
                              child: TextFormField(
                                controller: msgController,
                                decoration: InputDecoration(
                                  hintText: "Write your message",
                                  hintStyle: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                ),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter message";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 12.0, top: 12.0),
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
                                  colors: [
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
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  if (msgForm.currentState!.validate() ==
                                      true) {
                                    showToast(
                                        msg:
                                            "Your message has been successfully sent");
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  ///////////////////////////////////////////////////
                },
                child: messageContainer("Message", 16),
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(15)),
          Text(
            "${widget.fanProfile.info}",
            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

sendMessageAlert() {}
