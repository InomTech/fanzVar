import 'dart:math' as math;

import 'package:fanzhashem/modules/auth/login/login.dart';
import 'package:fanzhashem/modules/fans/fans_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../modules/home/home_widgets.dart';
import '../modules/new_stores/new_stores_screen.dart';

/// Toast

showToast({String msg = "", toastLength}) => Fluttertoast.showToast(
      msg: capitalizeInitial(msg),
      //  toastDuration: Duration(seconds: 2),
      toastLength: toastLength ?? Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: lightBlackColor,
      // textColor: Colors.white,
      fontSize: 16.0,
    );

/// Capital Initial

String capitalizeInitial(str) {
  String formattedStr = "";
  List strList = str.toString().split(" ");
  for (String strElement in strList) {
    if (strElement == strList[0]) {
      formattedStr += "${strElement[0].toUpperCase()}"
          "${strElement.substring(1).toString().toLowerCase()}";
    } else {
      formattedStr += strElement.toLowerCase();
    }
    formattedStr += " ";
  }
  return formattedStr;
}

/// Show Loading

class ShowLoading extends StatelessWidget {
  final bool isLoading;
  final double size;

  const ShowLoading({super.key, this.isLoading = true, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: Center(
        child: SpinKitCircle(
          color: primaryColor,
          size: size,
        ),
      ),
    );
  }
}

/// appBar

appBar(key, title, context,
    {bool isMain = false,
    bool isHome = false,
    bool isEn = true,
    bool isSuggestedProject = false,
    bool isShowSearch = false,
    bool isShowFilter = false,
    bool isShowChatOnlineUsers = false,
    void Function()? filterFunc,
    bool isSearching = false,
    bool isSearchScreen = false,
    bool goldEdgeColor = true,
    void Function()? refresh}) {
  print(isEn);
  return PreferredSize(
    preferredSize: AppBar(
      toolbarHeight: 80,
      centerTitle: true,
    ).preferredSize,
    child: Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
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
                  angle: isEn == true ? 180 * math.pi : 180 * math.pi / 180,
                  child: Icon(
                      isMain ? Icons.menu : Icons.arrow_back_ios_new_rounded,
                      size: 28,
                      color: Colors.white),
                ),
              ),
              onPressed: () async {
                if (isMain) {
                  key.currentState!.openDrawer();
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
                      onTap: refresh,
                      // () {
                      //   isSearching = false;
                      //   // refresh!();
                      // },
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
        isSearchScreen
            ? buildFloatingSearchBarForHome(context, refresh)
            : SizedBox(),
      ],
    ),
  );
}

/// Alert Dialog

showYesNoAlertDialog(isLogout, context, title, icon, Function() yesFunc) =>
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: EdgeInsets.only(top: 15.0),
        title: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        content: SizedBox(
          height: 60,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TxtButton(
                    color: darkBlackColor,
                    text: "No",
                    borderRadius: 10,
                    horizontalPadding: 35,
                    verticalPadding: 10,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TxtButton(
                    color: primaryColor,
                    text: "Yes",
                    borderRadius: 10,
                    horizontalPadding: 35,
                    verticalPadding: 10,
                    onPressed: () {
                      yesFunc();
                      if (isLogout == true) {
                        showToast(msg: 'We will miss you');
                        navigateTo(context, Login());
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

/// Alert Dialog

showAlertDialog(isLogout, context, title, yesButton, icon, yesFunc) =>
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        contentPadding: EdgeInsets.only(top: 15.0),
        title: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
        content: SizedBox(
          height: 60,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TxtButton(
                    color: darkBlackColor,
                    text: "Cancel",
                    borderRadius: 10,
                    horizontalPadding: 20,
                    verticalPadding: 10,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TxtButton(
                    color: primaryColor,
                    text: yesButton,
                    borderRadius: 10,
                    horizontalPadding: 25,
                    verticalPadding: 10,
                    onPressed: () {
                      if (yesFunc == 'reward') {
                        navigateTo(context, NewStoresScreen());
                      } else if (yesFunc == 'Retails') {
                        showToast(msg: 'Suceessfully, Admin is will Aproved');
                        Navigator.pop(context);
                      }
                      // yesFunc();
                      // if (isLogout == true) {
                      //   showToast(msg: 'We will miss you');
                      //   navigateTo(context, Login());
                      // } else {
                      //   Navigator.pop(context);
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

/// Navigation

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigatAndReplacement(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);
//search home
buildFloatingSearchBarForHome(context, closesearch) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return Container(
    padding: const EdgeInsets.only(top: 10),
    // height: MediaQuery.of(context).size.height * .5,
    // width: MediaQuery.of(context).size.width * .7,
    child: context(
      automaticallyImplyDrawerHamburger: false,
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 0, bottom: 0),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 300 : 300,
      debounceDelay: const Duration(milliseconds: 500),
      // closeOnBackdropTap: false,
      automaticallyImplyBackButton: false,
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      onFocusChanged: (query) {
        if (query == false) {
          closesearch();
        }
      },

      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: lightBlackColor,
            // Colors.white10,
            elevation: 4.0,
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TextButton.icon(
                //   onPressed: () {
                //     closesearch();
                //   },
                //   icon: const Icon(Icons.camera_alt_outlined),
                //   label: const Text("Photos"),
                // ),
                // TextButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.gif_box_outlined),
                //   label: const Text("GIFs"),
                // ),
                // TextButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.video_call),
                //   label: const Text("Video"),
                // ),
                // TextButton.icon(
                //   onPressed: () {},
                //   icon: const Icon(Icons.queue_music_outlined),
                //   label: const Text("Audio"),
                // ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

//search
buildFloatingSearchBar(context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  (context, transition) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color: lightBlackColor,
        // Colors.white10,
        elevation: 4.0,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text("Photos"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.gif_box_outlined),
              label: const Text("GIFs"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.video_call),
              label: const Text("Video"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.queue_music_outlined),
              label: const Text("Audio"),
            ),
          ],
        ),
      ),
    );
  };
}

sponsor(sponsors, backgroundColorSponsor) {
  ///Sponsers
  return Container(
    height: 70,
    decoration: BoxDecoration(
      boxShadow: [
        // BoxShadow(
        //   color: Colors.grey.withOpacity(0.1),
        //   spreadRadius: 5,
        //   blurRadius: 7,
        //   offset: Offset(0, 2),
        // ),
      ],
      color: backgroundColorSponsor,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          for (var i = 0; i < sponsors.length; i++)
            imageCircle(sponsors[i], null),
          // imageCircle("puma.png"),
          // imageCircle("saib.png"),
          // imageCircle("on.png"),
          // imageCircle("puma.png"),
          // imageCircle("saib.png"),
        ],
      ),
    ),
  );
}

class ContainerListWidget extends StatelessWidget {
  final String keyStr;
  final List valueStr;
  final bool isWebSite;
  final bool clubManagement;

  const ContainerListWidget(
      {super.key,
      required this.keyStr,
      required this.valueStr,
      this.isWebSite = false,
      this.clubManagement = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: darkBlackColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              keyStr,
              softWrap: true,
              style: TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height / 70,
            ),
            Center(
              child: Column(
                children: <Widget>[
                  for (var i = 0; i < valueStr.length; i++)
                    Container(
                      width: width,
                      alignment: Alignment.center,
                      child: Text(
                        valueStr[i],
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            decoration: isWebSite
                                ? TextDecoration.underline
                                : TextDecoration.none,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
