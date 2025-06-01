import 'dart:convert';
import 'dart:io';

import 'package:fanzhashem/modules/jop_profile/cubit/states.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JopProfileCubit extends Cubit<JopProfileStates> {
  JopProfileCubit() : super(Initial());

  static JopProfileCubit get(context) => BlocProvider.of(context);
  List jopsList = [];
  FilePickerResult? result;
  File? pickFiles;
  String path = "";

  filePickerFun(int index) async {
    try {
      result = await FilePicker.platform.pickFiles();
      if (result != null) {
        pickFiles = File(result!.files.single.path!);
        List pathSplites = pickFiles.toString().split('/');
        path = pathSplites[pathSplites.length - 1];
        jopsList[index]["upload"] = path;
        emit(FilePickState());
        print(path);
      }
    } catch (e) {
      print('error in pick file${e.toString()}');
    }
  }

  getJopsList() async {
    // await Future.delayed(Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/json/jop_profile.json');
    jopsList = json.decode(data)['jops_list'];
    emit(GetJopsSuccessState());
  }
}
