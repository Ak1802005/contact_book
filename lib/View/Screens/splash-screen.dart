import 'package:firstforapp/Constants/colors.dart';
import 'package:firstforapp/View/Widgets/lotties/splashLottie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/strings.dart';
import '../../Controller/AuthController/auth-controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(AuthController());
    ctrl.currentUser().then((credential) {
      if (credential == null) {
        Navigator.pushReplacementNamed(context, StringConst.defaultRoute);
      } else {
        Navigator.pushReplacementNamed(context, StringConst.homeRoute);
      }
    });
    return const Scaffold(
      body: Center(child: SplashLottie()),
      backgroundColor: ColorConst.splashBackgorund,
    );
  }
}
