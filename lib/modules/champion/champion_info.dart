import 'package:fanzhashem/modules/shared/gallery.dart' as g;
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../widgets/shared_widget.dart';

class ChampionInfo extends StatefulWidget {
  final championFirstMatche, championDetails;
  const ChampionInfo(
      {required this.championFirstMatche,
      required this.championDetails,
      super.key});

  @override
  _ChampionInfoState createState() => _ChampionInfoState();
}

class _ChampionInfoState extends State<ChampionInfo> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List galllery = widget.championDetails["Gallery"];
    // var first6ImgsInGallery = galllery.getRange(0, 5).toList();
    var x = widget.championDetails;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            if (widget.championFirstMatche != null)
              Text(
                "Next Match",
                softWrap: true,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
            SizedBox(height: 10),

            /// ========== First match ===========
            if (widget.championFirstMatche != null)
              Container(
                width: double.infinity,
                height: height / 8,
                decoration: BoxDecoration(
                  color: lightBlackColor,
                  border: Border.all(color: Color(0xFF424242)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: width / 4,
                      alignment: Alignment.center,
                      child: Text(
                        widget.championFirstMatche["FTeamName"],
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.championFirstMatche["Date"],
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF70706F),
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            widget.championFirstMatche["score"],
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            "Final",
                            softWrap: true,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF70706F),
                              fontWeight: FontWeight.normal,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width / 4,
                      child: Text(
                        widget.championFirstMatche["STeamName"],
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 17.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 20),

            /// ============= Gallery =============
            if (widget.championDetails["Gallery"].length != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 3,
                    child: Text(
                      "Gallery",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 3,
                    child: GestureDetector(
                      onTap: () {
                        List<String> allgallery =
                            galllery.map((e) => e.toString()).toList();

                        navigateTo(
                            context, g.Gallery(galleryImages: allgallery));
                      },
                      child: Text(
                        "All",
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10),
            if (widget.championDetails["Gallery"].length != 0)
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: galllery.length > 6
                      ? galllery.getRange(0, 6).toList().length
                      : galllery.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext ctx, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FullScreenWidget(
                          disposeLevel: DisposeLevel.High,
                          child: Image(
                            // fit: BoxFit.fill,
                            image: NetworkImage(
                              galllery[index] ??
                                  "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
