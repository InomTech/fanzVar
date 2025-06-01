import 'package:flutter/material.dart';

class CompetitionDetailsMore extends StatefulWidget {
  const CompetitionDetailsMore({super.key});

  @override
  _CompetitionDetailsMoreState createState() => _CompetitionDetailsMoreState();
}

class _CompetitionDetailsMoreState extends State<CompetitionDetailsMore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("enter more");
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container();
  }
}
