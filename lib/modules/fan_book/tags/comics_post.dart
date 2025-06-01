import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ComicsPostItem extends StatefulWidget {
  final String? profileImg;
  final String? profileName;
  final String? profileID;
  final String? caption;
  final String? likes;
  final String? comments;
  final String? shares;
  final bool isMainScreen;
  final List? postImgs;
  const ComicsPostItem({
    super.key,
    required this.profileName,
    required this.profileID,
    required this.profileImg,
    required this.postImgs,
    required this.likes,
    required this.comments,
    required this.shares,
    this.isMainScreen = false,
    this.caption = "",
  });

  @override
  State<ComicsPostItem> createState() => _PostItemState();
}

class _PostItemState extends State<ComicsPostItem> {
  late TextEditingController ctrl;
  List<String> users = [
        'liverpool',
        'manchester city',
        'moo salah',
        'arsenal',
        'manchester united'
      ],
      words = [];
  String str = '';
  List<String> coments = [];

  @override
  void initState() {
    super.initState();
    ctrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: ScreenUtil().setSp(27),
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: ScreenUtil().setSp(26),
                  backgroundImage: NetworkImage("${widget.profileImg}"),
                ),
              ),
              title: Text(
                "${widget.profileName}",
                style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                "${widget.profileID}",
                style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: widget.isMainScreen
                  ? GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        size: ScreenUtil().setSp(12),
                      ),
                    )
                  : SizedBox(),
            ),
            SizedBox(height: ScreenUtil().setHeight(2)),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(85),
                  right: ScreenUtil().setWidth(20)),
              child: Column(
                //this colum has a padding
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.caption}",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(9),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(4)),
                  widget.postImgs != null
                      ? widget.postImgs!.length == 1
                          ? singleImg(widget.postImgs![0],
                              ScreenUtil().setWidth(screenWidth - 151))
                          : widget.postImgs!.length == 2
                              ? twoImgs(
                                  widget.postImgs!,
                                  ScreenUtil()
                                      .setWidth((screenWidth - 151) / 2))
                              : SizedBox() //<= if more than 2 imgs
                      : SizedBox(),
                  SizedBox(height: ScreenUtil().setHeight(4)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      postButtons(Icons.favorite, widget.likes),
                      postButtons(Icons.pending_outlined, widget.comments),
                      postButtons(Icons.screen_share_outlined, widget.shares),
                      Icon(
                        Icons.bookmark_border_rounded,
                        size: ScreenUtil().setSp(20),
                        color: primaryColor,
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(4)),
                  // writeCommentWidget(commentController),
                ],
              ),
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(85),
                    right: ScreenUtil().setWidth(20)),
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(ScreenUtil().setSp(25))),
                ),
                height: ScreenUtil().setHeight(25),
                child: TextField(
                    controller: ctrl,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write your comment',
                      hintStyle: TextStyle(
                          color: Colors.white, fontSize: ScreenUtil().setSp(9)),
                      // hintStyle: TextStyle(color: Colors.white),
                      // suffixIcon: IconButton(
                      //     icon: Icon(Icons.send, color: Colors.blue),
                      //     onPressed: () {
                      //       if (ctrl.text.isNotEmpty)
                      //         setState(() {
                      //           coments.add(ctrl.text);
                      //         });
                      //     }),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(9),
                      height: 0.4,
                    ),
                    onChanged: (val) {
                      setState(() {
                        words = val.split(' ');
                        str = words.isNotEmpty &&
                                words[words.length - 1].startsWith('@')
                            ? words[words.length - 1]
                            : '';
                      });
                    }),
              ),
              str.length > 1
                  ? ListView(
                      shrinkWrap: true,
                      children: users.map((s) {
                        if (('@$s').contains(str)) {
                          return ListTile(
                              title: Container(
                                margin: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(85),
                                    right: ScreenUtil().setWidth(20)),
                                child: Text(
                                  s,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                String tmp = str.substring(1, str.length);
                                setState(() {
                                  str = '';
                                  ctrl.text += s
                                      .substring(
                                          s.indexOf(tmp) + tmp.length, s.length)
                                      .replaceAll(' ', '_');
                                });
                              });
                        } else {
                          return SizedBox();
                        }
                      }).toList())
                  : SizedBox(),
              SizedBox(height: 25),
              coments.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: coments.length,
                      itemBuilder: (con, ind) {
                        return Text.rich(
                          TextSpan(
                              text: '',
                              children: coments[ind].split(' ').map((w) {
                                return w.startsWith('@') && w.length > 1
                                    ? TextSpan(
                                        text: ' $w',
                                        style: TextStyle(color: Colors.white),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => showProfile(w),
                                      )
                                    : TextSpan(
                                        text: ' $w',
                                        style: TextStyle(color: Colors.black));
                              }).toList()),
                        );
                      },
                    )
                  : SizedBox()
            ]),
          ],
        ),
      ),
    );
  }

  showProfile(String s) {
    showDialog(
        context: context,
        builder: (con) => AlertDialog(
            title: Text(
              'Profile of $s',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Show the user profile !',
              style: TextStyle(color: Colors.white),
            )));
  }

  singleImg(String url, double width) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }

  twoImgs(List imgs, double width) {
    return Row(
      children: [
        singleImg(imgs[0], width),
        SizedBox(width: 10),
        singleImg(imgs[1], width),
      ],
    );
  }

  postButtons(icon, txt) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: ScreenUtil().setSp(20),
          color: primaryColor,
        ),
        SizedBox(width: 10),
        Text(
          txt,
          style: TextStyle(fontSize: ScreenUtil().setSp(7)),
        ),
      ],
    );
  }

  writeCommentWidget(commentController) {
    return Container(
      //  margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(5)),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
      decoration: BoxDecoration(
        color: lightBlackColor,
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(25))),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: ScreenUtil().setHeight(25),
              child: Center(
                child: TextField(
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(9),
                    height: 0.2,
                  ),
                  // maxLines: 2,
                  controller: commentController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your commentmmmm',
                    hintStyle: TextStyle(fontSize: ScreenUtil().setSp(9)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
