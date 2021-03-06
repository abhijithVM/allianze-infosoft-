import 'package:allianze/views/auth/sign_up.dart';
import 'package:allianze/views/auth/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignInScreen(toggleView: toggleView);
    } else {
      return RegisterScreen(toggleView: toggleView);
    }
  }
}
