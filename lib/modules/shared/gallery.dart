import 'package:fanzhashem/modules/shared/competition_details_widgets.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';

class Gallery extends StatelessWidget {
  final galleryImages;
  const Gallery({super.key, required this.galleryImages});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    print(galleryImages);
    print(galleryImages.runtimeType);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: appBar(scaffoldKey, "Gallery", context),
      backgroundColor: lightBlackColor,
      body: GalleryGridView(
        galleryImages: galleryImages,
        isFullScreen: true,
      ),
    );
  }
}
