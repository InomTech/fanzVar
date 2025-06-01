import 'package:fanzhashem/modules/auth/login/login.dart';
import 'package:fanzhashem/modules/auth/register/register.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class Opening extends StatefulWidget {
  const Opening({super.key});

  @override
  _OpeningState createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('${assetImageBaseUrl}ground.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(left: 0, bottom: 0, top: 100),
              //child: Image.asset("assets/logo.png"),
              child: ImageWidget(
                type: "asset",
                imageName: "logo.png",
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TxtButton(
                        color: accentColor,
                        horizontalPadding: 48,
                        verticalPadding: 20,
                        text: "LOGIN",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }),
                    SizedBox(
                      width: width / 10,
                    ),
                    TxtButton(
                        color: darkGoldColor,
                        horizontalPadding: 38,
                        verticalPadding: 20,
                        text: "REGISTER",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        }),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
