abstract class ChatRoomsStates {}

class ChatRoomsStateInitial extends ChatRoomsStates {}

class GetChatRoomsState extends ChatRoomsStates {
  final chatRoomsList;
  GetChatRoomsState(this.chatRoomsList);
}

class ImagePickedState extends ChatRoomsStates {}
