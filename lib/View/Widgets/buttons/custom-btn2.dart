import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      color: ColorConst.textColor,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: Text(text),
    );
  }
}
