import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Api {
  bool isSuccess = false;

  register(name, email, phone, password, conpass) async {
    try {
      var fullUrl =
          Uri.parse("https://fanzvarapi.eprime.co/api/Account/register");
      var data = {
        "userName": name.toString(),
        "password": password.toString(),
        "phoneNumber": phone.toString(),
        "email": email.toString(),
        "roleName": "Fan",
      };
      print(data);

      var response = await http.post(fullUrl, body: data);
      var parsed = json.decode(response.body);
      //return parsed.map((e) =>AdsModel.fromJson(e)).toList();
      if (response.statusCode == 200) {
        isSuccess = parsed["Success"];
        showToast(msg: 'Registration Success');
      } else {
        String error = json.decode(response.body)["Error"];
        print(error);
      }
    } catch (e) {
      print("register error $e");
    }
  }

  login(name, password) async {
    try {
      var fullUrl = Uri.parse("https://fanzvarapi.eprime.co/api/Account/login");
      var data = {
        "userName": name.toString(),
        "password": password.toString(),
      };
      print(data);

      var response = await http.post(fullUrl, body: data);
      var parsed = json.decode(response.body);
      //return parsed.map((e) =>AdsModel.fromJson(e)).toList();
      if (response.statusCode == 200) {
        isSuccess = parsed["Success"];
        showToast(msg: 'Login Success');
      } else {
        String error = json.decode(response.body)["Error"];
        print(error);
      }
    } catch (e) {
      print("register error $e");
    }
  }

  showToast({msg}) => Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        // textColor: Colors.white,
        fontSize: 16.0,
      );
}
