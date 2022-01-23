import 'package:allianze/core/common_widget/custom_button.dart';
import 'package:allianze/core/common_widget/input_filed.dart';
import 'package:allianze/core/data_base/fire_baseapi.dart';
import 'package:allianze/core/services/auth.dart';
import 'package:allianze/views/chat_page/land_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function? toggleView;
  const RegisterScreen({Key? key, this.toggleView}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _passControler = TextEditingController();
  final TextEditingController _confpassControler = TextEditingController();
  final TextEditingController _mailControler = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final DataBaseMethods _databaseMethod = DataBaseMethods();
  final AuthenticationMethod _authenticationMethod = AuthenticationMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register ")),
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
                          controller: _nameControler,
                          decoration: customInputDecoration(hint: "Enter Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return (' name required');
                            }
                            return null;
                          },
                        ),
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
                          decoration:
                              customInputDecoration(hint: "set password"),
                          validator: (value) {
                            return (value!.isEmpty || value.length < 6)
                                ? ('enter valid password')
                                : null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: _confpassControler,
                          decoration:
                              customInputDecoration(hint: "confirm password"),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return "enter valid password";
                            }
                            if (_passControler.text !=
                                _confpassControler.text) {
                              return "confirm password properly";
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
                                userRegister();
                                _formKey.currentState!.save();
                              }
                            },
                            label: "REGISTER"),
                      ],
                    )
                  : const Center(child: CupertinoActivityIndicator(radius: 66)),
            ),
          ),
        ),
      )),
    );
  }

  void userRegister() {
    if (_formKey.currentState!.validate()) {
      _authenticationMethod
          .signUpWithMailPassword(
              mail: _mailControler.text, passWord: _passControler.text)
          .then((value) {
        Map<String, String> userInfoMap = {
          "name": _nameControler.text,
          "email": _mailControler.text,
          "password": _passControler.text
        };
        _databaseMethod.uploadUserInfo(userInfoMap);
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
