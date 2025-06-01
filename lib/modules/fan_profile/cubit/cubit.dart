import 'dart:convert';

import 'package:fanzhashem/models/fan_profile.dart';
import 'package:fanzhashem/modules/fan_profile/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FanProfileCubit extends Cubit<FansProfileStates> {
  FanProfileCubit() : super(Initial());

  static FanProfileCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  FanProfileModel? fanProfile;

  getFanData() async {
    emit(IsLoading());
    rootBundle.loadString('assets/json/profile_fan.json').then(
      (value) {
        final data = json.decode(value);
        fanProfile = FanProfileModel.fromJson(data["fan_profile"]);
        emit(DataLoaded());
      },
    );
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
