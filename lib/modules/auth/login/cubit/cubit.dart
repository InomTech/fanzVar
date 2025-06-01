import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanzhashem/modules/auth/login/cubit/states.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(Initial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool obscureText = true;
  final textFieldFocusNode = FocusNode();

  togglePassword() {
    obscureText = !obscureText;
    textFieldFocusNode.unfocus();
    textFieldFocusNode.canRequestFocus = false;
    emit(TogglePassword());
  }

  loginUser(context) async {
    if (formKey.currentState!.validate()) {
      try {
        toggleIsLoading();

        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        User? firebaseUser = userCredential.user;

        print(firebaseUser);

        DocumentSnapshot doc = await usersRef.doc(firebaseUser?.uid).get();

        print("user  ${doc.data()}");

        saveUser(doc);

        toggleIsLoading();

        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        showToast(msg: e.message.toString());
        toggleIsLoading();
      } catch (e) {
        print(e);
        showToast(msg: e.toString());
        toggleIsLoading();
      }
    } else {
      if (!formKey.currentState!.validate()) {
        showToast(msg: LocaleKeys.general_required_msg);
      }
    }
  }

  socialLogin(user, loginBy, isNewUser) async {
    toggleIsLoading();

    print(user);

    print(isNewUser);

    if (isNewUser) {
      await usersRef.doc(user.user.uid).set({
        "id": user.user.uid,
        "name": user.user.displayName,
        "email": user.user.email,
        "phone": user.user.phoneNumber,
        "image": loginBy == "FaceBook"
            ? '${user.user.photoURL}?type=large'
            : user.user.photoURL,
        "loginBy": loginBy
      });
    }

    DocumentSnapshot doc = await usersRef.doc(user.user.uid).get();

    print(doc);

    saveUser(doc);
    toggleIsLoading();
    emit(SocialLoginSuccess(user.user.displayName, isNewUser));
  }

  saveUser(doc) {
    saveUserLoggedIn(true);
    saveCurrentUser(json.encode(doc.data()));
    print("User saved");
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
