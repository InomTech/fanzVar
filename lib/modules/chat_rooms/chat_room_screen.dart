import 'package:fanzhashem/models/chat_rooms/chat_message_model.dart';
import 'package:fanzhashem/models/chat_rooms/chat_user_model.dart';
import 'package:fanzhashem/modules/fan_profile/fan_profile_screen.dart';
import 'package:fanzhashem/utilities/colors.dart';
import 'package:fanzhashem/utilities/constants.dart';
import 'package:fanzhashem/widgets/shared_widget.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:share_plus/share_plus.dart';

class ChatRoomDetailsScreen extends StatefulWidget {
  final chatRoom;

  //  members, messages;
  final List<ChatUserModel> members;
  final List<ChatMessageModel> messages;

  const ChatRoomDetailsScreen(
      {required this.members,
      required this.messages,
      required this.chatRoom,
      super.key});

  @override
  State<ChatRoomDetailsScreen> createState() => _ChatRoomDetailsScreenState();
}

class _ChatRoomDetailsScreenState extends State<ChatRoomDetailsScreen> {
  var msgController = TextEditingController();
  // bool emojiShowing = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // _onEmojiSelected(Emoji emoji) {
    //   msgController
    //     ..text += emoji.emoji
    //     ..selection = TextSelection.fromPosition(
    //         TextPosition(offset: msgController.text.length));
    // }

    // _onBackspacePressed() {
    //   setState(() {
    //     emojiShowing = false;
    //   });
    //   msgController
    //     ..text = msgController.text.characters.skipLast(1).toString()
    //     ..selection = TextSelection.fromPosition(
    //         TextPosition(offset: msgController.text.length));
    // }

    return Scaffold(
      // appBar: appBar(_scaffoldKey, widget.chatRoom["chat_room_title"], context,
      // isShowChatOnlineUsers: true),
      // appBar: AppBar(
      //   title: Text(widget.chatRoom["chat_room_title"].toString()),
      //   centerTitle: true,

      // ),
      appBar: AppBar(
        title: Text(widget.chatRoom["chat_room_title"]),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // String img = widget.chatRoom["chat_room_avatar"];
            //  Share.share(widget.chatRoom["chat_room_title"]);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Stack(
            children: <Widget>[
              /// ===================== Messages List =======================
              SizedBox(
                height: height / 1.28,
                child: ListView.builder(
                  itemCount: widget.messages.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return MessageBubble(
                      text: widget.messages[index].messageContent,
                      img: widget.messages[index].senderAvatar,
                      isMe: widget.messages[index].isMe,
                      msgDate: widget.messages[index].messageDate,
                      msgTime: widget.messages[index].messageTime,
                      status: widget.messages[index].senderStatus,
                      senderName: widget.messages[index].senderName,
                      msgID: widget.messages[index].messageId,
                    );
                  },
                  reverse: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                ),
              ),

              /// ================= Send Msg Section =========================
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF202020),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 10),
                      // if (currentUser.image != null)
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.transparent,
                        // backgroundImage: NetworkImage(currentUser.image),
                        child: Image.asset(
                          '${assetImageBaseUrl}Group 10400.png',
                          // width: 40,
                          // height: 40,
                        ),
                      ),
                      // if (currentUser.image == null)
                      //   CircleAvatar(
                      //     radius: 15,
                      //     backgroundColor: Colors.black87,
                      //     child: Icon(
                      //       Icons.person,
                      //       color: primaryColor,
                      //     ),
                      //   ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Write your message",
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.mic,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          onPressed: () {
                            // setState(() {
                            //   emojiShowing = !emojiShowing;
                            // });
                          },
                          icon: Icon(
                            Icons.tag_faces,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        padding: EdgeInsets.zero,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        constraints: BoxConstraints(),
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),

              ///==============================================================
            ],
          ),
        ),
      ),
    );
  }
}

// ========================================================

class MessageBubble extends StatelessWidget {
  const MessageBubble(
      {super.key,
      required this.text,
      required this.msgTime,
      required this.msgDate,
      required this.msgID,
      required this.isMe,
      required this.status,
      required this.img,
      required this.senderName});

  final String text;
  final String img;
  final bool isMe;
  final String status;
  final String msgTime;
  final String msgDate;
  final String msgID;
  final String senderName;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String senderImg;
    if (msgID == "1") senderImg = "Group 10398.png";
    if (msgID == "3") senderImg = "Group 10399.png";
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          /// ====================== Message Date ==========================
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              msgDate,
              style: const TextStyle(color: Colors.white60),
            ),
          ),
          const SizedBox(height: 5),

          /// ==================  user Img & Msg Content ===================
          Row(
            mainAxisAlignment:
                isMe == true ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              /// ===================== Sender Img ========================
              Visibility(
                visible: isMe != true ? true : false,
                child: InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      FanProfileScreen(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0, bottom: 33),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.transparent,
                          // backgroundImage: NetworkImage(img),
                        ),
                        Visibility(
                          visible: status == "Available" ? true : false,
                          child: const CircleAvatar(
                              radius: 5, backgroundColor: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// ==================== Message Content =====================
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    /// ============== Sender Name ================
                    Container(
                      child: Text(
                        isMe
                            ? 'You'
                            : senderName.length > 18
                                ? '${senderName.substring(0, 18)}...'
                                : senderName,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                        textDirection:
                            RegExp("[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]")
                                        .hasMatch(senderName.trim()) ==
                                    true
                                ? TextDirection.rtl
                                : TextDirection.ltr,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      decoration: BoxDecoration(
                        color: isMe ? darkBlackColor : lightBlackColor,
                        border: Border.all(
                          color: isMe == true
                              // ignore: deprecated_member_use
                              ? primaryColor.withOpacity(0.33)
                              : Color(0xFF424242),
                        ),
                        borderRadius: isMe
                            ? BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0))
                            : BorderRadius.only(
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          text,
                          textDirection:
                              RegExp("[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]")
                                          .hasMatch(text.trim()) ==
                                      true
                                  ? TextDirection.rtl
                                  : TextDirection.ltr,
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * .038,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// ==================== Current User Img ====================
              Visibility(
                visible: isMe,
                child: InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      FanProfileScreen(),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, bottom: 33),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.transparent,
                          // backgroundImage: NetworkImage(currentUser.image),
                          child: Image.asset(
                            '${assetImageBaseUrl}Group 10400.png',
                            // width: 40,
                            // height: 40,
                          ),
                        ),
                        Visibility(
                          visible: status == "Available" ? true : false,
                          child: const CircleAvatar(
                              radius: 5, backgroundColor: Colors.green),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// ======================= Message Time ==========================
          // Align(
          //   alignment: isMe ? Alignment.bottomCenter : Alignment.bottomCenter,
          //   child: Text(
          //     msgTime,
          //     style: const TextStyle(color: Colors.white60),
          //   ),
          // ),
        ],
      ),
    );
  }
}
