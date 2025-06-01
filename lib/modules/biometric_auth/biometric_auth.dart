import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import '../../widgets/shared_widget.dart';
import '../page_view/page_view.dart';

class BiometricAuthSceen extends StatefulWidget {
  const BiometricAuthSceen({super.key});

  @override
  State<BiometricAuthSceen> createState() => _BiometricAuthSceenState();
}

class _BiometricAuthSceenState extends State<BiometricAuthSceen> {
  final LocalAuthentication auth = LocalAuthentication();
  Future<bool> authenticateUser() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isAuthenticated = false;
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    //if device supports biometrics and user has enabled biometrics, then authenticate.
    if (isBiometricSupported && canCheckBiometrics) {
      try {
        isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Scan your fingerprint to authenticate',
          options: const AuthenticationOptions(
            biometricOnly: true,
            useErrorDialogs: true,
            stickyAuth: true,
          ),
        );
        if (isAuthenticated) {
          print(isAuthenticated);
          navigateTo(context, PageViewScreen());
        }
      } on PlatformException catch (e) {
        log(e.toString());
      }
    } else {
      //if device dose not support biometric or dose Not have a password for device
      navigateTo(context, PageViewScreen());
    }
    return isAuthenticated;
  }

  @override
  void initState() {
    super.initState();
    authenticateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Text("confirm auth"),
                onTap: () {
                  authenticateUser();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
