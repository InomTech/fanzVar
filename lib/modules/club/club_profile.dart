import 'package:fanzhashem/models/clubs_model.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:fanzhashem/widgets/webview_widget.dart';
import 'package:flutter/material.dart';

class ClubProfile extends StatefulWidget {
  final ClubsModel club;
  final String clubLocation;

  const ClubProfile(
      {super.key, required this.club, required this.clubLocation});

  @override
  _ClubProfileState createState() => _ClubProfileState();
}

class _ClubProfileState extends State<ClubProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: appBar(_scaffoldKey, widget.club.name, context),
      backgroundColor: lightBlackColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(widget.club.image ?? ""),
              //backgroundImage: AssetImage("assets/images/saib.png"),
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: 'About',
              valueStr: "${widget.club.about}\n",
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: "Champions",
              valueStr: widget.club.champions ?? "",
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: "Number Of Fans",
              valueStr: widget.club.numOfFans ?? "",
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: "Location",
              valueStr: widget.clubLocation,
            ),
            SizedBox(
              height: height / 30,
            ),
            ContainerWidget(
              keyStr: "Website",
              valueStr: widget.club.website ?? "",
              isWebSite: true,
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  final String keyStr, valueStr;
  final bool isWebSite;
  final bool clubManagement;

  const ContainerWidget(
      {super.key,
      required this.keyStr,
      required this.valueStr,
      this.isWebSite = false,
      this.clubManagement = false});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        print("click on $keyStr");
        if (isWebSite) {
          navigateTo(context, WebViewWidget(url: valueStr, title: keyStr));
        }
        // if (clubManagement) {
        //   navigateTo(
        //       context,
        //       WebViewWidget(
        //           url: "https://www.alahlyegypt.com/ar/club/executives",
        //           title: keyStr));
        // }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: darkBlackColor,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                keyStr,
                softWrap: true,
                style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height / 70,
              ),
              Center(
                child: Container(
                  width: width / 1.3,
                  alignment: Alignment.center,
                  child: Text(
                    clubManagement != false ? "show Club Management" : valueStr,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        decoration: isWebSite
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
