import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/View/Screens/dail-screen.dart';
import 'package:firstforapp/View/Screens/default-screen.dart';
import 'package:firstforapp/View/Screens/home-screen.dart';
import 'package:firstforapp/View/Screens/login.dart';
import 'package:firstforapp/View/Screens/register.dart';
import 'package:firstforapp/View/Screens/splash-screen.dart';
import 'package:flutter/material.dart';

class RouteController{
  static Route? onGenerateRoute(RouteSettings settings) {
    switch(settings.name){

      case StringConst.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case StringConst.defaultRoute:
        return MaterialPageRoute(builder: (context) => const DefaultScreen());
      case StringConst.loginRoute:
        return MaterialPageRoute(builder: (context) => const LogIn());
      case StringConst.registerRoute:
        return MaterialPageRoute(builder: (context) => const Register());
      case StringConst.homeRoute:
        return MaterialPageRoute(builder: (context) =>  HomeScreen());
    }
    return null;
  }
}