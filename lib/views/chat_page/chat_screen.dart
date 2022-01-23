import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String? storedUserName;
  const ChatScreen({Key? key, this.storedUserName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("$storedUserName"),
            ],
          ),
        ));
  }
}
