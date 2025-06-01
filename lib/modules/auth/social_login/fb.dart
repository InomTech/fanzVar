/*
import 'package:easy_localization/easy_localization.dart';
import 'package:fanzvar/translations/locale_keys.g.dart';
import 'package:fanzvar/widgets/shared_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';

fbButton(context, cubit) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.only(top: 0, left: 0, right: 0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue, // خلفية الزر
              foregroundColor: Colors.white, // لون النص/الأيقونة
            ), //  padding: EdgeInsets.symmetric(horizontal: 38, vertical: 12),
            // shape: RoundedRectangleBorder(
            //    borderRadius: BorderRadius.circular(20.0),
            //  side: BorderSide(color: Colors.transparent)),

            onPressed: () {
              fBLogin(context, cubit);
            },
            child: Row(children: <Widget>[
              Text(
                "f  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                LocaleKeys.login_screen_facebook_sign_in.tr(),
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}

fBLogin(BuildContext context, cubit) async {
  try {
    final facebookLogin = FacebookLogin();final result = await facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile, FacebookPermission.email,
    ]);

    switch (result.status) {
      case FacebookLoginStatus.success:
        try {
          final facebookAuthCred =
              FacebookAuthProvider.credential(result.accessToken!.token);
          final user = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCred);

          print("photo url :${user.user!.photoURL}");

          print(
              "user.additionalUserInfo!.isNewUser========${user.additionalUserInfo!.isNewUser}");

          cubit.socialLogin(
              user, "FaceBook", user.additionalUserInfo!.isNewUser);
        } catch (e) {
          showToast(msg: e.toString());
        }

        break;
      case FacebookLoginStatus.cancel:
        showToast(msg: 'Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        showToast(
            msg: 'Something went wrong with the login process.\n'
                'Here\'s the error Facebook gave us: ${result.error}');
        break;
    }
  } catch (e) {
    print(e.toString());
    showToast(msg: e.toString());
    return null;
  }
}
*/
