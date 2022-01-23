import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  getUserByName(String name) async {
 return   await FirebaseFirestore.instance
        .collection("users")
        .where("name", isEqualTo: name).get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("users").add(userMap);
  }
}
