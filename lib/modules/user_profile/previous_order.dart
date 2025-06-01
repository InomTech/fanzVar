import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/modules/user_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/user_profile/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class PrivaiousOrderScreen extends StatelessWidget {
  const PrivaiousOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
      create: (BuildContext context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Previous orders"),
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
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    SizedBox(height: 15),
                    Ranking(1, "Labtop", "Mousl", 200),
                    SizedBox(height: 15),
                    Ranking(2, "T-shirt", "Mousl", 200),
                    SizedBox(height: 15),
                    Ranking(3, "T-shirt", "Mousl", 200),
                    SizedBox(height: 15),
                    Ranking(4, "T-shirt", "Mousl", 200),
                    SizedBox(height: 15),
                    Ranking(5, "T-shirt", "Mousl", 200),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Color(0xff242625),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          "Totals",
                          style: TextStyle(color: primaryColor),
                        ),
                        SizedBox(width: 30),
                        Text("5 Orders"),
                      ],
                    ),
                    trailing: Text("800"),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget Ranking(int OrderID, String OrderName, String place, double Price) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xff242625),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Order : $OrderID",
              style: TextStyle(fontSize: 16, color: primaryColor),
            ),
          ),
          Divider(thickness: 1, color: Colors.grey[700]),
          ListTile(
            title: Row(
              children: [
                Text(OrderName, style: TextStyle(color: Colors.white)),
                SizedBox(width: 30),
                Text(place),
              ],
            ),
            trailing: Text(Price.toString()),
          ),
        ],
      ),
    );
  }
}

