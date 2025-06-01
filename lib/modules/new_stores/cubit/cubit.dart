
// ignore_for_file: unused_field

import 'package:fanzhashem/modules/new_stores/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsStoresCubit extends Cubit<NewsStoresStates> {
  NewsStoresCubit() : super(Initial());

  static NewsStoresCubit get(context) => BlocProvider.of(context);

  bool isFavourt = false;
  double _ratingValue = 1;

 int counter = 0;
 int n =0;
  void onRateingUpdate(value){
_ratingValue = value;
emit(RatingUpdateState());
  }
  void FavourtFillColor(){

    isFavourt =! isFavourt;
    emit(FillFavourtColorState());
  }
  void addToCard(){
    counter++;
    n = n + 10;
    emit(addToCardState());
  }
}

 

  


 

