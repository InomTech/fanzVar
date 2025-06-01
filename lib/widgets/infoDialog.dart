// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'locationSlider.dart';

class InfoDialog extends StatelessWidget {
  final String title, description;
  final void Function() onPress;
  final List myimages;

  const InfoDialog({
    super.key,
    required this.myimages,
    required this.title,
    required this.description,
    required this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        constraints: BoxConstraints(maxHeight: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Center(
              child: Container(
                height: 5,
                width: 70,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Image Slider
            LocationSlider(
              data: myimages,
            ),
            SizedBox(height: 20),
            // Title
            Text(
              title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            SizedBox(height: 18),
            // Description
            Flexible(
              child: SingleChildScrollView(
                child: Text(
                  description,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            // Get Directions Button
            ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // لون الخلفية
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Go To Ranking",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

void showInfoDialog({
  required BuildContext context,
  required String title,
  required List myImages,
  required String description,
  required void Function() onTap,
}) {
  showModalBottomSheet(
    context: context,
    enableDrag: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(
          30,
        ),
      ),
    ),
    builder: (context) => SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: InfoDialog(
          myimages: myImages,
          title: title,
          description: description,
          onPress: onTap,
        ),
      ),
    ),
  );
}
