import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/champion/champion.dart';
import 'package:fanzhashem/modules/fans/fans_screen.dart';
import 'package:fanzhashem/modules/fans_election/fans_election_screen.dart';
import 'package:fanzhashem/modules/home/home.dart';
import 'package:fanzhashem/modules/map/map.dart';
import 'package:fanzhashem/modules/side_drawer/side_drawer.dart';
import 'package:fanzhashem/modules/voucher/voucher.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/navigation_bar_btn_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

import '../chat_rooms/chat_rooms_screen.dart';
import '../fan_book/fan_book.dart';
import '../fan_book/fans_catagories.dart';
import '../jop_profile/jop_profile_screen.dart';
import '../new_stores/new_stores_screen.dart';
import '../ranking/ranking_screen.dart';
import '../suggested_projects/suggested_projects.dart';
import '../voting/voting_screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen>
    with TickerProviderStateMixin {
  PageController? _myPage;
  var selectedPage;

  List titles = [
    LocaleKeys.home_screen_home.tr(),
    LocaleKeys.home_screen_champion.tr(),
    LocaleKeys.home_screen_voucher.tr(),
    LocaleKeys.home_screen_fan_book.tr()
  ];
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController botomSheetAnimationCtrl;
  String? countryValue;
  String? cityValue;
  String? stateValue;
  bool selectStateError = false;
  bool isShowSearching = true;

  @override
  void initState() {
    super.initState();
    initController();
    _myPage = PageController(initialPage: 0, keepPage: true);
    selectedPage = 0;
    // setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _myPage!.dispose();
    botomSheetAnimationCtrl.dispose();
  }

  void initController() {
    botomSheetAnimationCtrl = BottomSheet.createAnimationController(this);
    botomSheetAnimationCtrl.duration = const Duration(milliseconds: 400);
    botomSheetAnimationCtrl.reverseDuration = const Duration(milliseconds: 400);
  }

  @override
  Widget build(BuildContext context) {
    titles = [
      LocaleKeys.home_screen_home.tr(),
      LocaleKeys.home_screen_champion.tr(),
      LocaleKeys.home_screen_voucher.tr(),
      LocaleKeys.home_screen_fan_book.tr()
    ];
    // ignore: deprecated_member_use
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
            child: Scaffold(
          key: _scaffoldKey,
          resizeToAvoidBottomInset: false,
          // appBar: CustomAppBar(
          //     scaffoldKey: _scaffoldKey,
          //     title: titles[selectedPage],
          //     isMain: true,
          //     isShowSearch: true,
          //     isHome: selectedPage == 0),
          // backgroundColor: lightBlackColor,
          appBar: appBar(_scaffoldKey, titles[selectedPage], context,
              isMain: true,
              isShowSearch: isShowSearching,
              isSearchScreen: !isShowSearching,
              isHome: selectedPage == 0, refresh: () {
            if (mounted) {
              setState(() {
                isShowSearching = !isShowSearching;
              });
            }
          }),
          // backgroundColor: lightBlackColor,
          drawer: SideDrawer(),
          body: PageView(
            physics: ScrollPhysics(),
            controller: _myPage,
            children: <Widget>[

              Home(),
              Champion(),
              Voucher(),
              FansCatagories(),
               FanBook(title: "FanBook",),
            ],
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              showAsBottomSheet(context);
            },
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('${assetImageBaseUrl}i2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          bottomNavigationBar: navigationBarWidget(context),
        )));
  }

  navigationBarWidget(context) {
    return Container(
        decoration: BoxDecoration(
            // border: Border.fromBorderSide(
            //     BorderSide(
            //         color:primaryColor,width: 2
            //     )
            //     ),
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 2)
            ]),
        child: BottomAppBar(
            color: Theme.of(context).highlightColor,
            shape: CircularNotchedRectangle(),
            child: SizedBox(
                height: 90,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              goToPage(0);
                            },
                            child: navigationBarBtn(
                                "",
                                LocaleKeys.home_screen_home.tr(),
                                context,
                                (selectedPage == 0),
                                isHome: true),
                          ),
                          GestureDetector(
                            onTap: () {
                              goToPage(1);
                            },
                            child: navigationBarBtn(
                                "trophy.png",
                                LocaleKeys.home_screen_champion.tr(),
                                context,
                                (selectedPage == 1)),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              goToPage(2);
                            },
                            child: navigationBarBtn(
                                "voutcher.png",
                                LocaleKeys.home_screen_voucher.tr(),
                                context,
                                (selectedPage == 2)),
                          ),
                          GestureDetector(
                            onTap: () {
                              goToPage(3);
                            },
                            child: navigationBarBtn(
                                "book.png",
                                LocaleKeys.home_screen_fan_book.tr(),
                                context,
                                (selectedPage == 3)),
                          ),
                        ])))));
  }

  goToPage(int pageNum) {
    if (_myPage!.hasClients) {
      _myPage!.jumpToPage(pageNum);
      if (mounted) {
        setState(() {
          selectedPage = pageNum;
        });
      }
    }
  }

  showAsBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      transitionAnimationController: botomSheetAnimationCtrl,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.34,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Container(
            padding: EdgeInsets.all(20),
            color: lightBlackColor,
            child: Wrap(
              children: [
                GestureDetector(
                  child:
                      bottomSheetItem(primaryColor, Icons.location_on, "Map"),
                  onTap: () {
                    navigateTo(
                        context, MapScreen(countryValue: countryValue ?? ""));
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(
                      primaryColor, Icons.person_outline_rounded, "Top Fans"),
                  onTap: () {
                    navigateTo(context, FansScreen());
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(primaryColor,
                      Icons.how_to_vote_outlined, "Fans Election"),
                  onTap: () {
                    navigateTo(context, FansElectionScreen());
                  },
                ),
                SizedBox(width: 5),
                GestureDetector(
                  child: bottomSheetItem(
                    primaryColor,
                    Icons.feed,
                    LocaleKeys.side_menu_jop_profile.tr(),
                  ),
                  onTap: () {
                    navigateTo(context, JopProfileScreen());
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(
                    primaryColor,
                    Icons.chat_outlined,
                    LocaleKeys.side_menu_Chat_room.tr(),
                  ),
                  onTap: () {
                    navigateTo(context, ChatRoomsScreen());
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(
                    primaryColor,
                    Icons.store_rounded,
                    LocaleKeys.side_menu_Stores.tr(),
                  ),
                  onTap: () {
                    navigateTo(context, NewStoresScreen());
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(
                    primaryColor,
                    Icons.leaderboard_outlined,
                    LocaleKeys.side_menu_Ranking.tr(),
                  ),
                  onTap: () {
                    navigateTo(context, RankingScreen());
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(
                    primaryColor,
                    Icons.wallet_travel,
                    'Voting',
                  ),
                  onTap: () {
                    navigateTo(context, VotingScreen());
                  },
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: bottomSheetItem(
                    primaryColor,
                    Icons.app_registration_rounded,
                    LocaleKeys.side_menu_Suggested_projects.tr(),
                  ),
                  onTap: () {
                    navigateTo(context, SuggestedProjectScreen());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget bottomSheetItem(color, icon, text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Center(
            child: Icon(icon, size: 40),
          ),
        ),
        SizedBox(height: 10),
        // RichText(
        //   overflow: TextOverflow.ellipsis,
        //   text: TextSpan(
        //     text: text,
        //     style: TextStyle(
        //       fontSize: 11.0,
        //     ),
        //   ),
        // ),
        SizedBox(
          width: 50,
          child: Center(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
