import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:fanzhashem/models/user_model.dart';
import 'package:fanzhashem/modules/page_view/page_view.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تسجيل الدخول'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("تسجيل الدخول التجريبي"),
          onPressed: () async {
            // حفظ حالة الدخول
            await saveUserLoggedIn(true);

            // إنشاء مستخدم وهمي
            UserModel user = UserModel(
             // id: 1,
              name: "اسم المستخدم",
              email: "user@example.com",
              // أكمل حسب خصائص UserModel الخاصة بك
            );

            // حفظ بيانات المستخدم
           // await saveCurrentUser(user);

            // الانتقال إلى الصفحة الرئيسية
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => PageViewScreen()),
            );
          },
        ),
      ),
    );
  }
}
