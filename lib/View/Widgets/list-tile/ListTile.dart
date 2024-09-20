import 'package:firstforapp/Constants/strings.dart';
import 'package:firstforapp/Constants/text-style.dart';
import 'package:firstforapp/Model/addCredential.dart';
import 'package:firstforapp/Model/credential.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LisTile extends StatelessWidget {
  LisTile({
    super.key,
    required this.contact,
    required this.imgPath,
    required this.onTap,
    required this.onUpdate,
    required this.onDelete,
  });

  final AddCredetial contact;
  void Function()? onTap;
  void Function()? onUpdate;
  void Function()? onDelete;
  String imgPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${contact.firstName} ${contact.lastName}",
          style: textStyle.tileStyle),
      subtitle: Text(contact.number, style: textStyle.commonText),
      onTap:  onTap,
      leading: _getImage(contact.firstName),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: onUpdate,
            child: const Text('Update'),
          ),
          PopupMenuItem(
            onTap: onDelete,
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

Widget _getImage(String name) {
  String firstLetter = name.substring(0, 1).toUpperCase();
  if (firstLetter == 'A') {
    return const Image(
        image: AssetImage(StringConst.contactA), height: 35, width: 35);
  } else if (firstLetter == 'B') {
    return const Image(
        image: AssetImage(StringConst.contactB), height: 35, width: 35);
  } else if (firstLetter == 'C') {
    return const Image(
        image: AssetImage(StringConst.contactC), height: 35, width: 35);
  } else if (firstLetter == 'D') {
    return const Image(
        image: AssetImage(StringConst.contactD), height: 35, width: 35);
  } else if (firstLetter == 'E') {
    return const Image(
        image: AssetImage(StringConst.contactE), height: 35, width: 35);
  } else if (firstLetter == 'F') {
    return const Image(
        image: AssetImage(StringConst.contactF), height: 35, width: 35);
  } else if (firstLetter == 'G') {
    return const Image(
        image: AssetImage(StringConst.contactG), height: 35, width: 35);
  } else if (firstLetter == 'H') {
    return const Image(
        image: AssetImage(StringConst.contactH), height: 35, width: 35);
  } else if (firstLetter == 'I') {
    return const Image(
        image: AssetImage(StringConst.contactI), height: 35, width: 35);
  } else if (firstLetter == 'J') {
    return const Image(
        image: AssetImage(StringConst.contactJ), height: 35, width: 35);
  } else if (firstLetter == 'K') {
    return const Image(
        image: AssetImage(StringConst.contactK), height: 35, width: 35);
  } else if (firstLetter == 'L') {
    return const Image(
        image: AssetImage(StringConst.contactL), height: 35, width: 35);
  } else if (firstLetter == 'M') {
    return const Image(
        image: AssetImage(StringConst.contactM), height: 35, width: 35);
  } else if (firstLetter == 'N') {
    return const Image(
        image: AssetImage(StringConst.contactN), height: 35, width: 35);
  } else if (firstLetter == 'O') {
    return const Image(
        image: AssetImage(StringConst.contactO), height: 35, width: 35);
  } else if (firstLetter == 'P') {
    return const Image(
        image: AssetImage(StringConst.contactP), height: 35, width: 35);
  } else if (firstLetter == 'Q') {
    return const Image(
        image: AssetImage(StringConst.contactQ), height: 35, width: 35);
  } else if (firstLetter == 'R') {
    return const Image(
        image: AssetImage(StringConst.contactR), height: 35, width: 35);
  } else if (firstLetter == 'S') {
    return const Image(
        image: AssetImage(StringConst.contactS), height: 35, width: 35);
  } else if (firstLetter == 'T') {
    return const Image(
        image: AssetImage(StringConst.contactT), height: 35, width: 35);
  } else if (firstLetter == 'U') {
    return const Image(
        image: AssetImage(StringConst.contactU), height: 35, width: 35);
  } else if (firstLetter == 'V') {
    return const Image(
        image: AssetImage(StringConst.contactV), height: 35, width: 35);
  } else if (firstLetter == 'W') {
    return const Image(
        image: AssetImage(StringConst.contactW), height: 35, width: 35);
  } else if (firstLetter == 'X') {
    return const Image(
        image: AssetImage(StringConst.contactX), height: 35, width: 35);
  } else if (firstLetter == 'Y') {
    return const Image(
        image: AssetImage(StringConst.contactY), height: 35, width: 35);
  } else if (firstLetter == 'Z') {
    return const Image(
        image: AssetImage(StringConst.contactZ), height: 35, width: 35);
  } else {
    return const Image(
      image: AssetImage('asset/user.png'),
      height: 35,
      width: 35,
    );
  }
}
