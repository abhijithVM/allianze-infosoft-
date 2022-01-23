// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:allianze/core/common_widget/authenticate.dart';
import 'package:allianze/core/services/auth_shared_pref.dart';
import 'package:allianze/views/chat_page/land_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn = false;
  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'chat room',
        theme: ThemeData(
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          // scaffoldBackgroundColor: Colors.grey.shade200,
        ),
        home: userIsLoggedIn ? LandScreen() : Authenticate()

        // Authenticate(),
        );
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value ?? false;
      });
    });
  }
}
