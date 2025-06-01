import 'package:fanzhashem/modules/page_view/page_view.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart'; // تعديل هنا

class IntroScreen extends StatefulWidget {
  final String userName;

  const IntroScreen({super.key, required this.userName});

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<String> descriptionList = [
    "Not just a fan but a part of the game",
    "Real competitions challenges between fans",
    "Share victory moments in your clubs’ fan book",
    "Build up your own community in chat rooms",
    "Enjoy vouchers from worldwide stores",
    "Compete with other club fans to increase ranking",
    "Be an investor in your clubs’ projects",
    "Explore worldwide fans power through our map",
    "Tag Vote expect and evaluate in our voting center",
    "Buy tickets earn points and enjoy real discounts",
  ];

  @override
  void initState() {
    super.initState();
    fillIsSeenIntro();
  }

  fillIsSeenIntro() async {
    await saveIsSeenIntro();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        for (int i = 0; i < descriptionList.length; i++)
          PageViewModel(
            title: "Hi ${widget.userName.split(" ")[0]},\nWelcome to",
            body: descriptionList[i],
            image: Image.asset("${assetImageBaseUrl}slider${i + 1}.png"),
            decoration: PageDecoration(
              imagePadding: EdgeInsets.all(0),
              titleTextStyle:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(fontSize: 16),
              pageColor: Colors.white,
              imageFlex: 3,
              bodyPadding: EdgeInsets.only(top: 160, left: 15, right: 15),
              titlePadding: EdgeInsets.only(top: 80),
            ),
          ),
      ],
      onDone: onDonePress,
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  void onDonePress() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => PageViewScreen()),
    );
  }
}
