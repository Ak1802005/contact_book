import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

/// 1.1.1 define a navigator key
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 1.1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  // call the useSystemCallingUI
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MyApp(navigatorKey: navigatorKey));
  });
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// 1.1.3: register the navigator key to MaterialApp
      navigatorKey: widget.navigatorKey,
      // Add a home widget or other routes as needed
      home: Scaffold(
        body: Column(
          children: [
            Center(
                child: Container(
              color: Colors.blue,
              height: 500,
              width: 200,
            )),
            ZegoSendCallInvitationButton(
              isVideoCall: true,
              //You need to use the resourceID that you created in the subsequent steps.
              //Please continue reading this document.
              resourceID: "zegouikit_call",
              invitees: [
                ZegoUIKitUser(
                  id: '6354859005 0+',
                  name: 'Akshau',
                ),
                ZegoUIKitUser(
                  id: '2',
                  name: 'Raju',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
