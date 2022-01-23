import 'package:allianze/core/assets.dart';
import 'package:allianze/views/chat_page/chat_screen.dart';
import 'package:flutter/material.dart';

class LandScreen extends StatefulWidget {
  const LandScreen({Key? key}) : super(key: key);

  @override
  _LandScreenState createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.message_outlined, color: Colors.blue),
          title: const Text(
            "Chat room",
            style: TextStyle(color: Colors.blue),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: List.generate(
                12,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatScreen()));
                        },
                        trailing: Container(
                          child: const Icon(Icons.radio_button_checked,
                              color: Colors.green),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                        ),
                        leading: const CircleAvatar(
                          child: Image(
                            image: AssetImage(Assets.IMAGE),
                          ),
                        ),
                        title: Text("Abhijith ",
                            style: Theme.of(context).textTheme.button),
                      ),
                    )),
          )),
        ));
  }
}
