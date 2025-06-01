import 'dart:convert';

import 'package:fanzhashem/models/stores_model.dart';
import 'package:fanzhashem/modules/stores/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoresCubit extends Cubit<StoresStates> {
  StoresCubit() : super(Initial());

  static StoresCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<StoresModel> stores = [];

  getStores() async {
    toggleIsLoading();

    String data = await rootBundle.loadString('assets/json/stores.json');
    //print(data);
    List jsonResult = json.decode(data)["Stores"];

    stores = jsonResult.map((e) => StoresModel.fromJson(e)).toList();

    print("stores[0].image ====> ${stores[0].branches![0].address}");

    emit(GetStores());

    toggleIsLoading();
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
