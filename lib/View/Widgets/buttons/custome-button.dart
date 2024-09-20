
import 'package:firstforapp/Constants/colors.dart';
import 'package:flutter/cupertino.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({super.key,required this.text,required this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(onPressed: onPressed,color: ColorConst.textColor, child: Text(text) ),
    );
  }
}
