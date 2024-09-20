import 'package:flutter/material.dart';

class AppBarButtons extends StatelessWidget {
  AppBarButtons({super.key,required this.onPressed,required this.iconpath});

  String iconpath;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Image(image: AssetImage(iconpath),height: 30,width: 30));
  }
}