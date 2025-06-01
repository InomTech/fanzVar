import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/modules/help/help_details.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart' as currentUser;

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List questionsList = [
    "I have a question",
    "I want to report a complain",
    "Billing",
    "other"
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: height / 30),
              _welcomeText(),
              SizedBox(height: height / 30),
              ListView.builder(
                shrinkWrap: true,
                itemCount: questionsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: ListTile(
                      tileColor: lightBlackColor,
                      onTap: () => navigateTo(context, HelpDetailsScreen()),
                      title: Text(questionsList[index]),
                      trailing: Icon(Icons.arrow_forward_ios, size: 18),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _welcomeText() {
    return Text(
      "Hi, ${currentUser.name} ! How can we help ?",
      softWrap: true,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 16, color: primaryColor),
    );
  }
}
