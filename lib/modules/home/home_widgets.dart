import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/models/general_match_model.dart';
import 'package:fanzhashem/models/latest_news_model.dart';
import 'package:fanzhashem/models/scores_model.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:fanzhashem/widgets/swiper_widget.dart';
import 'package:flutter/material.dart';

subTitle(txt, context, widget) {
  return Container(
    alignment: Alignment.topLeft,
    margin: const EdgeInsets.only(right: 15, top: 10, left: 15, bottom: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          txt,
          style: TextStyle(
              fontSize: 18, color: primaryColor, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            print("ttttttttttttttttt");
            navigateTo(context, widget);
          },
          child: Text(
            LocaleKeys.general_see_all.tr(),
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

imageSlider(context, key, key1, key2) {
  var images = [
    '${assetImageBaseUrl}bg2.png',
    '${assetImageBaseUrl}bg0.png',
    '${assetImageBaseUrl}bg1.png'
  ];
  var titles = [
    LocaleKeys.home_screen_football.tr(),
    LocaleKeys.home_screen_playstation.tr(),
    LocaleKeys.home_screen_other_sports.tr(),
  ];
  var details = ['Real Matches', 'Show Your Plays', 'Discover Others'];

  return smallImagesSwiper(images, titles, details, context, key, key1, key2);
}

latestNewsSwiper(context, List<LatestNewsModel> latestNews,
    {bool isHorizontal = true}) {
  return SwiperWidget(
    hasShare: true,
    isHorizontal: isHorizontal,
    itemList: latestNews,
  );
}

scoresSwiper(context, List<ScoresModel> scores, {bool isHorizontal = true}) {
  return SwiperWidget(
    isHorizontal: isHorizontal,
    itemList: scores,
  );
}

matchesSwiper(context, List<GeneralMatchModel> generalMatches,
    {bool isHorizontal = true}) {
  return SwiperWidget(
    isHorizontal: isHorizontal,
    itemList: generalMatches,
    isGeneralMatches: true,
  );
}

imageCircle(imageName, key) {
  return Expanded(
    flex: 1,
    // key: key,
    child: CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      child: Image(
        width: 40,
        height: 40,
        image: NetworkImage(imageName),
      ),
      //   Image.asset(
      // '${assetImageBaseUrl}${imageName}',
      // width: 40,
      // height: 40,
      // ),
    ),
  );
}
