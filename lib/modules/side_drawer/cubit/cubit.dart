import 'dart:convert';

import 'package:fanzhashem/modules/side_drawer/cubit/states.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../models/latest_news_model.dart';

class SideDrawerCubit extends Cubit<SideDrawerStates> {
  SideDrawerCubit() : super(Initial());

  static SideDrawerCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  List<LatestNewsModel> latestNews = [];

  logOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
   // final FacebookLogin facebookLogin = FacebookLogin();
    await googleSignIn.signOut();
   // await facebookLogin.logOut();
    await FirebaseAuth.instance.signOut();
    clearSharedPref();
    emit(LogoutSuccess());
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    emit(GetAppVersion(version, buildNumber));
  }

  getLatestNews() async {
    String data = await rootBundle.loadString('assets/json/newsClub.json');
    //print(data);
    List jsonResult = json.decode(data)["Latest News"];

    latestNews = jsonResult.map((e) => LatestNewsModel.fromJson(e)).toList();

    print("latestNews[0].url ====> ${latestNews[0].url}");

    emit(GetLatestNewsForClub(latestNews));
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
