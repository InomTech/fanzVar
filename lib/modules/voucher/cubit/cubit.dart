import 'dart:async';

import 'package:fanzhashem/modules/voucher/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherCubit extends Cubit<VoucherStates> {
  VoucherCubit() : super(Initial());

  static VoucherCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;
  late Timer secondsTimer;
  int sec = 59;

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }

  void startSecondsTimer() {
    const oneSec = Duration(seconds: 1);
    secondsTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (sec == 0) {
          secondsTimer.cancel();
          emit(CancelSecondsTimerState());
        } else {
          sec--;
          emit(UpdateSecondsValueState(sec));
        }
      },
    );
  }
}
