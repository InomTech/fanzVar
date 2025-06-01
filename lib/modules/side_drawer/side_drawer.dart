// ignore_for_file: unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/modules/about_us/about_us.dart';
import 'package:fanzhashem/modules/auth/login/login.dart';
import 'package:fanzhashem/modules/feeds/feeds.dart';
import 'package:fanzhashem/modules/help/help_screen.dart';
import 'package:fanzhashem/modules/my_inbox/my_inbox_screen.dart';
import 'package:fanzhashem/modules/my_wallet/my_wallet_screen.dart';
import 'package:fanzhashem/modules/notifications/notifications.dart';
import 'package:fanzhashem/modules/promos/promos.dart';
import 'package:fanzhashem/modules/settings/settings_screen.dart';
import 'package:fanzhashem/modules/side_drawer/cubit/cubit.dart';
import 'package:fanzhashem/modules/side_drawer/cubit/states.dart';
import 'package:fanzhashem/modules/user_profile/user_profile_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../models/latest_news_model.dart';
import '../../translations/locale_keys.g.dart';
import '../../utilities/constants.dart';
import '../latest_news/latest_news.dart';
import '../new_stores/checkout.dart';
import '../other_sports/team_sport.dart';
import '../qr_code/qr_code_screen.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  _SideDrawer createState() => _SideDrawer();
}

class _SideDrawer extends State<SideDrawer> {
  String? version;
  String? buildNumber;
  List<LatestNewsModel> latestNews = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SideDrawerCubit>(
      create: (context) => SideDrawerCubit()
        ..getAppVersion()
        ..getLatestNews(),
      child: BlocConsumer<SideDrawerCubit, SideDrawerStates>(
        listener: (context, state) async {
          if (state is GetAppVersion) {
            version = state.version;
            buildNumber = state.buildNumber;
          }
          if (state is GetLatestNewsForClub) {
            latestNews = state.latestNews;
          }

          if (state is LogoutSuccess) {
            showToast(msg: 'We will miss you');
            navigateTo(context, Login());
          }
        },
        builder: (context, state) => Drawer(
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: () => navigateTo(context, UserProfileScreen()),
                child: DrawerHeader( decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 255, 132, 0), Color(0xff536976)],
                      stops: [0, 3],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),

                    child: Column(
                  children: [
                    currentUser != null
                       // ? currentUser.image != null
                            ? Stack(
                                children: [ SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.asset("assets/images/458full-al-ahly-sc.png", fit: BoxFit.cover),

                                    ),),


                                ],
                              )
                            : CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                    SizedBox(height: 10,)
                        , Text("My Profile",style: TextStyle(color: Colors.white),),

                  ],
                )),
              ),

              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text(
                  LocaleKeys.side_menu_profile.tr(),
                ),
                onTap: () => navigateTo(context, UserProfileScreen()),
              ),

              ListTile(
                leading: Icon(Icons.feed),
                title: Text(
                  "My Club News",
                ),
                onTap: () =>
                    navigateTo(context, LatestNews(latestNews: latestNews)),
              ),
              ListTile(
                leading: Icon(Icons.feed),
                title: Text(
                  LocaleKeys.side_menu_my_inbox.tr(),
                ),
                onTap: () => navigateTo(context, MyInboxScreen()),
              ),
              // ListTile(
              //   leading: Icon(Icons.feed),
              //   title: Text(
              //     LocaleKeys.side_menu_jop_profile.tr(),
              //   ),
              //   onTap: () => navigateTo(context, JopProfileScreen()),
              // ),
              ListTile(
                leading: Icon(Icons.feed),
                title: Text(
                  LocaleKeys.side_menu_Feeds.tr(),
                ),
                onTap: () => navigateTo(context, FeedScreen()),
              ),
              // ListTile(
              //   leading: Icon(Icons.leaderboard_outlined),
              //   title: Text(
              //     LocaleKeys.side_menu_Ranking.tr(),
              //   ),
              //   onTap: () => navigateTo(context, RankingScreen()),
              // ),
              // ListTile(
              //   leading: Icon(Icons.store_rounded),
              //   title: Text(
              //     LocaleKeys.side_menu_Stores.tr(),
              //   ),
              //   onTap: () => navigateTo(context, NewStoresScreen()),
              //   //  navigateTo(context, Stores()),
              // ),
              ListTile(
                leading: Icon(Icons.card_giftcard),
                title: Text(
                  LocaleKeys.side_menu_Promos.tr(),
                ),
                onTap: () => navigateTo(context, Promos()),
              ),
              ListTile(
                leading: Icon(Icons.wallet_travel),
                title: Text(
                  'Competition History',
                ),
                onTap: () => navigateTo(
                    context,
                    TeamSport(
                        history: true,
                        otherSport: {name: 'Competition History'})),
              ),
              // ListTile(
              //   leading: Icon(Icons.wallet_travel),
              //   title: Text(
              //     'Voting',
              //   ),
              //   onTap: () => navigateTo(context, VotingScreen()),
              // ),
              ListTile(
                leading: Icon(Icons.wallet_travel),
                title: Text(
                  'qrcode ',
                ),
                onTap: () => navigateTo(context, QrCodeScreen()),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text(
                  LocaleKeys.side_menu_Notifications.tr(),
                ),
                onTap: () => navigateTo(context, Notifications()),
              ),
              // ListTile(
              //   leading: Icon(Icons.chat_outlined),
              //   title: Text(
              //     LocaleKeys.side_menu_Chat_room.tr(),
              //   ),
              //   onTap: () => navigateTo(context, ChatRoomsScreen()),
              // ),
              // ListTile(
              //   leading: Icon(Icons.app_registration_rounded),
              //   title: Text(
              //     LocaleKeys.side_menu_Suggested_projects.tr(),
              //   ),
              //   onTap: () => navigateTo(context, SuggestedProjectScreen()),
              // ),
              // ListTile(
              //   leading: Icon(Icons.wallet_travel),
              //   title: Text(
              //     'My QR Code',
              //   ),
              //   onTap: () => navigateTo(context, MyWalletScreen()),
              // ),
              ListTile(
                leading: Icon(Icons.wallet_travel),
                title: Text(
                  'My Wallet',
                ),
                onTap: () => navigateTo(context, MyWalletScreen()),
              ),
              ListTile(
                leading: Icon(Icons.wallet_travel),
                title: Text(
                  ' My cart',
                ),
                onTap: () => navigateTo(context, Checkout()),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  LocaleKeys.side_menu_Setting.tr(),
                ),
                onTap: () => navigateTo(context, SettingsScreen()),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  LocaleKeys.side_menu_About_us.tr(),
                ),
                onTap: () => navigateTo(context, AboutUs()),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text(
                  LocaleKeys.side_menu_Help.tr(),
                ),
                onTap: () => navigateTo(context, HelpScreen()),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  LocaleKeys.side_menu_Logout.tr(),
                ),
                onTap: () => showYesNoAlertDialog(
                    false,
                    context,
                    "Are you sure that you want to logout ?",
                    Icons.exit_to_app,
                    BlocProvider.of<SideDrawerCubit>(context).logOut),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 20),
                    child: Text(
                      "Version  $version ($buildNumber)",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlert(BuildContext context, cubit) {
    var noBtn = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    var yesBtn = TextButton(
      child: Text("Yes"),
      onPressed: () {
        cubit.logOut();
      },
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("LOGOUT"),
              content: Text("Are you sure want to logout ?"),
              actions: <Widget>[noBtn, yesBtn]);
        });
  }
}



mixin currentUser {
}

class User {
  final String name;
  final String image;

  User({required this.name, required this.image});
}

class image extends StatelessWidget {
  final User currentUser = User(
    name: 'Ahmed',
    image: 'https://example.com/profile.jpg', // استبدلها برابط الصورة الخاص بك
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                currentUser.image.isNotEmpty
                    ? CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(currentUser.image),
                  ),
                )
                    : CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    currentUser.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          // بقية عناصر القائمة
        ],
      ),
    );
  }
}
