import 'dart:io';

import 'package:fanzhashem/modules/user_profile/cubit/states.dart';
import 'package:fanzhashem/utilities/shared_pref.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileCubit extends Cubit<EditProfileScreenStates> {
  EditProfileCubit() : super(Initial()) {
    initPreferences();
  }

  static EditProfileCubit get(context) => BlocProvider.of(context);

  late SharedPreferences preferences;

  Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    getFirstIsDark(); // مباشرة بعد التهيئة
  }

  bool isLoading = false;
  var imageFile;
  var imageUrl;
  bool isDarkMood = true;
  bool join = false;
  bool join2 = false;
  FilePickerResult? result;
  File? pickFiles;
  String path = "";

  filePickerFun() async {
    try {
      result = await FilePicker.platform.pickFiles();
      if (result != null) {
        pickFiles = File(result!.files.single.path!);
        var pathSplits = pickFiles.toString().split('/');
        path = pathSplits.last;
        print('Cv file: $path');
        emit(FilePickSuccess());
      }
    } catch (e) {
      print('error in pick file${e.toString()}');
    }
  }

  void getFirstIsDark() {
    final data = preferences.getBool('isDarkMood');
    if (data != null) {
      isDarkMood = data;
    }
    preferences.setBool('isDarkMood', isDarkMood);
    emit(ChangeDarkMood(isDarkMood));
  }

  void changeDarkMood() {
    isDarkMood = !isDarkMood;
    preferences.setBool('isDarkMood', isDarkMood);
    emit(ChangeDarkMood(isDarkMood));
  }

  void joining() {
    join = !join;
    emit(JoiningState());
  }

  void joining2() {
    join2 = !join2;
    emit(Joining2State());
  }

  void logOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
    clearSharedPref();
    emit(LogoutSuccess());
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

  Future<void> uploadImage() async {
    if (imageFile != null) {
      try {
        final FirebaseStorage storage = FirebaseStorage.instance;
        String imageName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference ref = storage.ref('profilePictures/$imageName');
        TaskSnapshot uploadedFile = await ref.putFile(imageFile);
        if (uploadedFile.state == TaskState.success) {
          imageUrl = await ref.getDownloadURL();
        }
        print(imageUrl);
        emit(ImageUpload());
      } catch (e) {
        print(e.toString());
      }
    }
  }

  String? selectedPlayer;
  List<String> players = ["Mo Salah", "Messy", "Abu Treka"];

  String? selectedPlayerAgeRange;
  List<String> playerAgeRanges = ["12-20", "20-25", "25-30"];

  bool selectedPlayerAgeRangeError = false;
  bool selectedPlayerError = false;

  void selectPlayer(String player) {
    selectedPlayer = player;
    emit(SelectPlayer());
  }

  void selectPlayerAgeRange(String playerAgeRange) {
    selectedPlayerAgeRange = playerAgeRange;
    emit(SelectPlayerAgeRange());
  }

  void toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }

  void go() {}
}
