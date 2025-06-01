import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../widgets/shared_widget.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String qrData =
      "https://www.yallakora.com/NewsListing/%D8%A7%D9%84%D8%A3%D8%AE%D8%A8%D8%A7%D8%B1#nav-burgermenu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: darkBlackColor,
      resizeToAvoidBottomInset: true,
      appBar: appBar(_scaffoldKey, "QR Code", context),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(
              //   height: 40.0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
