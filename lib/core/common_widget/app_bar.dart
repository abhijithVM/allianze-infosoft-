import 'package:allianze/views/auth/model/firebase_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context, {UserFirebaseModel? user}) => PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AppBar(
        title: Text("say Hi ${user?.userId} "),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close)),
      ),
    );
