
import 'package:firstforapp/Constants/text-style.dart';
import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
   const TextButtons({super.key,required this.text,required this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(text,style: textStyle.title.copyWith(color: Color(0xFF121481))),
    );
  }
}
