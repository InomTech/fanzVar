import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/cupertino.dart';

class ImageWidget extends StatelessWidget {
  final String? type;
  final String imageName;

  const ImageWidget(
      {super.key, this.type = "network", required this.imageName});

  @override
  Widget build(BuildContext context) {
    return type == "network"
        ? Image.network(networkImageBaseUrl + imageName)
        : Image.asset(assetImageBaseUrl + imageName);
  }
}
