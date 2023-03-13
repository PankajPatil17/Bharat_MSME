import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/CommonCommentsDetails.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var tapcolor;
  var SigunpController = Get.put(signupcontroller());
  var ChatForumController = Get.put(ChatAndDiscussionController());
  @override
  void initState() {
    tapcolor = 'Chat';
    SigunpController.isStopped = false;
    sec5Timer();
    super.initState();
  }

  sec5Timer() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (SigunpController.isStopped) {
        timer.cancel();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    SigunpController.isStopped = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('');
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    label: 'dfjksjdflkdfdjkldsfjlkd',
                  ),
                  DiscussonList()
                ],
              ),
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }

  //All Discusion list

  DiscussonList() {
    return FutureBuilder(
      future: ChatForumController.AllPostList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: ChatForumController.GetAllPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(CommonCommentsDetails(
                    userId: SigunpController.CurrentuserID.toString(),
                    postID: ChatForumController.GetAllPosts[index]['id']
                        .toString()));
              },
              child: Container(
                  width: 100.w,
                  margin: EdgeInsets.all(1.h),
                  padding: EdgeInsets.all(1.5.h),
                  decoration: BoxDecoration(
                      color: PWhite,
                      boxShadow: Mainboxshadow,
                      borderRadius: MainBorderRadius),
                  child: Row(
                    children: [
                      Container(
                        height: 6.h,
                        width: 6.h,
                        margin: EdgeInsets.only(right: 1.h),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: Color(0xffe4e4e4)),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/3048/3048122.png'))),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 70.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  label: ChatForumController.GetAllPosts[index]
                                          ['founder_name']
                                      .toString()
                                      .capitalizeFirst,
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w600,
                                  size: 13.sp,
                                ),
                                CommonText(
                                  label: ChatForumController.GetAllPosts[index]
                                          ['created_at']
                                      .toString(),
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w400,
                                  size: 10.sp,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.4.h),
                            child: CommonText(
                              label: ChatForumController.GetAllPosts[index]
                                      ['comp_name']
                                  .toString()
                                  .capitalizeFirst,
                              colorT: Colors.black,
                              fontw8: FontWeight.w500,
                              size: 11.sp,
                            ),
                          ),
                          CommonText(
                            label: ChatForumController.GetAllPosts[index]
                                    ['title']
                                .toString()
                                .capitalizeFirst,
                            colorT: Colors.black,
                            fontw8: FontWeight.w400,
                            size: 11.sp,
                          ),
                        ],
                      )
                    ],
                  )),
            );
          },
        );
      },
    );
  }
}
