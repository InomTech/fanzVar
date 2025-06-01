import 'package:fanzhashem/modules/fan_book/fan_book.dart';
import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../widgets/shared_widget.dart';
import 'albums_tabs_screen.dart';
import 'fans_songs_screen.dart';
import 'tags/tags_screen.dart';

class FansCatagories extends StatefulWidget {
  const FansCatagories({super.key});

  @override
  State<FansCatagories> createState() => _FansCatagoriesState();
}

class _FansCatagoriesState extends State<FansCatagories> {
  List catagories = [
    {
      "title": "Fans Songs",
      "image": "${assetImageBaseUrl}Group 10695 (2).png",
    },
    {
      "title": "Album",
      "image": "${assetImageBaseUrl}album.png",
    },
    {
      "title": "Annual Festival Day",
      "image": "${assetImageBaseUrl}festival.png",
    },
    {
      "title": "Talents",
      "image": "${assetImageBaseUrl}talents2.png",
    },
    {
      "title": "Comics",
      "image": "${assetImageBaseUrl}comics.png",
    },
    {
      "title": "Tags",
      "image": "${assetImageBaseUrl}Group 10695 (2).png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: catagories.length,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 12 / 9,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                if (catagories[index]['title'] == 'Fans Songs') {
                  navigateTo(context, FansSongssScreen());
                } else if (catagories[index]['title'] == 'Talents') {
                  navigateTo(
                      context,
                      FanBook(
                        title: 'Talents',
                      ));
                } else if (catagories[index]['title'] ==
                    'Annual Festival Day') {
                  navigateTo(
                      context,
                      FanBook(
                        title: 'Annual Festival Day',
                      ));
                } else if (catagories[index]['title'] == 'Album') {
                  navigateTo(
                      context,
                      AlbumsTabsScreen(
                        title: catagories[index]['title'],
                      ));
                } else if (catagories[index]['title'] == 'Comics') {
                  navigateTo(
                      context,
                      FanBook(
                        title: catagories[index]['title'],
                      ));
                } else if (catagories[index]['title'] == 'Tags') {
                  navigateTo(
                      context,
                      TagsScreen(
                        title: catagories[index]['title'],
                      ));
                }
              },
              child: SizedBox(
                width: width / 2.5,
                height: height / 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                              width: width / 2.6,
                              height: height / 6,
                              fit: BoxFit.cover,
                              colorBlendMode: BlendMode.modulate,

                              // color: primaryColor.withOpacity(0.8),
                              image: AssetImage(catagories[index]['image'])),

                          //  Image.network(
                          //   catagories[index]['image'],
                          //   width: width / 2.35,
                          //   height: height / 6,
                          //   fit: BoxFit.cover,
                          //   colorBlendMode: BlendMode.modulate,
                          //   color: primaryColor.withOpacity(0.8),
                          //   // colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.8), BlendMode.modulate,
                          // ),
                        ),
                        Image(
                          image: AssetImage(
                              setIconData(catagories[index]['title'])),
                          // width: 26,
                        ),
                        // Icon(

                        //   setIconData(catagories[index]['title']),
                        //   size: 40,
                        //   color: Colors.white.withOpacity(0.9),
                        // ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      catagories[index]['title'],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  setIconData(String cardName) {
    switch (cardName) {
      case "Annual Festival Day":
        return "${assetImageBaseUrl}Group 10696.png";
      case "Talents":
        return "${assetImageBaseUrl}Group 10699.png";
      case "Album":
        return "${assetImageBaseUrl}Group 10689.png";
      case "Fans Songs":
        return "${assetImageBaseUrl}Path 12647.png";
      case "Comics":
        return "${assetImageBaseUrl}Group 10702.png";
      default:
        return "${assetImageBaseUrl}Path 12647.png";
    }
  }
}
