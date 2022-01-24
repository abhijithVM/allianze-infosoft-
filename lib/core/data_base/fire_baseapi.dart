// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  Future<void> addMessage(String chatRoomId, chatMessageData) async {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      debugPrint(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
