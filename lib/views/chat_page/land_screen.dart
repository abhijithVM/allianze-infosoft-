// ignore_for_file: prefer_const_constructors

import 'package:allianze/core/assets.dart';
import 'package:allianze/core/common_widget/authenticate.dart';
import 'package:allianze/core/common_widget/search_bar.dart';
import 'package:allianze/core/data_base/fire_baseapi.dart';
import 'package:allianze/core/services/auth.dart';
import 'package:allianze/views/chat_page/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LandScreen extends StatefulWidget {
  const LandScreen({Key? key}) : super(key: key);

  @override
  _LandScreenState createState() => _LandScreenState();
}

class _LandScreenState extends State<LandScreen> {
  @override
  void initState() {
    searchTrigger("a");
    super.initState();
  }

  void searchTrigger(String query) {
    _databaseMethod.getUserByName(query).then((val) {
      setState(() {
        searchedList = val;
      });
    });
  }

  initiateChatMethod(String userNmae) {
    List<String> users = [userNmae, "userNmae"];
    _databaseMethod.createChat(userNmae, "myName");
  }

  final AuthenticationMethod _authenticationMethod = AuthenticationMethod();
  final _controller = TextEditingController();
  final DataBaseMethods _databaseMethod = DataBaseMethods();
  QuerySnapshot? searchedList;
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
          elevation: 1,
          actions: [
            IconButton(
                onPressed: () {
                  _authenticationMethod.signOutAccount();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Authenticate()),
                      (Route<dynamic> route) => false);
                },
                icon: Icon(Icons.exit_to_app_rounded, color: Colors.black))
          ],
        ),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomAutoHideAppBarDelegate(
                child: _buildSearchWidget(),
              ),
            ),
            SliverToBoxAdapter(child: _searchedLIst()),
          ]),
        ));
  }

  Widget _searchedLIst() {
    return searchedList != null
        ? Column(
            children: List.generate(
                searchedList?.docs == null ? 0 : searchedList!.docs.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatScreen()));
                        },
                        trailing: Chip(
                            backgroundColor: Colors.green,
                            label: Text("say Hi",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold))),
                        leading: const CircleAvatar(
                          child: Image(
                            image: AssetImage(Assets.IMAGE),
                          ),
                        ),
                        title: Text("${searchedList!.docs[index]['name']}",
                            style: Theme.of(context).textTheme.button),
                      ),
                    )),
          )
        : SizedBox();
  }

  Widget _buildSearchWidget() {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          validator: (value) {
            if (value != null && value.isEmpty) {
              return "required";
            }
          },
          controller: _controller,
          maxLines: 1,
          onFieldSubmitted: (value) {
            FocusScope.of(context).unfocus();
            if (value.isNotEmpty) searchTrigger(value);
          },
          decoration: InputDecoration(
            isDense: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6.0),
              ),
            ),
            hintText: "search",
            hintStyle: const TextStyle(fontSize: 12),
            suffixIcon: Container(
              decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6))),
              child: IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_controller.text.isNotEmpty) {
                    searchTrigger(_controller.text);
                  }
                },
                icon: const Icon(Icons.search_rounded,
                    color: Colors.white, size: 34),
              ),
            ),
          ),
        ));
  }
}
