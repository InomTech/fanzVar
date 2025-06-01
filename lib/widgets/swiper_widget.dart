// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/modules/champion/champion_match_result_screen.dart';
import 'package:fanzhashem/modules/competitions/competitions.dart';
import 'package:fanzhashem/modules/other_sports/other_sports.dart';
import 'package:fanzhashem/modules/playstation/playstation_players.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:fanzhashem/widgets/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:share_plus/share_plus.dart';

class SwiperWidget extends StatelessWidget {
  final List itemList;
  final bool hasShare;
  final bool isBigImage;
  final Color containerColor;
  final bool isHorizontal;
  final bool isGeneralMatches;

  const SwiperWidget(
      {super.key,
      required this.itemList,
      this.hasShare = false,
      this.isBigImage = true,
      this.containerColor = Colors.black,
      this.isHorizontal = true,
      this.isGeneralMatches = false});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      autoplay: isBigImage,
      itemCount: itemList.length,
      viewportFraction: 0.8,
      scale: 0.9,
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        late String fTeamName;
        late String sTeamName;
        late var fTeamAvatar;
        late var sTeamAvatar;
        late var score;
        late var fTeamScore;
        late var sTeamScore;
        late var date;

        if (isGeneralMatches == true) {
          var item = itemList[index];
          fTeamName = item.firstTeamName ?? "";
          sTeamName = item.secondTeamName ?? "";
          fTeamAvatar =
              item.firstTeamAvatar ?? "https://picsum.photos/250?image=100";
          sTeamAvatar =
              item.secondTeamAvatar ?? "https://picsum.photos/250?image=100";
          score = item.score;
          date = item.date;
          fTeamScore = item.firstTeamScore;
          sTeamScore = item.secondTeamScore;
        }
        return Container(
          margin: const EdgeInsets.only(right: 5, top: 10, left: 5, bottom: 0),
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: isBigImage ? 0 : 40.0),
                child: Container(
                    width: MediaQuery.of(context).size.width /
                        (isBigImage ? 1.3 : 1.3),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      image: isBigImage
                          ? hasShare
                              ? DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.4),
                                      BlendMode.colorBurn),
                                  image: NetworkImage(itemList[index].image),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.4),
                                      BlendMode.colorBurn),
                                  image: isGeneralMatches == true
                                      ? AssetImage(
                                          "${assetImageBaseUrl}img.png")
                                      : AssetImage("assets/images/bac.jpg"),
                                  fit: BoxFit.cover,
                                )
                          : null,
                    ),
                    margin: EdgeInsets.only(
                        right: 5, top: 3, left: hasShare ? 5 : 0, bottom: 0),
                    padding: EdgeInsets.only(
                        left: hasShare ? 16.0 : 0, bottom: 8.0, top: 25),
                    child: hasShare
                        ? InkWell(
                            onTap: () {
                              navigateTo(
                                  context,
                                  WebViewWidget(
                                      url: itemList[index].url ?? "",
                                      title: itemList[index].name ?? ""));
                            },
                            child: Column(
                              children: <Widget>[
                                // title

                                Spacer(),

                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: EdgeInsets.only(
                                      right: 5, top: 25, left: 5, bottom: 0),
                                  child: Text(
                                    itemList[index].name,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),

                                // details

                                Container(
                                  alignment: Alignment.bottomLeft,
                                  margin: const EdgeInsets.only(
                                      right: 5, top: 2, left: 5, bottom: 0),
                                  child: Text(itemList[index].body,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      )),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  ///
                                  ///
                                  if (isGeneralMatches == true) {
                                    navigateTo(
                                      context,
                                      ChampionMatchResultScreen(
                                        generalMatch: itemList[index],
                                        championName: null,
                                        isFromGeneralMatches: true,
                                      ),
                                    );
                                  }
                                  // navigateTo(
                                  //   context,
                                  //   MatchDetails(
                                  //     firstTeamName: fTeamName,
                                  //     firstTeamScore: fTeamScore,
                                  //     secondTeamName: sTeamName,
                                  //     secondTeamScore: sTeamScore,
                                  //     matchDate: date,
                                  //   ),
                                  // );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                              isGeneralMatches == true
                                                  ? fTeamAvatar
                                                  : itemList[index].club1Image,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            isGeneralMatches == true
                                                ? fTeamName
                                                : itemList[index].club1Name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 9.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      isGeneralMatches == true
                                          ? score
                                          : itemList[index].score,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            backgroundColor: Colors.white,
                                            backgroundImage: NetworkImage(
                                              isGeneralMatches == true
                                                  ? sTeamAvatar
                                                  : itemList[index].club2Image,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            isGeneralMatches == true
                                                ? sTeamName
                                                : itemList[index].club2Name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              // fontWeight: FontWeight.w700,
                                              fontSize: 9.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
              ),
              hasShare
                  ? ShareBtn(
                      name: itemList[index].name, body: itemList[index].body)
                  : Text(""),
              hasShare
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 13, left: 5.4),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              topLeft: Radius.circular(0),
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(0),
                            ),
                          ),
                          width: 80,
                          height: 30,
                          child: InkWell(
                            onTap: () {
                              navigateTo(
                                  context,
                                  WebViewWidget(
                                      url: itemList[index].url ?? "",
                                      title: itemList[index].name ?? ""));
                            },
                            child: Text(
                              "12/2/2021",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Text(""),
            ],
          ),
        );
      },
    );
  }
}

class ShareBtn extends StatelessWidget {
  final String name;
  final String body;

  const ShareBtn({super.key, required this.name, required this.body});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: GestureDetector(
          onTap: () {
            Share.share(body, subject: name);
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.share,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

smallImage(image, title, detail, context, key) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      key: key,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        // border: Border.fromBorderSide(
        //     BorderSide(
        //         color:primaryColor,width: 2
        //     )
        //     ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight:
              Radius.circular(10.0), //                 <--- border radius here
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(
              image,
              fit: BoxFit.contain,
              color: title.toString().contains("Other") ? Colors.white : null,
              width: 80,
              height: 80,
            ),

            SizedBox(
              height: 8,
            ),
            Text(title,
                softWrap: true,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                )),

            SizedBox(
              height: 20,
            ),

            // details

            Text(detail,
                softWrap: true,
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                )),
          ],
        ),
      ),
    ),
  );
}

smallImagesSwiper(images, titles, details, context, key, key1, key2) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (ctx, int) {
          return GestureDetector(
            onTap: () {
              if (int == 0) {
                navigateTo(context, Competitions());
              } else if (int == 1) {
                navigateTo(context, PlayStationPlayers());
              } else if (int == 2) {
                navigateTo(context, OtherSports());
              }
            },
            child: smallImage(
                images[int],
                titles[int],
                details[int],
                context,
                int == 2
                    ? key2
                    : int == 0
                        ? key
                        : key1),
          );
        },
      ),
    ),
  );
}
