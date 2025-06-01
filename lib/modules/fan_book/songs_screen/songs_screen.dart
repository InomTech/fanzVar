import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/fan_book/songs_screen/song_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../translations/locale_keys.g.dart';
import '../../../utilities/colors.dart';
import '../../../widgets/shared_widget.dart';
import '../../side_drawer/side_drawer.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'list_tab.dart';
import 'video_tab.dart';

class FansSongsScreen extends StatefulWidget {
  const FansSongsScreen({super.key});

  @override
  State<FansSongsScreen> createState() => _FansSongsScreenState();
}

class _FansSongsScreenState extends State<FansSongsScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldSongsKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => FanBookCubit()
          ..getVideosList()
          ..getSongisList(),
        child: BlocConsumer<FanBookCubit, FanBookStates>(
            listener: (context, state) {},
            builder: (context, state) {
              final fanBookCubit = BlocProvider.of<FanBookCubit>(context);
              return Scaffold(
                  key: scaffoldSongsKey,
                  appBar: appBar(
                      scaffoldSongsKey, LocaleKeys.fan_songs.tr(), context,
                      isMain: true,
                      isShowSearch: false,
                      isSearchScreen: false,
                      isHome: true,
                      refresh: () {},
                      goldEdgeColor: false),
                  drawer: SideDrawer(),
                  body: Scaffold(
                    backgroundColor: darkBlackColor,
                    appBar: PreferredSize(
                      preferredSize: AppBar(
                        toolbarHeight: 60,
                        centerTitle: true,
                      ).preferredSize,
                      child: AppBar(
                        backgroundColor: darkBlackColor,
                        leading: SizedBox(),
                        bottom: TabBar(
                          controller: tabController,
                          indicatorColor: primaryColor,
                          unselectedLabelColor: lightBlackColor,
                          tabs: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.music_note_rounded,
                                color: primaryColor,
                                size: 30,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.play_circle,
                                color: primaryColor,
                                size: 30,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Icon(
                                Icons.queue_music,
                                color: primaryColor,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    body: TabBarView(
                      controller: tabController,
                      children: [
                        SongTab2(),
                        // Sound(),
                        VideoTab(),
                        ThirdListTab(),
                      ],
                    ),
                  ));
            }));
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
