import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/Constants/text-style.dart';
import 'package:firstforapp/Controller/Database/database-controller.dart';
import 'package:firstforapp/Controller/local-storage/local-storage.dart';
import 'package:firstforapp/Model/addCredential.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/credential.dart';

class AuthController extends GetxController {
  Credential? user;
  LocalStorage? storage;
  DatabaseController? _databaseController;
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final pswdCtrl = TextEditingController();
  final usernameCtrl1 = TextEditingController();
  final pswdCtrl1 = TextEditingController();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final numberCtrl = TextEditingController();
  final addEmailCtrl = TextEditingController();
  final relationCtrl = TextEditingController();
  final workCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final linkCtrl = TextEditingController();
  var errName = Rx<String?>(null);
  var errEmail = Rx<String?>(null);
  var errUsername = Rx<String?>(null);
  var errPswd = Rx<String?>(null);
  var errUsername1 = Rx<String?>(null);
  var errPswd1 = Rx<String?>(null);
  var errfirstName = Rx<String?>(null);
  var errAddEmail = Rx<String?>(null);
  var errlastName = Rx<String?>(null);
  var errNumber = Rx<String?>(null);
  var errRelation = Rx<String?>(null);
  var errWork = Rx<String?>(null);
  var errAddress = Rx<String?>(null);
  var errLinks = Rx<String?>(null);

  Future<Credential?> currentUser() async {
    storage = await LocalStorage.initialize();
    user = storage!.getCurrentUser(key: 'user');
    return user;
  }

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  Future<void> registe(context, Credential credential) async {
    if (nameCtrl.text.trim().isEmpty) {
      errName.value = StringConst.nameError;
    } else {
      errName.value = null;
    }

    if (emailCtrl.text.trim().isEmpty) {
      errEmail.value = StringConst.emailError;
    } else {
      errEmail.value = null;
    }

    if (usernameCtrl.text.trim().isEmpty) {
      errUsername.value = StringConst.usernameError;
    } else {
      errUsername.value = null;
    }

    if (pswdCtrl.text.trim().isEmpty) {
      errPswd.value = StringConst.pswdError;
    } else {
      errPswd.value = null;
    }

    if (errName.value == null &&
        errEmail.value == null &&
        errPswd.value == null &&
        errUsername.value == null) {
      await _databaseController!.registerUser(credential);
      Navigator.pushNamed(context, StringConst.loginRoute);
      nameCtrl.clear();
      emailCtrl.clear();
      usernameCtrl.clear();
      pswdCtrl.clear();
    }
  }

  Future<void> login(context) async {
    if (usernameCtrl1.text.trim().isEmpty) {
      errUsername1.value = StringConst.usernameError;
    } else {
      errUsername1.value = null;
    }

    if (pswdCtrl1.text.trim().isEmpty) {
      errPswd1.value = StringConst.pswdError;
    } else {
      errPswd1.value = null;
    }

    if (errUsername1.value == null && errPswd1.value == null) {
      user = await _databaseController!.login(
          username: usernameCtrl1.text.trim(), password: pswdCtrl1.text.trim());
      if (user != null) {
        String strCredential = user.toString();
        storage!
            .saveUser(key: 'user', value: strCredential)
            .then((_) => Navigator.pushNamedAndRemoveUntil(
                  context,
                  StringConst.homeRoute,
                  (route) => false,
                ));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                title:
                    Text(StringConst.snacktext, style: textStyle.drawerStyle),
                content:
                    Text(StringConst.massage, style: textStyle.snackStyle));
          },
        );
      }
    }
  }

  Future<void> addContact(context, AddCredetial addCredetial) async {
    if (firstNameCtrl.text.trim().isEmpty) {
      errfirstName.value = StringConst.firstNameError;
    } else {
      errfirstName.value = null;
    }

    if (lastNameCtrl.text.trim().isEmpty) {
      errlastName.value = StringConst.lastNameError;
    } else {
      errlastName.value = null;
    }

    if (numberCtrl.text.trim().isEmpty) {
      errNumber.value = StringConst.usernameError;
    } else {
      errNumber.value = null;
    }

    if (addEmailCtrl.text.trim().isEmpty) {
      errAddEmail.value = StringConst.numberError;
    } else {
      errAddEmail.value = null;
    }

    if (relationCtrl.text.trim().isEmpty) {
      errRelation.value = StringConst.nameError;
    } else {
      errRelation.value = null;
    }

    if (workCtrl.text.trim().isEmpty) {
      errWork.value = StringConst.emailError;
    } else {
      errWork.value = null;
    }

    if (addressCtrl.text.trim().isEmpty) {
      errAddress.value = StringConst.usernameError;
    } else {
      errAddress.value = null;
    }

    if (linkCtrl.text.trim().isEmpty) {
      errLinks.value = StringConst.pswdError;
    } else {
      errLinks.value = null;
    }

    if (errfirstName.value == null &&
        errlastName.value == null &&
        errAddEmail.value == null &&
        errNumber.value == null) {
      await _databaseController!.addContact(
          addCredetial: addCredetial, userId: user!.id);
      firstNameCtrl.clear();
      lastNameCtrl.clear();
      numberCtrl.clear();
      addEmailCtrl.clear();
      relationCtrl.clear();
      workCtrl.clear();
      addressCtrl.clear();
      linkCtrl.clear();
      Navigator.pushReplacementNamed(context, StringConst.homeRoute);
    }
  }

  Future<Credential?> initialize() async {
    _databaseController = await DatabaseController.createDatabase();
     return currentUser();
  }
}
