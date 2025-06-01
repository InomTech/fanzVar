import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/modules/user_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/user_profile/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackMyOrder extends StatefulWidget {
  const TrackMyOrder({super.key});

  @override
  State<TrackMyOrder> createState() => _TrackMyOrderState();
}

class _TrackMyOrderState extends State<TrackMyOrder> {
  bool isNotificationSwitched = true;
  bool isDarkModeSwitched = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileScreenStates>(
          listener: (context, state) async {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Track My Orders"),
                backgroundColor: lightBlackColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              body: SafeArea(
                child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 100, left: 20, right: 20),
                    child: Center(
                      child: Container(
                          height: 120,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff242625),
                          ),
                          child: InkWell(
                            onTap: () {
                              EditProfileCubit.get(context).filePickerFun();
                            },
                            child: Center(
                                child: Text(
                              "Upload your bill",
                              style:
                                  TextStyle(fontSize: 16, color: primaryColor),
                            )),
                          )),
                    )),
              ),
            );
          }),
    );
  }
}
