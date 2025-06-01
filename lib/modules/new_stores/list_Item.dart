// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  String? bg;
  String? img;
  ListItem({super.key, this.bg, this.img});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 90,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: const Color(0xff202020),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage("$assetImageBaseUrl$bg"),
            ),
          ),
          child: Image.asset("$assetImageBaseUrl$img"),
        )
      ],
    );
  }
}
