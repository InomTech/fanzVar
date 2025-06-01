import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

navigationBarBtn(imageName, txt, context, bool isSelected,
    {bool isHome = false,
      double height = 65, // قم بتكبير الـ height قليلاً
      double width = 75,
      isNetworkImg = false,
      networkImgURL}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).bottomAppBarTheme.color,
    ),
    height: height,
    width: width,
    padding: const EdgeInsets.symmetric(vertical: 6),
    margin: const EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: isHome
              ? Icon(
            Icons.home_outlined,
            size: 25.0,
            color: isSelected ? primaryColor : Colors.white,
          )
              : isNetworkImg == false
              ? Image.asset(
            '$assetImageBaseUrl$imageName',
            width: 15,
            height: 15,
            color: isSelected ? primaryColor : Colors.white,
          )
              : Image.network(
            networkImgURL ?? 'https://picsum.photos/250?image=9',
            width: 15,
            height: 15,
          ),
        ),
        Flexible(
          child: Text(
            txt,
            softWrap: true,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 9,
              color: isSelected ? primaryColor : Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
