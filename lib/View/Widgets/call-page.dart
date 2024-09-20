// ignore_for_file: depend_on_referenced_packages

import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../../Constants/utils.dart';
import 'floating-ad.dart';

class CallPage extends StatelessWidget {
  final String user;
  final String contactNumber;

  const CallPage({super.key, required this.contactNumber, required this.user});

  @override
  Widget build(BuildContext context) {
    String generateUniqueId() {
      const uuid = Uuid();
      return uuid.v4(); // Generate a random UUID (version 4)
    }

    String userId() {
      final random = Random();
      return random
          .nextInt(1000000)
          .toString(); // Generate a random number between 0 and 999999
    }

    return ZegoUIKitPrebuiltCall(
      appID: Utils.appId,
      appSign: Utils.appSignin,
      userID: userId(),
      userName: user,
      callID: generateUniqueId(),
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..video = ZegoUIKitVideoConfig.preset180P()
        // ..foreground = const Positioned(
        //   top: 100,
        //   right: 20,
        //   child: FloatingAd(),
        // )
        ..avatarBuilder = (BuildContext context, Size size, ZegoUIKitUser? user,
            Map extraInfo) {
          return user != null
              ? Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://your_server/app/avatar/${user.id}.png',
                      ),
                    ),
                  ),
                )
              : const SizedBox();
        },
    );
  }
}
