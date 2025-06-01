import 'dart:math';

import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../modules/fans/fans_screen.dart';
import '../utilities/colors.dart';
import '../utilities/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMain;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final bool isHome;
  final bool isEn;
  final bool isSuggestedProject;
  final bool isShowSearch;
  final bool isShowFilter;
  final bool isShowChatOnlineUsers;
  final void Function()? filterFunc;
  final bool isSearching;
  final bool goldEdgeColor;
  final void Function()? refresh;
  const CustomAppBar(
      {super.key,
      this.isMain = false,
      this.isHome = false,
      required this.title,
      required this.scaffoldKey,
      this.isEn = true,
      this.isSuggestedProject = false,
      this.isShowSearch = false,
      this.isShowFilter = false,
      this.isShowChatOnlineUsers = false,
      this.filterFunc,
      this.isSearching = false,
      this.goldEdgeColor = true,
      this.refresh});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: AlignmentDirectional.center,
      fit: StackFit.expand,

      // clipBehavior: Clip.none,
      // overflow: Overflow.visible,
      children: [
        Container(
          color: goldEdgeColor
              ? isHome
                  ? primaryColor
                  : lightBlackColor
              : darkBlackColor,
          alignment: Alignment.center,
          child: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0))),
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            leading: IconButton(
              icon: Padding(
                padding: EdgeInsets.only(
                    right: 20.0, top: 20, left: isEn == true ? 20.0 : 10),
                child: Transform.rotate(
                  angle: isEn == true ? 180 * pi : 180 * pi / 180,
                  child: Icon(
                      isMain ? Icons.menu : Icons.arrow_back_ios_new_rounded,
                      size: 28,
                      color: Colors.white),
                ),
              ),
              onPressed: () async {
                if (isMain) {
                  scaffoldKey.currentState!.openDrawer();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            actions: [
              // Visibility(
              //   visible: isSuggestedProject,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 5, top: 24),
              //     child: IconButton(
              //       icon: Icon(Icons.more_vert),
              //       onPressed: () {},
              //     ),
              //   ),
              // ),
              Visibility(
                visible: isShowSearch,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 20),
                  child: InkWell(
                      onTap: () {
                        // refresh!();
                      },
                      child: Icon(
                        isSearching ? Icons.close : Icons.search,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
              Visibility(
                visible: isShowFilter,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 20.0, top: 20, left: isEn == true ? 0.0 : 10),
                  child: GestureDetector(
                      onTap: filterFunc,
                      child: Icon(
                        Icons.filter_alt_rounded,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
              Visibility(
                visible: isShowChatOnlineUsers,
                child: InkWell(
                  onTap: () {
                    navigateTo(context, FansScreen());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, top: 24),
                    child: Image.asset(
                      '${assetImageBaseUrl}Capture.PNG',
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: lightBlackColor,
            centerTitle: true,
            elevation: 0,
          ),
        ),
        //    buildFloatingSearchBarForHome(context),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
