import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';

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

HeaderText({Label}) {
  return Padding(
    padding: EdgeInsets.only(top: 1.6.h, bottom: 1.5.h),
    child: CommonText(
      label: Label.toString(),
      size: 11.sp,
      colorT: Colors.black,
      maxline: 1,
      overflow: TextOverflow.ellipsis,
      fontw8: FontWeight.w400,
    ),
  );
}
