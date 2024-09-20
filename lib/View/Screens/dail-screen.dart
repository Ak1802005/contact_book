import 'package:firstforapp/View/Screens/home-screen.dart';
import 'package:firstforapp/View/Widgets/call-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class DailScreen extends StatelessWidget {
  DailScreen(
      {super.key, required this.contactName, required this.contactNumber});

  String contactName;
  String contactNumber;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shadowColor: Colors.lightGreen,
                elevation: 25,
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 45,
                        child: Icon(Icons.person, size: 55),
                      ),
                      10.vertical,
                      Text(contactName,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 29,fontWeight: FontWeight.w600)),
                      15.vertical,
                      Text("Phone  -> $contactNumber",
                          style: Theme.of(context).textTheme.headlineSmall),
                      60.vertical,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () => _makeCall(contactNumber),
                              icon: const Icon(Icons.phone,
                                  size: 35, color: Colors.white)),
                          IconButton(
                              onPressed: () => print('Message'),
                              icon: const Icon(Icons.mark_unread_chat_alt,
                                  size: 35, color: Colors.white)),
                          IconButton(
                              onPressed: () => Get.to(CallPage(user: contactName,contactNumber: contactNumber,)),
                              icon: const Icon(Icons.video_call,
                                  size: 35, color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          SizedBox(
            height: height * 0.08,
            width: width * 0.9,
            child: Card(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('WhatsApp',
                        style: Theme.of(context).textTheme.headlineMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: IconButton(
                        onPressed: () => print('WhatsApp'),
                        icon: const Icon(
                          Icons.wifi_calling_3,
                          color: Colors.white,
                          size: 30,
                        )),
                  )
                ],
              ),
            ),
          ),
          20.vertical,
          GFButton(
              onPressed: () => print('History'),
              color: Colors.transparent,
              elevation: 10,
              clipBehavior: Clip.hardEdge,
              shape: GFButtonShape.pills,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('History',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 22)),
              ))
        ],
      ),
    );
  }

  void _makeCall(String phoneNumber) async {
    await FlutterPhoneDirectCaller.callNumber('+91 $phoneNumber');
  }
}
