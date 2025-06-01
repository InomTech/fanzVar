import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:full_screen_image/full_screen_image.dart';

class PhotosTapView extends StatelessWidget {
  final List photos;
  const PhotosTapView({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Container(
        margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: ScreenUtil().setHeight(10),
          crossAxisSpacing: ScreenUtil().setWidth(10),
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Container(
                  child: borderImg(photos[0]),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Container(
                  child: borderImg(photos[1]),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Container(
                  child: borderImg(photos[2]),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Container(
                  child: borderImg(photos[3]),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: FullScreenWidget(
                disposeLevel: DisposeLevel.Medium,
                child: Container(
                  child: borderImg(photos[4]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

borderImg(url) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setSp(20))),
    child: Image.network(url, fit: BoxFit.fill),
  );
}
