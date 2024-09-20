
import 'package:firstforapp/Constants/text-style.dart';
import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
   Titles({super.key,required this.title});

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style: textStyle.header,);
  }
}
