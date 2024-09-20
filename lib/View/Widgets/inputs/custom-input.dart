// ignore: file_names
import 'package:flutter/material.dart';

class CustomeInput extends StatelessWidget {
  final String labelText;
  final String? errorText;
  final TextEditingController? controller;

  const CustomeInput({
    super.key,
    required this.labelText,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          errorText: errorText,
        ));
  }
}
