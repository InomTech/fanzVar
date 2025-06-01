import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class WebViewWidget extends StatelessWidget {
  final String url;
  final String title;

  WebViewWidget({super.key, required this.url, required this.title});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(_scaffoldKey, title, context),
      // body: WebView(initialUrl: url,javascriptMode: JavascriptMode.unrestricted),
    );
  }
}
