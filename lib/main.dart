import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/Controller/RouteController/routec-controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteController.onGenerateRoute,
      initialRoute: StringConst.splashRoute,
    );
  }
}


