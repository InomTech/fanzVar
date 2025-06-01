import 'package:fanzhashem/modules/chat_rooms/cubit/cubit.dart';
import 'package:fanzhashem/modules/chat_rooms/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/buttons_widget.dart';
import 'package:fanzhashem/widgets/profile_image_widget.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/chat_rooms/chat_message_model.dart';
import '../../models/chat_rooms/chat_user_model.dart';
import 'chat_room_screen.dart';

class CreateNewRoomScreen extends StatefulWidget {
  const CreateNewRoomScreen({super.key});

  @override
  _CreateNewRoomScreenState createState() => _CreateNewRoomScreenState();
}


var chatRoomsList = [];
var members;
var messages;

class _CreateNewRoomScreenState extends State<CreateNewRoomScreen> {
  var roomNameController = TextEditingController();
  var roomCategoryController = TextEditingController();
  var roomDescController = TextEditingController();
  final createRoomFormKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider<ChatRoomsCubit>(
      create: (context) => ChatRoomsCubit()..getChatRoomsFun(),
      child: BlocConsumer<ChatRoomsCubit, ChatRoomsStates>(
          listener: (context, state) {
        if (state is GetChatRoomsState) {
          chatRoomsList = state.chatRoomsList;
          members = chatRoomsList[0]["members"]
              .map((e) => ChatUserModel.fromJson(e))
              .toList();
          messages = chatRoomsList[0]["messages"]
              .map((e) => ChatMessageModel.fromJson(e))
              .toList();
        }
      }, builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text("Create Chat Room"),
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
          body: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              child: Form(
                  key: createRoomFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileImageWidget(
                        cubit: BlocProvider.of<ChatRoomsCubit>(context),
                        onPressed: () {
                          BlocProvider.of<ChatRoomsCubit>(context).pickImage();
                        },
                        isChat: true,
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: height / 15,
                        width: width / 1.2,
                        decoration: BoxDecoration(
                          color: lightBlackColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 0, bottom: 0),
                          child: TextFormField(
                            controller: roomNameController,
                            decoration: InputDecoration(
                              hintText: "Chat Room Subject",
                              hintStyle: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: const EdgeInsets.all(14),
                              // prefixIcon: Icon(Icons.title, color: primaryColor),
                            ),
                          ),
                        ),
                      ),

                      ///////////////////////////////////////////////////
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0, right: 10, left: 10),
                      //   child: TxtField(
                      //     controller: projectNameController,
                      //     hintText: "Project Name",
                      //     validator: (value) {
                      //       if (value.toString().isEmpty || value == null) {
                      //         return 'Please enter Project Name!';
                      //       }
                      //     },
                      //     prefixIcon: Icons.title,
                      //     colorPrefixIcon: primaryColor,
                      //     keyboardType: TextInputType.text,
                      //     onChanged: (String str) {},
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0, right: 10, left: 10),
                      //   child: TxtField(
                      //     controller: projectCategoryController,
                      //     hintText: "Project Category",
                      //     validator: (value) {
                      //       if (value.toString().isEmpty || value == null) {
                      //         return 'Please enter Project Category!';
                      //       }
                      //     },
                      //     prefixIcon: Icons.category,
                      //     colorPrefixIcon: primaryColor,
                      //     keyboardType: TextInputType.text,
                      //     onChanged: (String str) {},
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 15.0, right: 10, left: 10),
                      //   child: TxtField(
                      //     controller: projectDescController,
                      //     hintText: "Project Description",
                      //     // maxLines: 4,
                      //     validator: (value) {
                      //       if (value.toString().isEmpty || value == null) {
                      //         return 'Please enter Project Category!';
                      //       }
                      //     },
                      //     prefixIcon: Icons.description_outlined,
                      //     colorPrefixIcon: primaryColor,
                      //     keyboardType: TextInputType.text,
                      //     onChanged: (String str) {},
                      //   ),
                      // ),

                      SizedBox(height: 20),

                      /// ================== Submit BTN ============================

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TxtButton(
                            color: primaryColor,
                            text: "Submit",
                            txtSize: 16,
                            // text: "Submit".toUpperCase(),
                            horizontalPadding: 40,
                            verticalPadding: 10,
                            onPressed: () => //{},
                                navigateTo(
                              context,
                              ChatRoomDetailsScreen(
                                members: members.cast<ChatUserModel>(),
                                messages: messages.cast<ChatMessageModel>(),
                                chatRoom: {
                                  "chat_room_title": roomNameController.text
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }
}
