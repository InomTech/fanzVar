import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/fan_book/songs_grid_tab.dart';
import 'package:fanzhashem/modules/fan_book/songs_one_tab.dart';
import 'package:fanzhashem/modules/fan_book/songs_third_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../translations/locale_keys.g.dart';
import '../../utilities/colors.dart';
import '../../utilities/constants.dart';
import '../../widgets/shared_widget.dart';
import '../side_drawer/side_drawer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class FansSongssScreen extends StatefulWidget {
  const FansSongssScreen({super.key});

  @override
  State<FansSongssScreen> createState() => _FansSongssScreenState();
}

class _FansSongssScreenState extends State<FansSongssScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _activeIndex = 0;
  List songs = [];
  List vedios = [];

  final GlobalKey<ScaffoldState> scaffoldSongsKey = GlobalKey<ScaffoldState>();
  bool isShowSearching = true;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _activeIndex = _tabController.index;
        });
      }
    });
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
        create: (BuildContext context) => FanBookCubit()..getSongsList(),
        child: BlocConsumer<FanBookCubit, FanBookStates>(
            listener: (context, state) {
          if (state is SongsListLoadedSuccessfuly) {
            songs = state.songsList;
          }
          // if (state is VideosListLoadedSuccessfuly) {
          //   vedios = state.videosList;
          // }
        }, builder: (context, state) {
          final fanBookCubit = BlocProvider.of<FanBookCubit>(context);
          return Scaffold(
            key: scaffoldSongsKey,
            appBar: appBar(scaffoldSongsKey, LocaleKeys.fan_songs.tr(), context,
                isMain: false,
                isHome: false,
                isShowSearch: isShowSearching,
                isSearchScreen: !isShowSearching, refresh: () {
              if (mounted) {
                setState(() {
                  isShowSearching = !isShowSearching;
                });
              }
            }),
            drawer: SideDrawer(),
            body: Column(
              children: [
                TabBar(
                  unselectedLabelColor: Colors.white,
                  labelColor: primaryColor,
                  indicatorColor: primaryColor,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      icon: Image(
                        image:
                            AssetImage("${assetImageBaseUrl}Group 10703.png"),
                        width: _activeIndex == 0 ? 28 : 23,
                        color: _activeIndex == 0 ? primaryColor : Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Image(
                        image: AssetImage("${assetImageBaseUrl}Path12664.png"),
                        width: _activeIndex == 1 ? 28 : 23,
                        color: _activeIndex == 1 ? primaryColor : Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Image(
                        image: AssetImage("${assetImageBaseUrl}Path12692.png"),
                        width: _activeIndex == 2 ? 28 : 23,
                        color: _activeIndex == 2 ? primaryColor : Colors.white,
                      ),
                    ),
                  ],
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // SongTab2(),
                      SongsOneTab(songsList: songs),
                      SongsGridTab(songsList: songs),
                      // SongsGridTab(songsList: songs),
                      SongsThirdTab(songsList: songs),
                    ],
                  ),
                ),
              ],
            ),

            //                 //  Row(
            //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 //   children: [
            //                 //     Padding(
            //                 //       padding: const EdgeInsets.only(left: 6),
            //                 //       child: Container(
            //                 //         width: 50,
            //                 //         height: 50,
            //                 //         child: Image.asset(
            //                 //           vouchersList[index]["img"],
            //                 //         ),
            //                 //       ),
            //                 //     ),
            //                 //     RichText(
            //                 //       text: TextSpan(children: [
            //                 //         TextSpan(
            //                 //           text: vouchersList[index]["percentage"] ??
            //                 //               "10%",
            //                 //           style: TextStyle(
            //                 //               color: primaryColor,
            //                 //               fontSize: 25,
            //                 //               fontWeight: FontWeight.bold),
            //                 //         ),
            //                 //         WidgetSpan(
            //                 //           child: Transform.translate(
            //                 //             offset: const Offset(0, 10),
            //                 //             child: Text(
            //                 //               'off',
            //                 //               textScaleFactor: 2.0,
            //                 //               style: TextStyle(
            //                 //                   color: primaryColor, fontSize: 8),
            //                 //             ),
            //                 //           ),
            //                 //         ),
            //                 //       ]),
            //                 //     ),
            //                 //     Column(
            //                 //       mainAxisSize: MainAxisSize.min,
            //                 //       mainAxisAlignment: MainAxisAlignment.start,
            //                 //       crossAxisAlignment: CrossAxisAlignment.end,
            //                 //       children: [
            //                 //         Padding(
            //                 //           padding: const EdgeInsets.only(right: 8.0),
            //                 //           child: Container(
            //                 //             width: 50,
            //                 //             height: 50,
            //                 //             child: Image.asset(
            //                 //               "${assetImageBaseUrl}Group 8.png",
            //                 //               width: 100,
            //                 //               height: 100,
            //                 //             ),
            //                 //           ),
            //                 //         ),
            //                 //         Spacer(),
            //                 //         Padding(
            //                 //           padding: const EdgeInsets.only(
            //                 //               bottom: 10.0, right: 3),
            //                 //           child: Row(
            //                 //             children: [
            //                 //               Padding(
            //                 //                 padding:
            //                 //                     const EdgeInsets.only(bottom: 12.0),
            //                 //                 child: Text(
            //                 //                   "Ends:",
            //                 //                   style: TextStyle(
            //                 //                     color: primaryColor,
            //                 //                     fontSize: 12,
            //                 //                   ),
            //                 //                 ),
            //                 //               ),
            //                 //               SizedBox(width: 8),

            //                 //               ///============= Day
            //                 //               Column(
            //                 //                 children: [
            //                 //                   Container(
            //                 //                     height: 30,
            //                 //                     width: 30,
            //                 //                     decoration: BoxDecoration(
            //                 //                       color: Colors.black,
            //                 //                       borderRadius: BorderRadius.all(
            //                 //                         Radius.circular(12.0),
            //                 //                       ),
            //                 //                       border: Border.all(
            //                 //                         color: primaryColor
            //                 //                             .withOpacity(0.4),
            //                 //                       ),
            //                 //                     ),
            //                 //                     child: Center(
            //                 //                       child: Text(
            //                 //                         vouchersList[index]["day"] ??
            //                 //                             "7",
            //                 //                         style: TextStyle(
            //                 //                             color: Colors.white),
            //                 //                       ),
            //                 //                     ),
            //                 //                   ),
            //                 //                   SizedBox(height: 3),
            //                 //                   Text(
            //                 //                     "Day",
            //                 //                     style: TextStyle(
            //                 //                       color: primaryColor,
            //                 //                       fontSize: 11,
            //                 //                     ),
            //                 //                   ),
            //                 //                 ],
            //                 //               ),

            //                 //               ///============== Hr
            //                 //               Column(
            //                 //                 children: [
            //                 //                   Container(
            //                 //                     height: 30,
            //                 //                     width: 30,
            //                 //                     decoration: BoxDecoration(
            //                 //                       color: Colors.black,
            //                 //                       borderRadius: BorderRadius.all(
            //                 //                         Radius.circular(12.0),
            //                 //                       ),
            //                 //                       border: Border.all(
            //                 //                         color: primaryColor
            //                 //                             .withOpacity(0.4),
            //                 //                       ),
            //                 //                     ),
            //                 //                     child: Center(
            //                 //                       child: Text(
            //                 //                         vouchersList[index]["Hr"],
            //                 //                         style: TextStyle(
            //                 //                             color: Colors.white),
            //                 //                       ),
            //                 //                     ),
            //                 //                   ),
            //                 //                   SizedBox(height: 3),
            //                 //                   Text(
            //                 //                     "Hr",
            //                 //                     style: TextStyle(
            //                 //                       color: primaryColor,
            //                 //                       fontSize: 11,
            //                 //                     ),
            //                 //                   ),
            //                 //                 ],
            //                 //               ),

            //                 //               ///=============== MIn
            //                 //               Column(
            //                 //                 children: [
            //                 //                   Container(
            //                 //                     height: 30,
            //                 //                     width: 30,
            //                 //                     decoration: BoxDecoration(
            //                 //                       color: Colors.black,
            //                 //                       borderRadius: BorderRadius.all(
            //                 //                         Radius.circular(12.0),
            //                 //                       ),
            //                 //                       border: Border.all(
            //                 //                         color: primaryColor
            //                 //                             .withOpacity(0.4),
            //                 //                       ),
            //                 //                     ),
            //                 //                     child: Center(
            //                 //                       child: Text(
            //                 //                         vouchersList[index]["Min"],
            //                 //                         style: TextStyle(
            //                 //                             color: Colors.white),
            //                 //                       ),
            //                 //                     ),
            //                 //                   ),
            //                 //                   SizedBox(height: 3),
            //                 //                   Text(
            //                 //                     "Min",
            //                 //                     style: TextStyle(
            //                 //                       color: primaryColor,
            //                 //                       fontSize: 11,
            //                 //                     ),
            //                 //                   ),
            //                 //                 ],
            //                 //               ),

            //                 //               ///========== Sec
            //                 //               Column(
            //                 //                 children: [
            //                 //                   Container(
            //                 //                     height: 30,
            //                 //                     width: 30,
            //                 //                     decoration: BoxDecoration(
            //                 //                       color: Colors.black,
            //                 //                       borderRadius: BorderRadius.all(
            //                 //                         Radius.circular(12.0),
            //                 //                       ),
            //                 //                       border: Border.all(
            //                 //                         color: primaryColor
            //                 //                             .withOpacity(0.4),
            //                 //                       ),
            //                 //                     ),
            //                 //                     child: Center(
            //                 //                       child: Text(
            //                 //                         "zzz",
            //                 //                         style: TextStyle(
            //                 //                             color: Colors.white),
            //                 //                       ),
            //                 //                     ),
            //                 //                   ),
            //                 //                   const SizedBox(height: 3),
            //                 //                   Text(
            //                 //                     "Sec",
            //                 //                     style: TextStyle(
            //                 //                       color: primaryColor,
            //                 //                       fontSize: 11,
            //                 //                     ),
            //                 //                   ),
            //                 //                 ],
            //                 //               ),
            //                 //             ],
            //                 //           ),
            //                 //         )
            //                 //       ],
            //                 //     ),
            //                 //   ],
            //                 // ),
            //                 ),
            //           );
            //         },
            //       ),
          );
        }));
  }
}
