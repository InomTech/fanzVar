import 'dart:async';

import 'package:fanzhashem/modules/auth/login/login.dart';
import 'package:fanzhashem/modules/page_view/page_view.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final bool isLoggedIn = getUserLoggedIn();
  final bool isSeenIntro = getIsSeenIntro();

  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>
                !isLoggedIn ? Login() : PageViewScreen())));
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${assetImageBaseUrl}splashgif.gif"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
