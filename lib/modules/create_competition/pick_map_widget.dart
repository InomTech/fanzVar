import 'package:flutter/material.dart';

Widget pickLocation(creatCubit, mapPickerController, height) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: SizedBox(
      height: height / 3,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
    ),
  );
}
