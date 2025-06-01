import 'package:fanzhashem/modules/latest_news/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestNewsCubit extends Cubit<LatestNewsStates> {
  LatestNewsCubit() : super(Initial());

  static LatestNewsCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
