// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/models/latest_news_model.dart';
import 'package:fanzhashem/modules/latest_news/cubit/cubit.dart';
import 'package:fanzhashem/modules/latest_news/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:fanzhashem/widgets/webview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class LatestNews extends StatefulWidget {
  final List<LatestNewsModel> latestNews;

  const LatestNews({super.key, required this.latestNews});

  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var images = ['${assetImageBaseUrl}salah.jpg'];
  var titles = ['Football'];
  var details = [
    'Liverpool WON The Premier League, Liverpool WON The Premier League'
        'Liverpool WON The Premier League'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<LatestNewsCubit>(
        create: (context) => LatestNewsCubit(),
        child: BlocConsumer<LatestNewsCubit, LatestNewsStates>(
            listener: (context, state) async {},
            builder: (context, state) => Scaffold(
                  key: _scaffoldKey,
                  resizeToAvoidBottomInset: false,
                  appBar: appBar(_scaffoldKey, "Latest News", context),
                  backgroundColor: lightBlackColor,
                  body: Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.latestNews.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 15),
                            child: LatestNewItem(
                                latestNewsModel: widget.latestNews[index]),
                          );
                        }),
                  ),
                )));
  }
}

class LatestNewItem extends StatelessWidget {
  final LatestNewsModel latestNewsModel;

  const LatestNewItem({super.key, required this.latestNewsModel});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                navigateTo(
                    context,
                    WebViewWidget(
                        url: latestNewsModel.url ?? "",
                        title: latestNewsModel.name ?? ""));
              },
              child: Container(
                width: width,
                height: height / 5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.colorBurn),
                    image: NetworkImage(latestNewsModel.image ?? ""),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                navigateTo(
                    context,
                    WebViewWidget(
                        url: latestNewsModel.url ?? "",
                        title: latestNewsModel.name ?? ""));
              },
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(right: 5, top: 10, left: 5, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(latestNewsModel.name ?? "",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        )),
                    Text(
                      latestNewsModel.date ?? "",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),

            // details

            Container(
              alignment: Alignment.bottomLeft,
              margin:
                  const EdgeInsets.only(right: 5, top: 5, left: 5, bottom: 0),
              child: InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      WebViewWidget(
                          url: latestNewsModel.url ?? "",
                          title: latestNewsModel.name ?? ""));
                },
                child: Text(latestNewsModel.body ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    )),
              ),
            ),

            Container(
              alignment: Alignment.bottomRight,
              margin:
                  const EdgeInsets.only(right: 5, top: 10, left: 5, bottom: 0),
              child: InkWell(
                onTap: () {
                  navigateTo(
                      context,
                      WebViewWidget(
                          url: latestNewsModel.url ?? "",
                          title: latestNewsModel.name ?? ""));
                },
                child: Text("Read more",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    )),
              ),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: GestureDetector(
              onTap: () {
                Share.share(latestNewsModel.body ?? "",
                    subject: latestNewsModel.name ?? "");
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
        )
      ],
    );
  }
}
