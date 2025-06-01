// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TxtButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final double txtSize;
  final Color txtColor;
  Color? borderColor;

  TxtButton(
      {super.key,
      this.onPressed,
      required this.color,
      required this.text,
      this.borderColor,
      this.horizontalPadding = 0,
      this.verticalPadding = 0,
      this.borderRadius = 30,
      this.txtSize = 13.0,
      this.txtColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = TextButton.styleFrom(
      foregroundColor: color,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor ?? color)),
      backgroundColor: color,
    );

    return TextButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: txtColor, fontSize: txtSize),
      ),
    );
  }
}
