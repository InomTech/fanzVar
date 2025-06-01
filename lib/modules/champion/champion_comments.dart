import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../widgets/shared_widget.dart';

class ChampionComments extends StatefulWidget {
  final championComments;
  const ChampionComments({required this.championComments, super.key});

  @override
  State<ChampionComments> createState() => _ChampionCommentsState();
}

class _ChampionCommentsState extends State<ChampionComments> {
  var commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                /// ============ Swiper ==============
                SizedBox(
                  height: 300,
                  child: Swiper(
                    autoplay: false,
                    itemCount: widget.championComments.length,
                    scale: 0.9,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 25, top: 10, right: 10, left: 10),
                        child: commentContent(
                            comment: widget.championComments[index]),
                      );
                    },
                    pagination: SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(
                          right: 10.0, left: 10, top: 0, bottom: 0),
                      builder: DotSwiperPaginationBuilder(
                        size: 12,
                        activeSize: 12,
                        color: Colors.white54,
                        activeColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                /// ========== Add Comment ===========
                TxtButton(
                  color: primaryColor,
                  text: "Add new comment",
                  txtSize: 14,
                  txtColor: lightBlackColor,
                  borderRadius: 10,
                  horizontalPadding: 35,
                  verticalPadding: 10,
                  onPressed: () => showAddCommentAlertDialog(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAddCommentAlertDialog(context) => showDialog(
        barrierDismissible: true,
        context: context,
        builder: (ctx) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              height: 60,
              color: primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ADD COMMENT",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          titlePadding: const EdgeInsets.all(0),
          content: Container(
            padding: const EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height / 4.5,
            child: Card(
              elevation: 0,
              color: lightBlackColor,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Color(0xFF424242),
                  ),
                  borderRadius: BorderRadius.circular(18.0)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: commentController,
                  maxLines: 6,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration.collapsed(
                    hintText: "Add comment here",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TxtButton(
                  color: primaryColor,
                  text: "Add comment",
                  txtSize: 13,
                  txtColor: lightBlackColor,
                  borderRadius: 10,
                  horizontalPadding: 30,
                  verticalPadding: 10,
                  onPressed: () {
                    commentController.text = "";
                    showToast(msg: "added comment successfully");
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      );

  /// ======================  comment Component =============================
  Widget commentContent({required comment}) {
    return Container(
      decoration: BoxDecoration(
        color: lightBlackColor,
        border: Border.all(color: Color(0xFF424242)),
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0, left: 12, bottom: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('${assetImageBaseUrl}Number.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                comment["Comment"].toString(),
                // "da tassss ssssssss sssss s dddddd ddddddd  ee eeeeeeerr rrrrrrr rrrrr rrrrr rrr rrrrr rrr  eeeeeee eeeeeeeeee wwwwwww qqqqqqqqqq sssssssssssss dddddddddddddd fffffffffff rrrrtttttt tttttttt tttt rrr",
                softWrap: true,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                comment["By"],
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
