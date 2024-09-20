
import 'package:firstforapp/Constants/text-style.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
   HeaderText({super.key,required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style: textStyle.header,);
  }
}

