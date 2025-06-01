import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fanzhashem/modules/auth/register/cubit/states.dart';
import 'package:fanzhashem/translations/locale_keys.g.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(Initial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  bool obscureText = true;
  String title = "";
  var imageFile;
  var retailImageFile;
  final textFieldFocusNode = FocusNode();
  Color borderColor = Colors.transparent;

  var imageUrl;
  String countryValue = "🇪🇬    Egypt";
  String? cityValue, stateValue;

  togglePassword() {
    obscureText = !obscureText;
    // textFieldFocusNode.unfocus();
    // textFieldFocusNode.canRequestFocus = false;
    emit(TogglePassword());
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
    emit(ImagePicked());
  }

  Future<void> pickRetailImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedretailImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedretailImage != null) {
      retailImageFile = File(pickedretailImage.path);
    }
    emit(RetailImagePicked());
  }

  uploadRetailImage() async {
    if (retailImageFile != null) {
      try {
        final FirebaseStorage storage = FirebaseStorage.instance;

        String imageName = DateTime.now().millisecondsSinceEpoch.toString();

        Reference refFeedBucket = storage.ref('profilePictures/$imageName');

        TaskSnapshot uploadedFile =
            await refFeedBucket.putFile(retailImageFile);

        if (uploadedFile.state == TaskState.success) {
          imageUrl = await refFeedBucket.getDownloadURL();
        }

        emit(RetailImageUpload());
      } catch (e) {
        print(e.toString());
      }
    }
  }

  uploadImage() async {
    if (imageFile != null) {
      try {
        final FirebaseStorage storage = FirebaseStorage.instance;

        String imageName = DateTime.now().millisecondsSinceEpoch.toString();

        Reference refFeedBucket = storage.ref('profilePictures/$imageName');

        TaskSnapshot uploadedFile = await refFeedBucket.putFile(imageFile);

        if (uploadedFile.state == TaskState.success) {
          imageUrl = await refFeedBucket.getDownloadURL();
        }

        print(imageUrl);

        emit(ImageUpload());
      } catch (e) {
        print(e.toString());
      }
    }
  }

  registerUser(context) async {
    if (formKey.currentState!.validate() && imageFile != null) {
      emit(ChangeImageBorderColortobeTranspeternt());
      toggleIsLoading();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        User? firebaseUser = userCredential.user;

        print(firebaseUser);

        await uploadImage();

        print(imageUrl);

        usersRef.doc(firebaseUser?.uid).set({
          "id": firebaseUser?.uid,
          "name": nameController.text,
          "email": emailController.text,
          "phone": phoneController.text,
          "image": imageUrl,
          "loginBy": "Email"
        });

        DocumentSnapshot doc = await usersRef.doc(firebaseUser?.uid).get();

        print(doc);

        saveUser(doc);

        toggleIsLoading();

        emit(RegisterSuccess(nameController.text));
      } on FirebaseAuthException catch (e) {
        //await loadingDialog(isLoading: false);
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          showToast(msg: LocaleKeys.register_screen_weak_password_msg);
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
          showToast(msg: LocaleKeys.register_screen_exist_account_msg.tr());
        }
        toggleIsLoading();
      } catch (e) {
        print(e);
        showToast(msg: e.toString());
        toggleIsLoading();
      }
    } else {
      if (imageFile == null) {
        // borderColor = Colors.red;
        showToast(msg: LocaleKeys.register_screen_required_img_msg.tr());
      }

      if (!formKey.currentState!.validate()) {
        // borderColor = Colors.red;
        showToast(msg: LocaleKeys.general_required_msg.tr());
      }
      emit(ValidateFormState());
    }
  }

  saveUser(doc) {
    saveUserLoggedIn(true);
    saveCurrentUser(json.encode(doc.data()));
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }

  selectState(value,
      {bool isCountry = false, bool isCity = false, bool isState = false}) {
    if (isCountry) {
      countryValue = value;
    } else if (isCity) {
      cityValue = value;
    } else {
      stateValue = value;
    }

    emit(Select());
  }
}
