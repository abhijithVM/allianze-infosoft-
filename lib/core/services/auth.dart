import 'package:allianze/views/auth/model/firebase_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserFirebaseModel _userFromFireBaseModel(User user) {
    return UserFirebaseModel(user.uid);
  }

//  log in

  Future signInWithMailPassword(
      {required String mail, required String passWord}) async {
    try {
      UserCredential _result = await _auth.signInWithEmailAndPassword(
          email: mail, password: passWord);
      User? _fireBaseUser = _result.user;
      return _userFromFireBaseModel(_fireBaseUser!);
    } catch (e) {
      debugPrint(e.toString() + " log-in authentication erorr");
    }
  }

// sign up

  Future signUpWithMailPassword(
      {required String mail, required String passWord}) async {
    try {
      UserCredential _result = await _auth.createUserWithEmailAndPassword(
          email: mail, password: passWord);
      User? _fireBaseUser = _result.user;
      return _userFromFireBaseModel(_fireBaseUser!);
    } catch (e) {
      debugPrint(e.toString() + " sign-Up erorr");
    }
  }

  // forgot password

  Future forgotPassword({required String mail}) async {
    try {
      return await _auth.sendPasswordResetEmail(email: mail);
    } catch (e) {
      debugPrint(e.toString() + " authentication erorr");
    }
  }

// sign out
  Future signOutAccount() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint(e.toString() + " authentication erorr");
    }
  }
}
