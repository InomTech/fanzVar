import 'dart:convert';

import 'package:fanzhashem/models/promos_model.dart';
import 'package:fanzhashem/modules/promos/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PromosCubit extends Cubit<PromosStates> {
  PromosCubit() : super(Initial());

  static PromosCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<PromosModel> promos = [];

  getPromos() async {
    toggleIsLoading();

    String data = await rootBundle.loadString('assets/json/promos.json');
    //print(data);
    List jsonResult = json.decode(data)["Promos"];

    promos = jsonResult.map((e) => PromosModel.fromJson(e)).toList();

    print("promos[0].name ====> ${promos[0].name}");

    emit(GetPromos());

    toggleIsLoading();
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
