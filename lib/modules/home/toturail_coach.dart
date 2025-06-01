import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../utilities/constants.dart';

class ToturialCoach extends StatefulWidget {
  const ToturialCoach({super.key});

  @override
  State<ToturialCoach> createState() => _ToturialCoachState();
}

class _ToturialCoachState extends State<ToturialCoach> {
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  GlobalKey key = GlobalKey();
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();
  @override
  initState() {
    initTargets();
    // WidgetsBinding.instance?.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  // void _afterLayout(_) {
  //   Future.delayed(Duration(milliseconds: 100));
  //   showTutorial();
  // }

  // void showTutorial() {
  //   tutorialCoachMark = TutorialCoachMark(
  //     targets: targets,
  //     colorShadow: Colors.blue,
  //     opacityShadow: 0.7,
  //   )..show(context: context);
  // }

  initTargets() {
    targets.add(
      TargetFocus(
        identify: "Target 0",
        keyTarget: _key1,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "hjhhhhj lorem ipsum",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
    targets.add(
      TargetFocus(
        identify: "Target 2",
        keyTarget: _key2,
        contents: [
          TargetContent(
              align: ContentAlign.bottom,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "gohary lorem ipsum",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 170.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                key: key,
                color: Colors.orange[100],
                height: 100,
                width: MediaQuery.of(context).size.width - 50,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    '${assetImageBaseUrl}Group 10400.png',
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 50, // عرض الزر
              height: 50, // ارتفاع الزر
              child: ElevatedButton(
                key: _key2,
                onPressed: () {
                  // وظيفة الزر عند الضغط
                  print("Button Pressed!");
                },
                child: Icon(Icons.check,
                    size: 30), // يمكنك إضافة أي محتوى داخل الزر
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 200, // عرض الزر
              height: 50, // ارتفاع الزر
              child: ElevatedButton(
                key: _key3,
                onPressed: () {
                  // وظيفة الزر عند الضغط
                  // print("Button Pressed!");
                },
                child: Icon(Icons.check, size: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}   
            // child: RaisedButton(key: _key3,onPressed: () {}, ),

// width: 200,
  //              height: 50,