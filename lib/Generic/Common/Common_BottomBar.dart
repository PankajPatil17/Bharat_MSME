import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/HomeController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/ChatScreen.dart';
import 'package:tssia_replica/Screens/HomePage.dart';
import 'package:tssia_replica/Screens/My_Profile/My_Profile.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class CommonBottomBar extends StatefulWidget {
  final TapColor;

  CommonBottomBar({super.key, required this.TapColor});

  @override
  State<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends State<CommonBottomBar> {
  var SigunpController = Get.put(signupcontroller());
  var HomePageController = Get.put(HomeController());

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => HomePage(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.network(
                  widget.TapColor == 'Home'
                      ? '${ImagePath}Home-fill.svg'
                      : '${ImagePath}Home.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                ),
                Text(
                  'Home',
                  style: widget.TapColor == 'Home'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                print("${HomePageController.partnerLink}");
                Get.to(WebviewScreen(
                    url: "${HomePageController.partnerLink}",
                    label: 'Partners'));
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.network(
                  widget.TapColor == 'Partners'
                      ? '${ImagePath}Partners-fill.svg'
                      : '${ImagePath}Partners.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                ),
                Text(
                  'Partners',
                  style: widget.TapColor == 'Partners'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
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
                SvgPicture.network(
                  widget.TapColor == 'Chat'
                      ? '${ImagePath}chat-fill.svg'
                      : '${ImagePath}chat.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                ),
                Text(
                  'Chat',
                  style: widget.TapColor == 'Chat'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp),
                )
              ],
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     SigunpController.isStopped = true;
          //     Get.to(() => Publications(), transition: Transition.noTransition);
          //   },
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       SvgPicture.network(
          //         widget.TapColor == 'Publication'
          //             ? '${ImagePath}Publication-fill.svg'
          //             : '${ImagePath}Publication.svg',
          //         height: 2.9.h,
          //         width: 2.9.h,
          //       ),
          //       Text(
          //         'Publication',
          //         style: widget.TapColor == 'Publication'
          //             ? TextStyle(
          //                 color: mainBlue,
          //                 fontFamily: 'Poppins',
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 10.sp)
          //             : TextStyle(
          //                 color: Colors.black,
          //                 fontFamily: 'Poppins',
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 10.sp),
          //       )
          //     ],
          //   ),
          // ),
          InkWell(
            onTap: () {
              SigunpController.isStopped = true;
              Get.to(() => MyProfile(), transition: Transition.noTransition);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.network(
                  widget.TapColor == 'Profile'
                      ? '${ImagePath}Profile-fill.svg'
                      : '${ImagePath}Profile.svg',
                  height: 2.9.h,
                  width: 2.9.h,
                ),
                Text(
                  'Profile',
                  style: widget.TapColor == 'Profile'
                      ? TextStyle(
                          color: mainBlue,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp)
                      : TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
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
