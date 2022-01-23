import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? color, textColor;
  final TextStyle? textStyle;

  const CommonButton({
    required this.label,
    Key? key,
    this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _buttonStyle,
      onPressed: onPressed,
      child: FittedBox(
        child: Text(
          label,
        ),
      ),
    );
  }

  ButtonStyle get _buttonStyle => ElevatedButton.styleFrom(
        onPrimary: textColor,
        textStyle: textStyle,
        primary: color,
        elevation: 2,
        minimumSize: const Size(double.infinity, 40),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );
}
