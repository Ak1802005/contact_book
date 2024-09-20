
import 'package:firstforapp/Constants/text-style.dart';
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
   CommonText({super.key,required this.text});

  String text;
  @override
  Widget build(BuildContext context) {
    return  Text(text,style: textStyle.commonText);
  }
}
