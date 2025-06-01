import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../utilities/shared_pref.dart';

class ProfileImageWidget extends StatelessWidget {
  final cubit;
  final onPressed;
  final isChat;
  final borderColor;
  final bool getIsProfile = getIsProfileOrNo();

  ProfileImageWidget(
      {super.key,
      this.isChat = false,
      this.borderColor = Colors.transparent,
      this.cubit,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25.0),
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(100),
        image: cubit.imageFile == null
            ? getIsProfile == true
                ? DecorationImage(
                    image: AssetImage(
                        "${assetImageBaseUrl}pexels-photo-2379004.png"),
                    fit: BoxFit.cover)
                : DecorationImage(
                    image: AssetImage("${assetImageBaseUrl}profile.png"),
                    fit: BoxFit.cover)
            : DecorationImage(
                image: FileImage(cubit.imageFile), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: getIsProfile == false
                ? Visibility(
                    visible: cubit.imageFile == null,
                    child: InkWell(
                      onTap: onPressed,
                      child: Icon(
                        isChat == false
                            ? Icons.person
                            : Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  )
                : InkWell(
                    onTap: onPressed,
                    child: SizedBox(
                      height: 30,
                      width: 30,
                    ),
                  ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     padding: EdgeInsets.only(top: 7),
          //     decoration: BoxDecoration(
          //         color: isChat == false ? accentColor : primaryColor,
          //         shape: BoxShape.circle,
          //         border: Border.all(color: Colors.white, width: 1)),
          //     child: IconButton(
          //       alignment: Alignment.topCenter,
          //       icon: new Icon(
          //         Icons.arrow_upward_rounded,
          //         color: Colors.white,
          //       ),
          //       onPressed: onPressed,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
