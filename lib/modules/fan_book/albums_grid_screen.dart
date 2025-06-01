// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:fanzhashem/modules/fan_book/cubit/cubit.dart';
import 'package:fanzhashem/modules/fan_book/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image/full_screen_image.dart';

import '../../utilities/constants.dart';
import '../../widgets/video_screen_widget.dart';

class AlbumsGridScreen extends StatefulWidget {
  final title;
  final albumsList;
  const AlbumsGridScreen({super.key, this.title, this.albumsList});

  @override
  State<AlbumsGridScreen> createState() => _AlbumsGridScreenState();
}

class _AlbumsGridScreenState extends State<AlbumsGridScreen> {
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _feedscaffoldKey = GlobalKey<ScaffoldState>();
  late List albums = [];
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
  Widget build(BuildContext context) {
    var blocConsumer = BlocConsumer<FanBookCubit, FanBookStates>(
      listener: (context, state) async {
        if (state is AblumListLoadedSuccessfuly) {
          albums = state.albumList;
        }
      },
      builder: (context, state) {
        // widget.title == 'Annual Festival Day'
        //     ? Text('Incoming Events')
        //     : SizedBox();
        return widget.albumsList.isNotEmpty
            ? Container(
                margin: EdgeInsets.all(12),
                child: MasonryGridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  itemCount: widget.albumsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.green,
                      height: (index.isOdd ? 175 : 250),
                      child: widget.albumsList[index]['type'] == "image"
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        opaque: false,
                                        barrierColor:
                                            // ignore: deprecated_member_use
                                            Colors.white.withOpacity(0),
                                        pageBuilder:
                                            (BuildContext context, _, __) {
                                          return FullScreenPage(
                                            backgroundColor: Colors.white,
                                            child: Image.network(
                                              widget.albumsList[index]
                                                  ["sources"][0],
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        }));
                              },
                              child: Image.network(
                                widget.albumsList[index]["sources"][0],
                                fit: BoxFit.cover,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        opaque: false,
                                        barrierColor:
                                            Colors.white.withOpacity(0),
                                        pageBuilder:
                                            (BuildContext context, _, __) {
                                          return VideoScreenWidget(
                                              url: widget.albumsList[index]
                                                  ["sources"][0]);
                                        }));
                              },
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      widget.albumsList[index]["thumb"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned.directional(
                                    bottom: 5.0,
                                    end: 5.0,
                                    textDirection: TextDirection.ltr,
                                    width: 25,
                                    height: 20,
                                    child: Image.asset(
                                        '${assetImageBaseUrl}videoIcon.png'),
                                  )
                                ],
                              ),
                            ),
                    );

                    // Tile(
                    //   index: index,
                    //   extent: (index.isOdd ? 175 : 250),
                    // );
                  },
                )

                //  MasonryGridView.count(
                //   crossAxisCount: 3,
                //   mainAxisSpacing: 1,
                //   crossAxisSpacing: 1,
                //   itemCount: albums.length,
                //   itemBuilder: (context, index) {
                //     return MasonryGridView.count(
                //       crossAxisCellCount: 1,
                //       mainAxisCellCount: 5,
                //       child: albums[index]['type'] == "image"
                //           ? FullScreenWidget(
                //               child: Container(
                //                 child: Image.network(albums[index]['sources'][0]),
                //               ),
                //             )
                //           : Image.network(albums[index]["thumb"]),
                //     );
                //   },
                // ),
                )
            : CircularProgressIndicator();
      },
    );
    return BlocProvider<FanBookCubit>(
      create: (context) => FanBookCubit()..getAlbumsList(),
      child: blocConsumer,
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  });

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: backgroundColor ?? Colors.green,
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
