
import 'package:firstforapp/Constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashLottie extends StatelessWidget {
  const SplashLottie({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(StringConst.splashLottieAssetPath);
  }
}
