import 'dart:convert';
import 'dart:io';

import 'package:fanzhashem/modules/chat_rooms/cubit/states.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ChatRoomsCubit extends Cubit<ChatRoomsStates> {
  ChatRoomsCubit() : super(ChatRoomsStateInitial());

  

  static ChatRoomsCubit get(context) => BlocProvider.of(context);

  var imageFile;

  /// ====================== get ChatRooms Fun ===================
  getChatRoomsFun() async {
    /// get chatRooms  from JSON FILE
    String chatRoomsdata =
        await rootBundle.loadString('assets/json/chat_rooms.json');

    List chatRoomsList = json.decode(chatRoomsdata)["ChatRooms"];
    emit(GetChatRoomsState(chatRoomsList));
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
    emit(ImagePickedState());
  }
}
