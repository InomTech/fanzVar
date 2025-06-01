

// ignore_for_file: deprecated_member_use

import 'package:fanzhashem/models/chat_rooms/chat_message_model.dart';
import 'package:fanzhashem/models/chat_rooms/chat_user_model.dart';
import 'package:fanzhashem/modules/chat_rooms/chat_room_screen.dart';
import 'package:fanzhashem/modules/chat_rooms/create_new_room_screen.dart';
import 'package:fanzhashem/modules/chat_rooms/cubit/states.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';

var chatRoomsList = [];

class ChatRoomsScreen extends StatefulWidget {
  const ChatRoomsScreen({super.key});

  @override
  State<ChatRoomsScreen> createState() => _ChatRoomsScreenState();
}

class _ChatRoomsScreenState extends State<ChatRoomsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return BlocProvider(
        create: (BuildContext context) => ChatRoomsCubit()..getChatRoomsFun(),
        child: BlocConsumer<ChatRoomsCubit, ChatRoomsStates>(
            listener: (context, state) async {
          if (state is GetChatRoomsState) {
            chatRoomsList = state.chatRoomsList;
          }
        }, builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            floatingActionButton: Table(
                defaultColumnWidth: FractionColumnWidth(.36),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    Text(""),
                    chatRoomCustomBtn(
                      txt: 'Create room',
                      btnFunction: () {
                        navigateTo(context, CreateNewRoomScreen());
                      },
                    ),
                    Text(""),
                  ]),
                ]),
            appBar: AppBar(
              title: Text("Chat Rooms"),
              centerTitle: true,
              backgroundColor: lightBlackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () => Navigator.of(context).pop(context),
              ),
            ),
            backgroundColor: Colors.grey,
            body: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Stack(
                    fit: StackFit.expand,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: chatRoomsList.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (BuildContext ctx, int index) {
                            return Padding(
                              // padding: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.only(
                                  left: 3.0, right: 3, top: 8, bottom: 8),
                              child: chatRoomWidget(
                                  chatRoom: chatRoomsList[index],
                                  height: height,
                                  width: width),
                            );
                          },
                        ),
                      ),
                      buildFloatingSearchBar(context),
                    ],
                  ),
                  // child: ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: chatRoomsList.length,
                  //   physics: BouncingScrollPhysics(),
                  //   itemBuilder: (BuildContext ctx, int index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: chatRoomWidget(
                  //           chatRoom: chatRoomsList[index],
                  //           height: height,
                  //           width: width),
                  //     );
                  //   },
                  // ),
                ),
              ),
            ),
          );
        }));
  }

  Widget chatRoomWidget(
      {required chatRoom, required double height, required double width}) {
    var members =
        chatRoom["members"].map((e) => ChatUserModel.fromJson(e)).toList();
    var messages =
        chatRoom["messages"].map((e) => ChatMessageModel.fromJson(e)).toList();

    return InkWell(
      onTap: () => navigateTo(
        context,
        ChatRoomDetailsScreen(
          members: members.cast<ChatUserModel>(),
          messages: messages.cast<ChatMessageModel>(),
          chatRoom: chatRoom,
        ),
      ),
      child: Container(
        height: height / 6,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: lightBlackColor,
          border: Border.all(color: Color(0xFF424242)),
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                chatRoom["chat_room_avatar"] ??
                    "https://upload.wikimedia.org/wikipedia/en/d/d5/CAF_Champions_League.png",
              ),
            ),
            SizedBox(width: 12),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width / 2.6,
                  child: Text(
                    chatRoom["chat_room_title"] ?? "Chat room name",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "${chatRoom['total_members']} Members",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                joinBtn(
                  txt: chatRoom["status"] == "Joined" ? 'Joined' : 'Join',
                  isJoined: chatRoom["status"] == "Joined" ? true : false,
                  btnFunction: () {
                    print(chatRoom["status"]);

                    setState(() {
                      if (chatRoom["status"] == "Joined") {
                        chatRoom["status"] = 'join';
                        showToast(msg: 'unjoin Successfully');
                      } else {
                        chatRoom["status"] = 'Joined';
                        print(chatRoom["status"]);
                        showToast(msg: 'joined Successfully');
                      }
                    });
                  },
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: width / 3.3,
                  child: Text(
                    "Created ${chatRoom['created_date']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ========================= Chat Room Button =========================
  Widget chatRoomCustomBtn({
    required String txt,
    required Function btnFunction,
  }) {
    return Container(
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
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
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        onPressed: () {
          btnFunction();
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }

  /// ========================= Join Button =========================
  Widget joinBtn({
    required String txt,
    required Function btnFunction,
    required bool isJoined,
  }) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.21],
          colors: isJoined == true
              ? [
                  Colors.grey.withOpacity(0.5),
                  Colors.grey.withOpacity(0.2),
                ]
              : [
                  Color(0xD9F9F9F9),
                  Color(0xffCDA250),
                ],
        ),
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () => {
          btnFunction(),

          // setState(() {
          //   isJoined = !isJoined;
          // }),
          // showToast(msg: 'joined Successfully')
        },
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
