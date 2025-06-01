import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

googleButton(context, cubit) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.only(top: 8, left: 0, right: 0),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue, // لون خلفية الزر
              foregroundColor: Colors.white, // لون النص أو الأيقونة

              padding: EdgeInsets.symmetric(horizontal: 38, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.transparent)),
            ),
            onPressed: () {
              googleLogin(context, cubit);
            },
            child: Row(children: <Widget>[
              Text(
                "G  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                LocaleKeys.login_screen_google_sign_in.tr(),
                // 'Sign in with Google   ',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ]),
          ),
        ],
      ),
    ),
  );
}

googleLogin(BuildContext context, cubit) async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final user = await FirebaseAuth.instance.signInWithCredential(credential);

    cubit.socialLogin(user, "Google", user.additionalUserInfo!.isNewUser);
  } on FirebaseAuthException catch (e) {
    log(e.message.toString());
    rethrow;
  } catch (e) {
    print(e.toString());
    showToast(msg: e.toString());
  }
}
