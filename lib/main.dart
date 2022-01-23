// ignore_for_file: must_be_immutable

import 'package:allianze/core/common_widget/authenticate.dart';
import 'package:allianze/views/auth/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const Authenticate(),
    );
  }
}
