import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/ChatScreen.dart';
import 'package:tssia_replica/Screens/HomePage.dart';
import 'package:tssia_replica/Screens/My_Profile/My_Profile.dart';
import 'package:tssia_replica/Screens/Partners/Partners.dart';
import 'package:tssia_replica/Screens/Publications/Publications.dart';

class CommonBottomBar extends StatefulWidget {
  final TapColor;

  CommonBottomBar({super.key, required this.TapColor});

  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  var SigunpController = Get.put(signupcontroller());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.8.h,
      width: 100.h,
      margin: Platform.isIOS
          ? EdgeInsets.only(bottom: 2.5.h)
          : EdgeInsets.only(
              top: 0,
            ),
      decoration: BoxDecoration(
          color: PWhite,
          border:
              Border(top: BorderSide(color: Color(0xffe4e4e4), width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => HomePage(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.TapColor == 'Home'
                      ? 'assets/images/Home-fill.svg'
                      : 'assets/images/Home.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  // color: widget.TapColor == 'Home'
                  //     ? mainBlue
                  //     : Colors.grey.shade400,
                ),
                Text(
                  'Home',
                  style: widget.TapColor == 'Home'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => Partners(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.TapColor == 'Partners'
                      ? 'assets/images/Partners-fill.svg'
                      : 'assets/images/Partners.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  // color: widget.TapColor == 'Partners'
                  //     ? mainBlue
                  //     : Colors.grey.shade400,
                ),
                Text(
                  'Partners',
                  style: widget.TapColor == 'Partners'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => ChatScreen(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.TapColor == 'Chat'
                      ? 'assets/images/chat-fill.svg'
                      : 'assets/images/chat.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  // color: widget.TapColor == 'Chat'
                  //     ? mainBlue
                  //     : Colors.grey.shade400,
                ),
                Text(
                  'Chat',
                  style: widget.TapColor == 'Chat'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => Publications(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.TapColor == 'Publication'
                      ? 'assets/images/Publication-fill.svg'
                      : 'assets/images/Publication.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  // color: widget.TapColor == 'Publication'
                  //     ? mainBlue
                  //     : Colors.grey.shade400,
                ),
                Text(
                  'Publication',
                  style: widget.TapColor == 'Publication'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => MyProfile(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  widget.TapColor == 'Profile'
                      ? 'assets/images/Profile-fill.svg'
                      : 'assets/images/Profile.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                  // color: widget.TapColor == 'Profile'
                  //     ? mainBlue
                  //     : Colors.grey.shade400,
                ),
                Text(
                  'Profile',
                  style: widget.TapColor == 'Profile'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
