import 'package:fanzhashem/models/notifications_model.dart';
import 'package:fanzhashem/modules/notifications/cubit/cubit.dart';
import 'package:fanzhashem/modules/notifications/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<NotificationsCubit>(
        create: (context) => NotificationsCubit()..getNotifications(),
        child: BlocConsumer<NotificationsCubit, NotificationsStates>(
            listener: (context, state) async {},
            builder: (context, state) => Scaffold(
                key: _scaffoldKey,
                resizeToAvoidBottomInset: false,
                appBar: appBar(_scaffoldKey, "Notifications", context),
                backgroundColor: lightBlackColor,
                body: Container(
                  child: BlocProvider.of<NotificationsCubit>(context).isLoading
                      ? ShowLoading()
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              BlocProvider.of<NotificationsCubit>(context)
                                  .notifications
                                  .length,
                          itemBuilder: (context, index) {
                            NotificationsModel notification =
                                BlocProvider.of<NotificationsCubit>(context)
                                    .notifications[index];

                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5),
                                      tileColor: darkBlackColor,
                                      minLeadingWidth: width / 7,
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            notification.title ?? "",
                                            softWrap: true,
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            notification.date ?? "",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        notification.body ?? "",
                                        softWrap: true,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      leading: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            notification.image ?? ""),
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                ))));
  }
}
