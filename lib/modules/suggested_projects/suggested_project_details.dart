// ignore_for_file: deprecated_member_use

import 'dart:math' as math;

import 'package:fanzhashem/modules/fan_profile/fan_profile_screen.dart';
import 'package:fanzhashem/modules/fans/fans_screen.dart';
import 'package:fanzhashem/modules/suggested_projects/cubit/cubit.dart';
import 'package:fanzhashem/modules/suggested_projects/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class SuggestedProjectDetailsScreen extends StatefulWidget {
  final String projectStatus, projectDesc, projectName, likesNum, commentsNum;
  const SuggestedProjectDetailsScreen(
      {required this.projectStatus,
      required this.projectDesc,
      required this.projectName,
      required this.likesNum,
      required this.commentsNum,
      super.key});

  @override
  _SuggestedProjectDetailsScreenState createState() =>
      _SuggestedProjectDetailsScreenState();
}

class _SuggestedProjectDetailsScreenState
    extends State<SuggestedProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (BuildContext context) => SuggestedProjectsCubit(),
      child: BlocConsumer<SuggestedProjectsCubit, SuggestedProjectsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Projects Details"),
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
            body: SafeArea(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Container(
                        height: height / 1.6,
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.3),
                              // blurRadius: 25.0,
                              spreadRadius: 2,
                              // blurRadius: 0.5,
                              // offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Suggested by:",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ListTile(
                              horizontalTitleGap: 0.0,
                              leading: Transform.translate(
                                offset: Offset(-12, 0),
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                    "${assetImageBaseUrl}images (2).png",
                                  ),
                                ),
                              ),
                              title: Transform.translate(
                                offset: Offset(-12, 0),
                                child: Text("Marwan Kholy"),
                              ),
                              subtitle: Transform.translate(
                                offset: Offset(-12, 0),
                                child: Text('@Adhamhamed45'),
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.0, 0.21],
                                    colors:
                                        widget.projectStatus.toLowerCase() ==
                                                "voted"
                                            ? [
                                                Colors.grey.withOpacity(0.5),
                                                Colors.grey.withOpacity(0.2),
                                              ]
                                            : [
                                                Color(0x66CDA250),
                                                Color(0x59CDA250),
                                              ],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 5),
                                  child: Text(
                                    widget.projectStatus,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Project Name:",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                widget.projectName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Description:",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ReadMoreText(
                                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                trimLines: 2,
                                colorClickableText: Colors.white,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                lessStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image.asset(
                                "${assetImageBaseUrl}project.png",
                                width: width,
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.favorite, color: primaryColor),
                                  SizedBox(width: 4),
                                  Text('5K'),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Image.asset(
                                      "${assetImageBaseUrl}Group 10436.png"),
                                  SizedBox(width: 4),
                                  Text("1.5 K"),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform(
                                    alignment: Alignment.center,
                                    transform: Matrix4.rotationY(math.pi),
                                    child: Icon(
                                      Icons.reply,
                                      color: primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text('590'),
                                ],
                              ),
                            ),
                            Icon(Icons.turned_in_not_outlined,
                                color: primaryColor),
                          ],
                        ),
                      ),

                      /// ========== write comment widget ============
                      const SizedBox(height: 5),
                      Center(
                        child: Container(
                          height: height / 25,
                          width: width / 1.3,
                          decoration: BoxDecoration(
                            color: lightBlackColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 3),
                            child: TextFormField(
                              // maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Write your comment",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),

                      /// ================ Comments ==================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Comments',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, FansScreen());
                            },
                            child: Container(
                              child: Image.asset(
                                "${assetImageBaseUrl}Capture.PNG",
                                width: 80,
                                height: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      messageWidget(
                        "الفكره حلوه جدا انا اؤيدها وياريت نعتمدها",
                        "Sandra Tawfik",
                        "Group 10398.png",
                      ),
                      messageWidget(
                        "انا موافق جدا على فكره المشروع برافوووو",
                        "Ahmed Seroug",
                        "Group 10399.png",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

///////////////////////////////////
  Widget messageWidget(String msg, String name, img) {
    return ListTile(
      leading: InkWell(
        onTap: () {
          navigateTo(context, FanProfileScreen());
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                '$assetImageBaseUrl$img',
                width: 40,
                height: 40,
              ),
            ),
            const CircleAvatar(radius: 5, backgroundColor: Colors.green),
          ],
        ),
      ),
      title: Transform.translate(
        offset: Offset(-12, 0),

        /// ==================== Message Content =====================
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ============== Sender Name ================
            Container(
              child: Text(
                name,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white54, fontSize: 14),
                textDirection: TextDirection.ltr,
              ),
            ),
            const SizedBox(height: 3),
            Container(
              decoration: BoxDecoration(
                color: lightBlackColor,
                border: Border.all(
                  color: Color(0xFF424242),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 13.0),
                child: Text(
                  msg,
                  textDirection:
                      RegExp("[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]")
                                  .hasMatch(msg.trim()) ==
                              true
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
