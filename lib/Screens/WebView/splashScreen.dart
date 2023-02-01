import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/HomePage.dart';
import 'package:tssia_replica/Screens/Sign_Up/LoginScreen.dart';

class SplahsScreen extends StatefulWidget {
  const SplahsScreen({super.key});

  @override
  State<SplahsScreen> createState() => _SplahsScreenState();
}

class _SplahsScreenState extends State<SplahsScreen> {
  var SigunpController = Get.put(signupcontroller());
  void showNotification() async {
    String? fcmKey = await getFcmToken();
    print('FCM Key : $fcmKey');
  }

  @override
  void initState() {
    SigunpController.getIDfunction();
    Future.delayed(Duration(seconds: 3), () {
      print('${SigunpController.CurrentuserID}<---Token');
      Get.offAll(
          SigunpController.CurrentuserID == null ? LoginScreen() : HomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showNotification();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: CommonImage(
                url: 'assets/images/Bharat_Logo.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
