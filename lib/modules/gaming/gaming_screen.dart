import 'package:flutter/material.dart';

import '../../utilities/colors.dart';

class GamingScreen extends StatefulWidget {
  const GamingScreen({super.key});

  @override
  State<GamingScreen> createState() => _GamingScreenState();
}

class _GamingScreenState extends State<GamingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List gaming = [
    {
      'image':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtV9IKBqXjlqQIUVx6rCywliJVr_SSbdfUtXaC6NtO9J9jB6QZ_pMHXhgR5EojSvLEDIE&usqp=CAU",
      'championName': 'Cairo Champions',
      "date": "8/3/2022",
      "rank": "1",
      'played': "16"
    },
    {
      'image':
          "https://ssl.gstatic.com/onebox/media/sports/logos/gA3OKFVaD8LeMhY4CuUEaA_64x64.png",
      'championName': 'Wimbledon          ',
      "date": "16/7/2022",
      "rank": "3",
      'played': "12"
    },
    {
      'image':
          "https://images.volleyballworld.com/image/upload/f_png/v1646066233/assets/competition-logos/Events%202022/Volleyball/VNL%202022/VW_VNL-2021_fivb_light",
      'championName': 'Vollyball Nations',
      "date": "23/5/2021",
      "rank": "4",
      'played': "18"
    },
    {
      'image':
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtV9IKBqXjlqQIUVx6rCywliJVr_SSbdfUtXaC6NtO9J9jB6QZ_pMHXhgR5EojSvLEDIE&usqp=CAU",
      'championName': 'Alex Champions',
      "date": "8/8/2022",
      "rank": "2",
      'played': "16"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Gaming"),
          centerTitle: true,
          backgroundColor: lightBlackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: gaming.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          tileColor: darkBlackColor,
                          minLeadingWidth: width / 10,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                gaming[index]['championName'],
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "rank : " + gaming[index]['rank'],
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white),
                              ),
                              Text(
                                gaming[index]['date'],
                                softWrap: true,
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "played : " + gaming[index]['played'],
                            softWrap: true,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                NetworkImage(gaming[index]['image']),
                          ),
                        ),
                      ],
                    ));
              }),
        ));
  }
}
