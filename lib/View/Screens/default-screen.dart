import 'package:firstforapp/Constants/colors.dart';
import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/View/Widgets/buttons/custom-btn2.dart';
import 'package:firstforapp/View/Widgets/buttons/custome-button.dart';
import 'package:firstforapp/View/Widgets/buttons/img-button.dart';
import 'package:firstforapp/View/Widgets/texts/common-text.dart';
import 'package:firstforapp/View/Widgets/texts/header.dart';
import 'package:flutter/material.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.re_LoBack,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Image.asset(StringConst.homeImg,width: 250,height: 250,),
              const SizedBox(height: 15),
              HeaderText(title: 'Welcome'),
              const SizedBox(height: 15),
              CommonText(text: 'Explore All Fields And Resources.'),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: 'Sign In', onPressed: () => Navigator.pushNamed(context, StringConst.registerRoute)),
                CustomButton(text: 'Log In', onPressed: () => Navigator.pushNamed(context, StringConst.loginRoute)),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
