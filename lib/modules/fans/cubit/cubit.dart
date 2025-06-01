import 'dart:convert';

import 'package:fanzhashem/models/fans_model.dart';
import 'package:fanzhashem/modules/fans/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FansCubit extends Cubit<FansStates> {
  FansCubit() : super(Initial());

  static FansCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  FansModel? fans;
  bool follow = true;
  getFansList() async {
    emit(IsLoading());
    rootBundle.loadString('assets/json/fans.json').then(
      (value) {
        final data = json.decode(value);
        fans = FansModel.fromJson(data);
        emit(DataLoaded());
      },
    );
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }

  following() {
    follow = !follow;
    emit(FollowingState());
  }
}
