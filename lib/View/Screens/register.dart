import 'package:firstforapp/Constants/colors.dart';
import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/Controller/AuthController/auth-controller.dart';
import 'package:firstforapp/Model/credential.dart';
import 'package:firstforapp/View/Widgets/buttons/custome-button.dart';
import 'package:firstforapp/View/Widgets/buttons/text-button.dart';
import 'package:firstforapp/View/Widgets/inputs/custom-input.dart';
import 'package:firstforapp/View/Widgets/texts/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Widgets/buttons/img-button.dart';
import '../Widgets/texts/common-text.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(AuthController());
    return Scaffold(
      backgroundColor: ColorConst.re_LoBack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
              HeaderText(title: 'Sign Up'),
              const SizedBox(height: 15),
              Obx(() => CustomeInput(
                  labelText: 'Full Name',
                  controller: ctrl.nameCtrl,
                  errorText: ctrl.errName.value)),
              const SizedBox(height: 15),
              Obx(() => CustomeInput(
                  labelText: 'E-mail',
                  controller: ctrl.emailCtrl,
                  errorText: ctrl.errEmail.value)),
              const SizedBox(height: 15),
              Obx(() => CustomeInput(
                  labelText: 'Username',
                  controller: ctrl.usernameCtrl,
                  errorText: ctrl.errUsername.value)),
              const SizedBox(height: 15),
              Obx(() => CustomeInput(
                  labelText: 'Password',
                  controller: ctrl.pswdCtrl,
                  errorText: ctrl.errPswd.value)),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonText(text: 'Already Have an Account ?'),
                  const SizedBox(width: 5),
                  TextButtons(
                      text: 'Login Here',
                      onTap: () =>
                          Navigator.pushNamed(context, StringConst.loginRoute))
                ],
              ),
              const SizedBox(height: 20),
              CustomizeButton(
                text: 'Register',
                onPressed: () {
                  ctrl.registe(
                      context,
                      Credential(
                          name: ctrl.nameCtrl.text.trim(),
                          email: ctrl.emailCtrl.text.trim(),
                          username: ctrl.usernameCtrl.text.trim(),
                          password: ctrl.pswdCtrl.text.trim()));
                },
              ),
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
