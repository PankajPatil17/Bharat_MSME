import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

const BaseURL = 'https://tssia.enirmaan.com/';
const MSMEURL = 'https://msmebharatmanch.com/';
const Transition transitonEffect = Transition.leftToRightWithFade;

Future<String?> getFcmToken() async {
  if (Platform.isIOS) {
    String? fcmKey = await FirebaseMessaging.instance.getToken();
    return fcmKey;
  }
  String? fcmKey = await FirebaseMessaging.instance.getToken();
  return fcmKey;
}
