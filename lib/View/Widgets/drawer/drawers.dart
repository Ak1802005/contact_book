import 'package:firstforapp/Constants/colors.dart';
import 'package:firstforapp/Constants/text-style.dart';
import 'package:firstforapp/View/Widgets/buttons/text-button.dart';
import 'package:flutter/material.dart';

extension Gap on num {
  Widget get vertical => SizedBox(height: toDouble());

  Widget get horizontal => SizedBox(width: toDouble());
}

class Drawers extends StatelessWidget {
  Drawers({
    super.key,
    required this.id,
    required this.name,
    required this.username,
    required this.heading,
    required this.email,
    required this.onTap,
  });

  String heading;
  int? id;
  String name;
  String username;
  String email;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: ColorConst.re_LoBack,
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        100.vertical,
        Center(child: Text(heading, style: textStyle.header)),
        25.2.vertical,
        Text('\tId : \n\t$id', style: textStyle.drawerStyle),
        15.vertical,
        Text('\tName : \n\t$name', style: textStyle.drawerStyle),
        15.vertical,
        Text('\tE-mail : \n\t$email', style: textStyle.drawerStyle),
        15.vertical,
        Text('\tUsername : \n\t$username', style: textStyle.drawerStyle),
        60.vertical,
        TextButtons(text: '\t\tLog Out', onTap: onTap)
      ],
    ));
  }
}
