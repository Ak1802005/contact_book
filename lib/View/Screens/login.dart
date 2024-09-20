import 'dart:convert';

import 'package:firstforapp/Constants/colors.dart';
import 'package:firstforapp/Controller/AuthController/auth-controller.dart';
import 'package:firstforapp/Model/credential.dart';
import 'package:firstforapp/View/Widgets/buttons/img-button.dart';
import 'package:firstforapp/View/Widgets/buttons/text-button.dart';
import 'package:firstforapp/View/Widgets/texts/common-text.dart';
import 'package:firstforapp/View/Widgets/texts/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Constants/strings.dart';
import '../Widgets/buttons/custome-button.dart';
import '../Widgets/inputs/custom-input.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: ColorConst.re_LoBack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              HeaderText(title: 'Log In'),
              const SizedBox(height: 15),
              Obx(() => CustomeInput(
                  labelText: 'Username',
                  controller: ctrl.usernameCtrl1,
                  errorText: ctrl.errUsername1.value)),
              const SizedBox(height: 15),
              Obx(() => CustomeInput(
                  labelText: 'Password',
                  controller: ctrl.pswdCtrl1,
                  errorText: ctrl.errPswd1.value)),
              const SizedBox(height: 20),
              TextButtons(
                  text: 'Forgot Password ?', onTap: () => print('Sorry!!')),
              const SizedBox(height: 20),
              CustomizeButton(
                text: 'Login',
                onPressed: () {
                  ctrl.login(context);
                  ctrl.usernameCtrl1.clear();
                  ctrl.pswdCtrl1.clear();
                },
              ),
              const SizedBox(height: 80),
              TextButtons(
                  text: 'Create An Account ?',
                  onTap: () => Navigator.pushReplacementNamed(
                      context, StringConst.registerRoute)),
              const SizedBox(height: 50),
              CommonText(text: 'Or Continues With'),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImgButtons(
                      onPressed: () => print("Google"),
                      iconpath: StringConst.google),
                  const SizedBox(width: 15),
                  ImgButtons(
                      onPressed: () => print("FaceBook"),
                      iconpath: StringConst.facebook),
                  const SizedBox(width: 15),
                  ImgButtons(
                      onPressed: () => print("Iphone"),
                      iconpath: StringConst.iphone),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
