
import 'package:fanzhashem/modules/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';



import 'models/user_model.dart';

import 'modules/page_view/page_view.dart';
import 'package:easy_localization/easy_localization.dart';

// void main() {
//   runApp( MyApp());
//
// }

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'modules/user_profile/cubit/cubit.dart';
import 'modules/user_profile/cubit/states.dart';
import 'translations/codegen_loader.g.dart';

late SharedPreferences preferences;


// import 'page_view_screen.dart'; //

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home:  Login(),
    );
  }
}



///////////////// APIS /////////////////
// class MyApp extends StatelessWidget {
//   final ApiService apiService = ApiService();
//
//   @override
//   Widget build(BuildContext context) {
//     // استدعاء الدالة لجلب البيانات
//     apiService.fetchData();
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: Text('الرجاء فحص الكونسول للنتيجة.'),
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Welcome",
//       home: SplashScreen(),
//     );
//   }
// }
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _AkTestState();
// }
//
// class _AkTestState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext) {
//     return AnimatedSplashScreen(
//       splash: Column(children: [
//         Center(
//           child: LottieBuilder.asset(
//               "assets/animate/ball.json"),
//         ),
//         const SizedBox(
//           width: 50,
//           height: 50,
//         )
//       ]),
//       nextScreen: const LoginScreen(),
//       duration: 4500,
//       splashIconSize: 550,
//       backgroundColor: Colors.white,
//       splashTransition: SplashTransition.slideTransition,
//     );
//   }
// }

//LoginScreen Asasii
//PredictionScreen (Test Api)
//LoginScreen (Test LogIn )
//HomeScreen(H Test)
//PageViewScreen
// MatchPredictionScreen
//Home
//NewStoresScreen (saf7a Store fiha edit)
//   'email': 'mohamedahsmed@gmail.com',
//           'password123',