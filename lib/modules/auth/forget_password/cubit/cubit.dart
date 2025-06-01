import 'package:fanzhashem/modules/auth/forget_password/cubit/states.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(Initial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  sendEmail() async {
    if (formKey.currentState!.validate()) {
      toggleIsLoading();

      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text)
            .whenComplete(() => print("sent ========"));

        toggleIsLoading();
        emit(SendEmailSuccess());
      } catch (e) {
        toggleIsLoading();
        showToast(msg: e.toString());
      }
    }
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
