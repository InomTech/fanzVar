import 'dart:convert';

import 'package:fanzhashem/models/notifications_model.dart';
import 'package:fanzhashem/modules/notifications/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsCubit extends Cubit<NotificationsStates> {
  NotificationsCubit() : super(Initial());

  static NotificationsCubit get(context) => BlocProvider.of(context);

  bool isLoading = false;

  List<NotificationsModel> notifications = [];

  getNotifications() async {
    toggleIsLoading();

    String data = await rootBundle.loadString('assets/json/notifications.json');
    //print(data);
    List jsonResult = json.decode(data)["Notifications"];

    notifications =
        jsonResult.map((e) => NotificationsModel.fromJson(e)).toList();

    print("notifications[0].image ====> ${notifications[0].image}");

    emit(GetNotifications());

    toggleIsLoading();
  }

  toggleIsLoading() {
    isLoading = !isLoading;
    emit(IsLoading());
  }
}
