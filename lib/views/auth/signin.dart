import 'package:allianze/core/common_widget/custom_button.dart';
import 'package:allianze/core/common_widget/input_filed.dart';
import 'package:allianze/core/services/auth.dart';
import 'package:allianze/views/auth/sign_up.dart';
import 'package:allianze/views/chat_page/land_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final Function? toggleView;
  const SignInScreen({Key? key, this.toggleView}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passControler = TextEditingController();
  final TextEditingController _mailControler = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final AuthenticationMethod _authenticationMethod = AuthenticationMethod();
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
              child: !_isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: _mailControler,
                          decoration: customInputDecoration(hint: "email ID"),
                          validator: (val) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = RegExp(pattern);
                            return !regex.hasMatch(val ?? "") || val!.isEmpty
                                ? "enter valid mail ID"
                                : null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: _passControler,
                          decoration: customInputDecoration(hint: "password"),
                          validator: (value) {
                            return (value!.isEmpty || value.length < 6)
                                ? ('enter valid password')
                                : null;
                          },
                        ),
                        const SizedBox(height: 30),
                        CommonButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (!_formKey.currentState!.validate()) {
                                return;
                              } else if (_formKey.currentState!.validate()) {
                                userSignIn();
                                _formKey.currentState!.save();
                              }
                            },
                            label: "Sign In"),
                        CommonButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(
                                        toggleView: null)));
                          },
                          label: "Create New Account",
                          color: Colors.blueGrey.shade600,
                        )
                      ],
                    )
                  : const Center(child: CupertinoActivityIndicator(radius: 66)),
            ),
          ),
        ),
      )),
    );
  }

  void userSignIn() {
    if (_formKey.currentState!.validate()) {
      _authenticationMethod
          .signInWithMailPassword(
              mail: _mailControler.text, passWord: _passControler.text)
          .then((value) {
        debugPrint("signIn screen $value");
        widget.toggleView ?? () {};
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LandScreen()),
            (Route<dynamic> route) => false);
      });
      setState(() {
        _isLoading = true;
      });
    }
  }
}
