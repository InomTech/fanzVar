import 'package:fanzhashem/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences preferences;


const String userLoggedInKey = "ISLOGGEDIN";
const String userNameKey = "USERNAMEKEY";
const String userEmailKey = "USEREMAILKEY";
const String imageKey = "Image";
const String userIdKey = "id";
const String currentUserKey = "currentUser";
const String isSeenIntroKey = "isSeenIntro";

/// saving data to sharedpreference
Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
  return await preferences.setBool(userLoggedInKey, isUserLoggedIn);
}

Future<bool> saveCurrentUser(String currentUserDoc) async {
  return await preferences.setString(currentUserKey, currentUserDoc);
}

Future<bool> saveIsSeenIntro() async {
  return await preferences.setBool(isSeenIntroKey, true);
}

Future<bool> saveIsProfileOrNo(bool inProfile) async {
  return await preferences.setBool('saveIsProfileOrNo', true);
}

/// fetching data from sharedpreference

bool getUserLoggedIn() => preferences.getBool(userLoggedInKey) ?? false;
bool getIsProfileOrNo() => preferences.getBool('saveIsProfileOrNo') ?? false;
bool getIsSeenIntro() => preferences.getBool(isSeenIntroKey) ?? false;

String getCurrentUser() => preferences.getString(currentUserKey).toString();

/// clear data from sharedpreference
clearSharedPref() => preferences.clear();
