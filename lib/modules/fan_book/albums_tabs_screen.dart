import 'package:fanzhashem/modules/fan_book/cubit/cubit.dart';
import 'package:fanzhashem/modules/fan_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/colors.dart';
import '../../utilities/constants.dart';
import '../../widgets/shared_widget.dart';
import '../side_drawer/side_drawer.dart';
import 'album_pictures_tab.dart';
import 'albums_grid_screen.dart';
import 'albums_vedios_tab.dart';

class AlbumsTabsScreen extends StatefulWidget {
  final title;
  const AlbumsTabsScreen({super.key, this.title});

  @override
  State<AlbumsTabsScreen> createState() => _AlbumsTabsScreenState();
}

class _AlbumsTabsScreenState extends State<AlbumsTabsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _activeIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldSongsKey = GlobalKey<ScaffoldState>();
  bool isShowSearching = true;

  late List albums = [];
  List albumsPictures = [];
  List albumsVedios = [];
  List<String> imageList = [
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];

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
        create: (BuildContext context) => FanBookCubit()..getAlbumsList(),
        child: BlocConsumer<FanBookCubit, FanBookStates>(
            listener: (context, state) {
          if (state is AblumListLoadedSuccessfuly) {
            albums = state.albumList;
            albumsPictures = albums.where((x) => x['type'] == 'image').toList();
            albumsVedios = albums.where((x) => x['type'] == 'video').toList();
          }
        }, builder: (context, state) {
          final fanBookCubit = BlocProvider.of<FanBookCubit>(context);
          return Scaffold(
            key: scaffoldSongsKey,
            appBar: appBar(scaffoldSongsKey, widget.title, context,
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
                        image: AssetImage("${assetImageBaseUrl}albums.png"),
                        width: _activeIndex == 0 ? 28 : 23,
                        color: _activeIndex == 0 ? primaryColor : Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Image(
                        image:
                            AssetImage("${assetImageBaseUrl}albumpicture.png"),
                        width: _activeIndex == 1 ? 28 : 23,
                        color: _activeIndex == 1 ? primaryColor : Colors.white,
                      ),
                    ),
                    Tab(
                      icon: Image(
                        image: AssetImage("${assetImageBaseUrl}albumvedeo.png"),
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
                      AlbumsGridScreen(albumsList: albums),
                      AlbumsPicturesTab(albumsList: albumsPictures),
                      AlbumsVediosTab(albumsList: albumsVedios),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
