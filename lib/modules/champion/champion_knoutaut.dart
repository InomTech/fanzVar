import 'package:flutter/material.dart';

class ChampionKnoutaut extends StatelessWidget {
  final championId;
  const ChampionKnoutaut({
    required this.championId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Text(
              "Final",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 90,
              width: 200,
              decoration: BoxDecoration(
                  color: Color(0xfff0e0707),
                  border: Border.all(color: Color(0xfffcda250))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                //the final section
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    championId != '2'
                        ? ChamFinalInfo(
                            'Brazil', "assets/images/BRA.png", 30, 30, 10)
                        : ChamFinalInfo('Liverpool',
                            "assets/images/liverpool.png", 30, 30, 10),
                    championId != '2'
                        ? ChamFinalInfo(
                            'France', "assets/images/FRA.png", 30, 30, 10)
                        : ChamFinalInfo('man city',
                            "assets/images/manchester.png", 30, 30, 10),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  //border semi final
                  chamBorder(1.5, 30),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Semi Final",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  chamBorder(1.5, 30),
                  chamBorder(200, 1.5),
                ],
              )),
          SizedBox(
            width: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                chamBorder(1.5, 30),
                chamBorder(1.5, 30),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  championId != '2'
                      ? ChamSubFinalInfo(
                          'Brazil', "assets/images/BRA.png", 20, 20, 10)
                      : ChamSubFinalInfo(
                          'liver', "assets/images/liverpool.png", 20, 20, 10),
                  chamBorder(1.5, 60),
                  chamBorder(100, 1.5),
                  Row(
                    children: [
                      chamBorder(1.5, 30),
                      SizedBox(
                        width: 96,
                      ),
                      chamBorder(1.5, 30),
                    ],
                  ),
                  Row(
                    children: [
                      championId != '2'
                          ? ChamSubFinalInfo(
                              'Brazil', "assets/images/BRA.png", 20, 20, 10)
                          : ChamSubFinalInfo('liver',
                              "assets/images/liverpool.png", 20, 20, 10),
                      SizedBox(
                        width: 20,
                      ),
                      championId != '2'
                          ? ChamSubFinalInfo(
                              'Belgium', "assets/images/BEL.png", 20, 20, 10)
                          : ChamSubFinalInfo('city',
                              "assets/images/manchester.png", 20, 20, 10)
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 0,
              ),
              Column(
                children: [
                  championId != '2'
                      ? ChamSubFinalInfo(
                          'France', "assets/images/FRA.png", 20, 20, 10)
                      : ChamSubFinalInfo(
                          'city', "assets/images/manchester.png", 20, 20, 10),
                  chamBorder(1.5, 60),
                  chamBorder(100, 1.5),
                  Row(
                    children: [
                      chamBorder(1.5, 30),
                      SizedBox(
                        width: 96,
                      ),
                      chamBorder(1.5, 30),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      championId != '2'
                          ? ChamSubFinalInfo(
                              'France', "assets/images/FRA.png", 20, 20, 10)
                          : ChamSubFinalInfo('city',
                              "assets/images/manchester.png", 20, 20, 10),
                      SizedBox(
                        width: 20,
                      ),
                      championId != '2'
                          ? ChamSubFinalInfo(
                              'Espani', "assets/images/ESP.png", 20, 20, 10)
                          : ChamSubFinalInfo('bayern',
                              "assets/images/FC-Bayern-München.png", 20, 20, 10)
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget chamBorder(double width, double height) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(border: Border.all(color: Color(0xfff707070))),
  );
}

Widget ChamFinalInfo(
    chamName, chamImage, double width, double height, double textFontsize) {
  return Column(
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(chamImage)
                //  NetworkImage(
                //   chamImage,
                // ),
                ),
          )),
      SizedBox(
        height: 4,
      ),
      Text(
        chamName,
        style: TextStyle(color: Colors.white, fontSize: textFontsize),
      )
    ],
  );
}

Widget ChamSubFinalInfo(
    chamName, chamImage, double width, double height, double textFontsize) {
  return Container(
    height: 70,
    width: 80,
    decoration: BoxDecoration(
        color: Colors.black, border: Border.all(color: Color(0xfff242625))),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ChamFinalInfo(chamName, chamImage, width, height, textFontsize),
          ChamFinalInfo(chamName, chamImage, width, height, textFontsize),
        ],
      ),
    ),
  );
}
