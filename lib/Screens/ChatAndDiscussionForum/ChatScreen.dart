// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/CommonCommentsDetails.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/DiscussionForum.dart';

import '../../Generic/Common/Common_BottomBar.dart';
import '../../Generic/Common/Common_Color.dart';
import '../../Generic/Custom/Custom_Drawer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var tapcolor;
  var SigunpController = Get.put(signupcontroller());
  var ChatForumController = Get.put(ChatAndDiscussionController());
  TextEditingController search = TextEditingController();
  @override
  void initState() {
    tapcolor = 'Chat';
    SigunpController.isStopped = false;
    sec5Timer();
    super.initState();
  }

  SearchFunction() {
    final result = ChatForumController.GetAllPosts.where((movie) {
      final movietitle = movie['founder_name'].toString().toLowerCase() +
          movie['title'].toString().toLowerCase();
      final input = search.text.toLowerCase();
      return movietitle.contains(input);
    }).toList();
    setState(() {
      ChatForumController.ChatSearchResult = result;
    });
  }

  sec5Timer() {
    Timer.periodic(Duration(seconds: 8), (timer) {
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
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 1.h),
                    child: TextFormField(
                      controller: search,
                      textInputAction: TextInputAction.search,
                      onFieldSubmitted: (v) {
                        Get.to(SearchFunction());
                      },
                      onChanged: (value) {
                        SearchFunction();
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        suffixIcon: search.text == ''
                            ? IconButton(
                                padding: EdgeInsets.only(bottom: 0.2.h),
                                icon: Icon(
                                  Icons.search_rounded,
                                  color: mainBlue,
                                  size: 3.h,
                                ),
                                onPressed: () {
                                  SearchFunction();
                                },
                              )
                            : IconButton(
                                padding: EdgeInsets.only(bottom: 0.2.h),
                                icon: Icon(
                                  Icons.clear_sharp,
                                  color: mainBlue,
                                  size: 3.h,
                                ),
                                onPressed: () {
                                  setState(() {
                                    search.clear();
                                    search.text == '';
                                  });
                                },
                              ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                        hintText: 'Search Chat',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'OpenSans'),
                      ),
                    ),
                  ),
                  search.text == '' ? DiscussonList() : ALLSearchDiscussonList()
                ],
              ),
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }

// Start Chat

  StartChat() {
    return Column(
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
              padding: EdgeInsets.symmetric(horizontal: 1.9.h, vertical: 0.2.h),
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
    );
  }

  //All Discusion list

  DiscussonList() {
    return FutureBuilder(
      future: ChatForumController.AllPostList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ChatForumController.GetAllPosts.length == 0 &&
                ChatForumController.GetAllPosts.length == null
            ? StartChat()
            : ListView.builder(
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
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                            color: PWhite,
                            boxShadow: Mainboxshadow,
                            borderRadius: MainBorderRadius),
                        child: Row(
                          children: [
                            // Container(
                            //   height: 6.h,
                            //   width: 6.h,
                            //   margin: EdgeInsets.only(right: 1.h),
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           width: 0.5, color: Color(0xffe4e4e4)),
                            //       shape: BoxShape.circle,
                            //       image: DecorationImage(
                            //           image: NetworkImage(
                            //               'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                            // ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 90.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonText(
                                        label: ChatForumController
                                            .GetAllPosts[index]['founder_name']
                                            .toString()
                                            .capitalizeFirst,
                                        colorT: Colors.black,
                                        fontw8: FontWeight.w600,
                                        size: 12.sp,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      CommonText(
                                        label: ChatForumController
                                            .GetAllPosts[index]['created_at']
                                            .toString()
                                            .replaceRange(11, 19, ''),
                                        colorT: Colors.black,
                                        fontw8: FontWeight.w400,
                                        size: 9.sp,
                                      ),
                                    ],
                                  ),
                                ),
                                CommonText(
                                  label: ChatForumController.GetAllPosts[index]
                                          ['comp_name']
                                      .toString()
                                      .capitalizeFirst,
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w600,
                                  size: 10.sp,
                                ),
                                CommonText(
                                  label: ChatForumController.GetAllPosts[index]
                                          ['title']
                                      .toString()
                                      .capitalizeFirst,
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w400,
                                  size: 10.sp,
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

  // All Search Discussion List
  ALLSearchDiscussonList() {
    return FutureBuilder(
      future: ChatForumController.AllPostList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ChatForumController.ChatSearchResult.length == 0
            ? NoSearchFound()
            : ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(),
                itemCount: ChatForumController.ChatSearchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(CommonCommentsDetails(
                          userId: SigunpController.CurrentuserID.toString(),
                          postID: ChatForumController.ChatSearchResult[index]
                                  ['id']
                              .toString()));
                    },
                    child: Container(
                        width: 100.w,
                        margin: EdgeInsets.all(1.h),
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                            color: PWhite,
                            boxShadow: Mainboxshadow,
                            borderRadius: MainBorderRadius),
                        child: Row(
                          children: [
                            // Container(
                            //   height: 6.h,
                            //   width: 6.h,
                            //   margin: EdgeInsets.only(right: 1.h),
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           width: 0.5, color: Color(0xffe4e4e4)),
                            //       shape: BoxShape.circle,
                            //       image: DecorationImage(
                            //           image: NetworkImage(
                            //               'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                            // ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 75.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CommonText(
                                        label: ChatForumController
                                            .ChatSearchResult[index]
                                                ['founder_name']
                                            .toString()
                                            .capitalizeFirst,
                                        colorT: Colors.black,
                                        fontw8: FontWeight.w600,
                                        size: 12.sp,
                                      ),
                                      CommonText(
                                        label: ChatForumController
                                            .ChatSearchResult[index]
                                                ['created_at']
                                            .toString(),
                                        colorT: Colors.black,
                                        fontw8: FontWeight.w400,
                                        size: 9.sp,
                                      ),
                                    ],
                                  ),
                                ),
                                CommonText(
                                  label: ChatForumController
                                      .ChatSearchResult[index]['comp_name']
                                      .toString()
                                      .capitalizeFirst,
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w600,
                                  size: 10.sp,
                                ),
                                CommonText(
                                  label: ChatForumController
                                      .ChatSearchResult[index]['title']
                                      .toString()
                                      .capitalizeFirst,
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w400,
                                  size: 10.sp,
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

  NoSearchFound() {
    return Center(
      child: CommonText(
        fontw8: FontWeight.bold,
        label: 'No Search Results',
        size: 12.sp,
      ),
    );
  }
}
