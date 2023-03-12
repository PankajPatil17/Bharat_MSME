import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

const UatURL = 'https://msme.enirmaan.com/';
const MSMEURL = 'https://msmebharatmanch.com/';
const secToken = 'eyJhbGciOiJIUzI1NiJ9.JGJHG5441ASASgh==';
const Transition transitonEffect = Transition.leftToRightWithFade;

const ImagePath = "https://msmebharatmanch.com/images/api_images/";
const EventImagePath = 'https://msmebharatmanch.com/images/event-images/';

Future<String?> getFcmToken() async {
  if (Platform.isIOS) {
    String? fcmKey = await FirebaseMessaging.instance.getAPNSToken();
    return fcmKey;
  }
  String? fcmKey = await FirebaseMessaging.instance.getToken();
  return fcmKey;
}
