import 'package:flutter/material.dart';

class OtherSportsItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const OtherSportsItem(
      {super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imagePath),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            name,
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
