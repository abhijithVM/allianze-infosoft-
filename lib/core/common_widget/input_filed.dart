import 'package:flutter/material.dart';

class CustomInputTextFiled extends StatelessWidget {
  const CustomInputTextFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (v) {},
    );
  }
}

InputDecoration customInputDecoration({
  required String hint,
}) =>
    InputDecoration(
        hintText: hint,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)));
