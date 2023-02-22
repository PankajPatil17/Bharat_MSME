import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/CommonCommentsDetails.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/DiscussionForum.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/GroupCreateMainScreen.dart';

class SingleandGroupCreateScreen extends StatefulWidget {
  const SingleandGroupCreateScreen({super.key});

  @override
  State<SingleandGroupCreateScreen> createState() =>
      _SingleandGroupCreateScreenState();
}

class _SingleandGroupCreateScreenState
    extends State<SingleandGroupCreateScreen> {
  var ChatForumController = Get.put(ChatAndDiscussionController());
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
      floatingActionButton: Fab(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [TopChatPart(), DiscussonList()],
              ),
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }

  TopChatPart() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(2.5.h),
                margin: EdgeInsets.only(bottom: 1.8.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Color(0xffFEE2B1),
                          offset: Offset(0, 2)),
                    ],
                    border: Border.all(color: Color(0xffF3AE33))),
                child: SvgPicture.network(
                  '${ImagePath}chat_new.svg',
                  height: 4.h,
                  width: 4.h,
                ),
              ),
              CommonText(
                label: 'Chat',
                fontw8: FontWeight.w600,
                size: 12.sp,
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(GroupCreateMainScreen());
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2.5.h),
                  margin: EdgeInsets.only(bottom: 1.8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: Mainboxshadow,
                  ),
                  child: SvgPicture.network(
                    'a${ImagePath}groupchat_new.svg',
                    height: 4.h,
                    width: 4.h,
                  ),
                ),
                CommonText(
                  label: 'Group Chat',
                  fontw8: FontWeight.w600,
                  size: 12.sp,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Fab() {
    return Container(
      margin: EdgeInsets.only(bottom: 9.5.h),
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Mainboxshadow,
          shape: BoxShape.circle),
      child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            Get.to(DiscussionForum());
          },
          child: SvgPicture.network(
            height: 4.h,
            width: 4.h,
            '${ImagePath}newchat_new.svg',
          )),
    );
  }

  //All Discusion list

  DiscussonList() {
    return FutureBuilder(
      future: ChatForumController.AllPostList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ChatForumController.GetAllPosts.length == 0 &&
                // ignore: unnecessary_null_comparison
                ChatForumController.GetAllPosts.length == null
            ? Text('No chat')
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
                                        size: 13.sp,
                                      ),
                                      CommonText(
                                        label: ChatForumController
                                            .GetAllPosts[index]['created_at']
                                            .toString(),
                                        colorT: Colors.black,
                                        fontw8: FontWeight.w400,
                                        size: 10.sp,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 0.4.h),
                                  child: CommonText(
                                    label: ChatForumController
                                        .GetAllPosts[index]['comp_name']
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
