// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  getUserByName(String name) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: name)
        .get();
  }

  getUserByMail(String mail) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: mail)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }

  createChat(String chat_roomID, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chat")
        .doc(chat_roomID)
        .set(chatRoomMap);
  }

  getAllRegisteredUser() async {
    return await FirebaseFirestore.instance.collection("users").get();
  }
}
