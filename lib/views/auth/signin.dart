import 'package:allianze/core/common_widget/custom_button.dart';
import 'package:allianze/core/common_widget/input_filed.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _passControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("welcome")),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 50,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextFormField(
                    controller: _nameControler,
                    decoration: customInputDecoration(hint: "user name"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return ('required');
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passControler,
                    decoration: customInputDecoration(hint: "password"),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return ('required');
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  CommonButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (!_formKey.currentState!.validate()) {
                          return;
                        } else if (_formKey.currentState!.validate()) {
                          // userSignIn();
                          _formKey.currentState!.save();
                        }
                      },
                      label: "Sign In"),
                  CommonButton(
                    onPressed: () {},
                    label: "Create New Account",
                    color: Colors.blueGrey.shade600,
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
