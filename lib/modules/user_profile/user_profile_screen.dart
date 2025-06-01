import 'package:fanzhashem/modules/user_profile/cubit/cubit.dart';
import 'package:fanzhashem/modules/user_profile/edit_profile_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utilities/shared_pref.dart';
import '../../widgets/profile_image_widget.dart';
import 'cubit/states.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveIsProfileOrNo(true);
  }

  @override
  void dispose() {
    saveIsProfileOrNo(false);

    super.dispose();
  }

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
              backgroundColor: darkBlackColor,
              appBar: AppBar(
                title: Text("Ahmed Seroug"),
                centerTitle: true,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProfileImageWidget(
                              cubit: BlocProvider.of<EditProfileCubit>(context),
                              onPressed: () {
                                BlocProvider.of<EditProfileCubit>(context)
                                    .pickImage();
                              }),
                        ],
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   height: height / 6,
                      //   color: Colors.red,
                      //   child: Image.asset(
                      //     '${assetImageBaseUrl}profile1.PNG',
                      //     height: height / 12,
                      //     width: double.infinity,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      Text(
                        "@ahmed Seroug1234",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Egypt",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 14,
                        ),
                      ),
                      Divider(color: Colors.brown[600]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "15.7 K",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    color: Colors.white38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "100 K",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    color: Colors.white38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showAlertDialog(
                                      true,
                                      context,
                                      "5000 points Reward Fifty pounds ",
                                      "Explore Stores",
                                      Icons.account_balance_wallet_outlined,
                                      'reward');
                                },
                                child: Text(
                                  "5K Points",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Earned Points ",
                                style: TextStyle(
                                    color: Colors.white38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              minimumSize: Size(width / 3.3, height / 19),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () {
                              navigateTo(context, EditProfileScreen());
                            },
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              minimumSize: Size(width / 2, height / 19),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () {
                              showAlertDialog(
                                  true,
                                  context,
                                  "Are you sure To upgrade to Be Retails ",
                                  "Confirm",
                                  Icons.add_alert_outlined,
                                  'Retails');
                            },
                            child: Text(
                              "Upgrade To be retail",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "لا شيء يدوم الى الابد",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "Teacher🧑‍👨‍🏫🤝❤️ ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        "الاهلى وبس",
                        style: TextStyle(color: Colors.white70),
                      ),
                      Divider(color: Colors.brown[600]),
                      Row(children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.black38,
                          child: Image.asset(
                              "${assetImageBaseUrl}458full-al-ahly-sc.png"),
                        ),
                        SizedBox(width: 10),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                            child: CircleAvatar(
                              backgroundColor: Colors.black38,
                              radius: 20,
                              child: Image.asset(
                                  "${assetImageBaseUrl}liverpool.png"),
                            )),
                        SizedBox(width: 10),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                            child: CircleAvatar(
                              backgroundColor: Colors.black38,
                              radius: 20,
                              child: Image.asset(
                                  "${assetImageBaseUrl}realMadred.png"),
                            )),
                        SizedBox(width: 10),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 2,
                                )),
                            child: CircleAvatar(
                              backgroundColor: Colors.black38,
                              radius: 20,
                              child:
                                  Image.asset("${assetImageBaseUrl}manch.png"),
                            )),
                        SizedBox(width: 10),
                      ]),
                      Divider(color: Colors.brown[600]),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          Text(
                            "Post",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 15),
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset("${assetImageBaseUrl}manch.png"),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 40,
                              margin: EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: lightBlackColor,
                              ),
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 0.2,
                                  ),
                                  // maxLines: 2,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '    Write a post',
                                      hintStyle: TextStyle(fontSize: 15)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(color: Colors.brown[600]),
                      Row(
                        children: [
                          Container(
                            width: width / 3,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.brown,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.edit,
                                  size: 15, color: primaryColor),
                              label: Text(
                                "Status",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ),
                          Container(
                            width: width / 3,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.brown,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.home,
                                  size: 15, color: primaryColor),
                              label: Text(
                                "Status",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 3,
                            height: 30,
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.photo,
                                  size: 15, color: primaryColor),
                              label: Text(
                                "Status",
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: height / 19,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            bool isSelected = selectedIndex == index;
                            late String txt;
                            if (index == 0) txt = "Rooms";
                            if (index == 1) txt = "Posts";
                            if (index == 2) txt = "Photos";
                            return Padding(
                              padding: index == 2
                                  ? const EdgeInsets.only(right: 0.0)
                                  : const EdgeInsets.only(right: 8.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  minimumSize: Size(width / 3.3, height / 19),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0),
                                  backgroundColor: isSelected
                                      ? primaryColor
                                      : lightBlackColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Text(
                                  txt,
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 17),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            width: width / 2.1,
                            height: height / 5.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: lightBlackColor),
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        "https://th.bing.com/th/id/R.f0590356b4621991d53ffec4b226864d?rik=6LpnAH5bRU2FDQ&pid=ImgRaw&r=0"),
                                  ),
                                  title: Text("قعده كوره"),
                                ),
                                ListTile(
                                  title: Text(
                                    "1.5K Members",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white38),
                                  ),
                                  subtitle: Text(
                                    "created 01/4/2022",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white38),
                                  ),
                                  trailing: Container(
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.0, 0.21],
                                        colors: [
                                          Color(0xD9F9F9F9),
                                          Color(0xffCDA250),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: InkWell(
                                          onTap: () {
                                            EditProfileCubit.get(context)
                                                .joining();
                                          },
                                          child: EditProfileCubit.get(context)
                                                  .join
                                              ? Text(
                                                  "Joined",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : Text(
                                                  "Join",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            width: width / 2.1,
                            height: height / 5.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: lightBlackColor),
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        "https://cdnuploads.aa.com.tr/uploads/Contents/2016/09/21/thumbs_b_c_c76cdc99b29e191518966ce61696db99.jpg"),
                                  ),
                                  title: Text("ابطال افريقيا"),
                                ),
                                ListTile(
                                  title: Text(
                                    "1.5K Members",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white38),
                                  ),
                                  subtitle: Text(
                                    "created 01/4/2022",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white38),
                                  ),
                                  trailing: Container(
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15.0),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops: [0.0, 0.21],
                                        colors: [
                                          Color(0xD9F9F9F9),
                                          Color(0xffCDA250),
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: InkWell(
                                        onTap: () {
                                          EditProfileCubit.get(context)
                                              .joining2();
                                        },
                                        child:
                                            EditProfileCubit.get(context).join2
                                                ? Text(
                                                    "Joined",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : Text(
                                                    "Join",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
