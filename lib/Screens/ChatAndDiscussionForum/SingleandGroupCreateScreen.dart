import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/DiscussionForum.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/GroupChat/GroupChatList.dart';

class SingleandGroupCreateScreen extends StatefulWidget {
  const SingleandGroupCreateScreen({super.key});

  @override
  State<SingleandGroupCreateScreen> createState() =>
      _SingleandGroupCreateScreenState();
}

class _SingleandGroupCreateScreenState
    extends State<SingleandGroupCreateScreen> {
  var SigunpController = Get.put(signupcontroller());
  var tapcolor;

  @override
  void initState() {
    tapcolor = 'Chat';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  'assets/Lottie/singleChat.json',
                  height: 20.h,
                  width: 20.h,
                ),
                CommonText(
                  label: 'Create Single Chat Conversation',
                  colorT: mainColor,
                  fontw8: FontWeight.w500,
                  size: 11.sp,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      elevation: 2,
                      backgroundColor: mainColor,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Get.to(DiscussionForum());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.9.h, vertical: 0.2.h),
                      child: Text(
                        'Start Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2.2.h),
                  child: Divider(),
                ),
                LottieBuilder.asset(
                  'assets/Lottie/groupchat.json',
                  height: 20.h,
                  width: 20.h,
                ),
                CommonText(
                  label: 'Create Group Chat Conversation',
                  colorT: mainColor,
                  fontw8: FontWeight.w500,
                  size: 11.sp,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      elevation: 2,
                      backgroundColor: mainColor,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Get.to(GroupChatList());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.9.h, vertical: 0.2.h),
                      child: Text(
                        'Start Chat',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }
}
