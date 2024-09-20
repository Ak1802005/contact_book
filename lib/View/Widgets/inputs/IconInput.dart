// ignore: file_names
import 'package:flutter/material.dart';

class IconInput extends StatelessWidget {
  final String labelText;
  final String? errorText;
  final TextEditingController? controller;
  final String icons;

  const IconInput({
    super.key,
    required this.icons,
    required this.labelText,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 4,color: Colors.grey),borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: labelText,
              border: InputBorder.none,
              errorText: errorText,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(icons),
                  height: 20,
                  width: 20,
                ),
              ))),
    );
  }
}
