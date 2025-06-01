import 'package:fanzhashem/main.dart';
import 'package:fanzhashem/modules/user_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/user_profile/cubit/states.dart';
import 'package:fanzhashem/modules/user_profile/dropdown_widget.dart';
import 'package:fanzhashem/modules/user_profile/previous_order.dart';
import 'package:fanzhashem/modules/user_profile/track_my_order.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/shared_widget.dart';
import '../gaming/gaming_screen.dart';
import '../payment/payment_screen.dart';
import '../qr_code/qr_code_screen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isNotificationSwitched = true;
  bool isDarkModeSwitched = true;
  String dropdownvalue = 'value';

  var items1 = ['Help', 'Language'];
  var items2 = ['****1123', '****2345'];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => EditProfileCubit(),
      child: BlocConsumer<EditProfileCubit, EditProfileScreenStates>(
          listener: (context, state) async {},
          builder: (context, state) {
            if (state is LogoutSuccess) {
              showToast(msg: 'We will miss you');
              // navigateAndFinish(context, Login());
            }
            // isDarkModeSwitched =
            //     BlocProvider.of<EditProfileCubit>(context).isDarkMood;
            return Scaffold(
              // backgroundColor:
              //     BlocProvider.of<EditProfileCubit>(context).isDarkMood
              //         ? darkBlackColor
              //         : lightBlackColor,
              appBar: AppBar(
                title: ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    child: Image(
                      image: AssetImage(
                          "${assetImageBaseUrl}pexels-photo-2379004.png"),
                    ),
                  ),
                  title: Text("Ahmed Seroug", style: TextStyle(fontSize: 14)),
                  subtitle: Text(
                    "@Ahmed Seroug1234",
                    style: TextStyle(fontSize: 12, color: Colors.white38),
                  ),
                ),
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
                actions: [
                  Image.asset(
                    "${assetImageBaseUrl}ITA.png",
                    width: 35,
                  ),
                  SizedBox(width: 15),
                ],
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                child: Image.asset("${assetImageBaseUrl}F.PNG"),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Favourite",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                child: Image.asset("${assetImageBaseUrl}S.PNG"),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Saved",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                child: Image.asset("${assetImageBaseUrl}V.PNG"),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Vouchers",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                child: Image.asset("${assetImageBaseUrl}T.PNG"),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "My Tickets",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "Profile",
                      //       style:
                      //           TextStyle(color: Colors.black, fontSize: 18),
                      //     ),
                      //   ],
                      // ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PersonalBalnce(
                              "Personal point", 1200, Icons.point_of_sale),
                          PersonalBalnce("Balance", 1200, Icons.balance),
                        ],
                      ),

                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PersonalBalnce(
                              "Donate", 1200, Icons.done_all_outlined),
                          PersonalBalnce("Cart", 12, Icons.star),
                        ],
                      ),

                      SizedBox(height: 16),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Ranking",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(height: 16), Ranking(1, "Ahmad Ali", 200),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          boxCardItem("Cart Check Out", Icons.track_changes),
                          InkWell(
                            onTap: () {
                              navigateTo(context, TrackMyOrder());
                            },
                            child: boxCardItem(
                                "Track My order", Icons.request_page_rounded),
                          ),
                          InkWell(
                              onTap: () {
                                navigateTo(context, PrivaiousOrderScreen());
                              },
                              child: boxCardItem("Previous Orders",
                                  Icons.request_page_rounded)),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          boxCardItem("Add review", Icons.track_changes),
                          boxCardItem("View reviews", Icons.track_changes),
                          boxCardItem("Donate ", Icons.do_not_disturb),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          boxCardItem("Vote for club", Icons.video_settings),
                          // boxCardItem("Local club logo", Icons.track_changes),
                          boxCardItem("Notifications ", Icons.notifications),
                          boxCardItem("Add request for outside clubs",
                              Icons.request_page_outlined),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, GamingScreen());
                            },
                            child: boxCardItem("Gaming", Icons.games),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, QrCodeScreen());
                            },
                            child: boxCardItem("Qr Code", Icons.qr_code),
                          ),
                          InkWell(
                            onTap: () {
                              EditProfileCubit.get(context).filePickerFun();
                            },
                            child: boxCardItem("Upload CV", Icons.upload_file),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Fans Talent",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          )),
                      SizedBox(height: 16),
                      fansTalent("Noor Ali"),
                      SizedBox(height: 16),
                      item(height, "Account Setting", Icons.account_circle,
                          items1),
                      SizedBox(height: 5),
                      changePassword(
                        height,
                        "Change Password",
                        Icons.lock_outlined,
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: height / 18,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: lightBlackColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {
                                BlocProvider.of<EditProfileCubit>(context)
                                    .changeDarkMood();
                                setState(() {
                                  isDarkModeSwitched = !isDarkModeSwitched;
                                });
                              },
                              icon: Icon(Icons.dark_mode, color: primaryColor),
                              label: Text("Dark Mode"),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      // =================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              navigateTo(context, PaymentScreen());
                            },
                            child: Text(
                              "add Payment",
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      item(height, "Payment Setting", Icons.payments_outlined,
                          items2),
                      SizedBox(height: 15),
                      // =================================
                      Row(
                        children: [
                          Text(
                            "Notifications",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: height / 18,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: lightBlackColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.notifications,
                                  color: primaryColor),
                              label: Text("Turn on Notifications"),
                            ),
                            Switch(
                              onChanged: (val) {
                                setState(() {
                                  isNotificationSwitched = val;
                                });
                              },
                              value: isNotificationSwitched,
                              activeColor: primaryColor,
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      // ========================================
                      Row(
                        children: [
                          Text(
                            "Settings",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      item(height, "Settings", Icons.settings, items2),
                      SizedBox(height: 15),

                      // ===================================
                      Row(
                        children: [
                          Text(
                            "Support",
                            style:
                                TextStyle(color: Colors.white38, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      item(height, "Help and support", Icons.help, items2),
                      SizedBox(height: 5),
                      item(height, "Terms and Conditions",
                          Icons.file_copy_rounded, items2),
                      SizedBox(height: 5),
                      item(height, "Privacy", Icons.privacy_tip_outlined,
                          items2),
                      SizedBox(height: 15),
                      // Column(
                      //   children: [
                      //     Container(
                      //         margin: EdgeInsets.only(
                      //             top: 25.0, right: 20, left: 20),
                      //         padding: EdgeInsets.symmetric(
                      //             vertical: 3.0, horizontal: 15.0),
                      //         decoration: BoxDecoration(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(32.0)),
                      //           color: lightBlackColor,
                      //           border: Border.all(
                      //               color: BlocProvider.of<EditProfileCubit>(
                      //                           context)
                      //                       .selectedPlayerError
                      //                   ? Colors.red
                      //                   : lightBlackColor),
                      //         ),
                      //         child: DropDownMenuWidgetEditProfile(
                      //           hint: 'Choose Player',
                      //           items:
                      //               BlocProvider.of<EditProfileCubit>(context)
                      //                   .players,
                      //           selectedValue:
                      //               BlocProvider.of<EditProfileCubit>(context)
                      //                   .selectedPlayer,
                      //           onChanged: (val) {
                      //             BlocProvider.of<EditProfileCubit>(context)
                      //                 .selectPlayer(val.toString());
                      //           },
                      //           icon: Icons.settings,
                      //         )),
                      //     Visibility(
                      //       visible: BlocProvider.of<EditProfileCubit>(context)
                      //           .selectedPlayerError,
                      //       child: Container(
                      //         margin: EdgeInsets.only(
                      //             top: 5.0, right: 20, left: 20),
                      //         padding: EdgeInsets.symmetric(
                      //             vertical: 3.0, horizontal: 15.0),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Please select a chosen player!",
                      //               style: TextStyle(color: Colors.red),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      items("Settings", Icons.settings),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          minimumSize: Size(width / 3.3, height / 19),
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () => showYesNoAlertDialog(
                            true,
                            context,
                            "Are you sure that you want to logout ?",
                            Icons.exit_to_app,
                            BlocProvider.of<EditProfileCubit>(context).logOut),
                        child: Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              )),
            );
          }),
    );
  }

  Widget boxCardItem(String txt, IconData icon) {
    return Container(
      height: 80,
      width: 125,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightBlackColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: primaryColor, size: 16),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Text(
              txt,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget items(
    String name,
    IconData icon,
  ) {
    return Column(
      children: [
        Container(
            // margin: EdgeInsets.only(
            //     top: 25.0, right: 20, left: 20),
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              color: lightBlackColor,
              border: Border.all(
                  color: BlocProvider.of<EditProfileCubit>(context)
                          .selectedPlayerError
                      ? Colors.red
                      : lightBlackColor),
            ),
            child: DropDownMenuWidgetEditProfile(
              hint: name,
              icon: icon,
              items: BlocProvider.of<EditProfileCubit>(context).players,
              selectedValue:
                  BlocProvider.of<EditProfileCubit>(context).selectedPlayer,
              onChanged: (val) {
                BlocProvider.of<EditProfileCubit>(context)
                    .selectPlayer(val.toString());
              },
            )),
        Visibility(
          visible:
              BlocProvider.of<EditProfileCubit>(context).selectedPlayerError,
          child: Container(
            margin: EdgeInsets.only(top: 5.0, right: 20, left: 20),
            padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Please select a chosen player!",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget item(double height, String txt, IconData icon, List<String> items) {
    return Container(
      height: height / 18,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightBlackColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(icon, color: primaryColor),
            label: Text(txt),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              elevation: 0,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget Ranking(int rankingID, String name, double ramkingNumber) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff242625),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      rankingID.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      radius: 20,
                      child: Image(
                        image: AssetImage(
                            "${assetImageBaseUrl}pexels-photo-2379004.png"),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            // textScaleFactor: 1.5,
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'Contributed',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ramkingNumber.toString(),
                                style: TextStyle(color: Color(0xFFAD6810)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(Icons.star, color: Colors.white),
              ])),
    );
  }

  Widget fansTalent(String name) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff242625),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              child: Image(
                image:
                    AssetImage("${assetImageBaseUrl}pexels-photo-2379004.png"),
              ),
            ),
            title: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
          )),
    );
  }

  Widget PersonalBalnce(String name, double number, IconData icon) {
    return Container(
      height: 100,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff242625),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: Color(0xFFAD6810),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromARGB(255, 234, 232, 232)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  number.toString(),
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
      ),
    );
  }

  Widget changePassword(
    double height,
    String txt,
    IconData icon,
  ) {
    return Container(
        height: height / 18,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: lightBlackColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );
              },
              icon: Icon(icon, color: primaryColor),
              label: Text(txt),
            ),
          ],
        ));
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Change password?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "This will change your password ",
            style: TextStyle(color: Colors.grey),
          ),
          // SizedBox(height: 10,),
          // Divider(thickness: 1,color: Colors.grey,),
          // SizedBox(height: 10,),
          // Text("Change password"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor, // تخصيص لون النص
          ),
          child: const Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor, // تخصيص لون النص
          ),
          child: const Text('ACCEPT'),
        ),
      ],
    );
  }

  Widget notification(height) {
    return Container(
      height: height / 18,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightBlackColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: primaryColor),
            label: Text("Turn on Notifications"),
          ),
          Switch(
            onChanged: (val) {},
            value: true,
            activeColor: primaryColor,
            activeTrackColor: Colors.white,
            // inactiveThumbColor: accentColor,
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
