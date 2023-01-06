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
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/GroupChat/AddMemberToList.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/SingleandGroupCreateScreen.dart';

class GroupCreateMainScreen extends StatefulWidget {
  const GroupCreateMainScreen({super.key});

  @override
  State<GroupCreateMainScreen> createState() => _GroupCreateMainScreenState();
}

class _GroupCreateMainScreenState extends State<GroupCreateMainScreen> {
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
                children: [TopChatPart(), GroupList()],
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
          GestureDetector(
            onTap: () {
              Get.to(SingleandGroupCreateScreen());
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
                  child: SvgPicture.asset(
                    'assets/images/chat_new.svg',
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
          ),
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
                          color: Color(0xffB0DBB8),
                          offset: Offset(0, 2)),
                    ],
                    border: Border.all(color: Color(0xff56CA6A))),
                child: SvgPicture.asset('assets/images/groupchat_new.svg',
                    height: 4.h, width: 4.h, color: Color(0xff56CA6A)),
              ),
              CommonText(
                label: 'Group Chat',
                fontw8: FontWeight.w600,
                size: 12.sp,
              )
            ],
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
            Get.to(AddMemberToList());
          },
          child: SvgPicture.asset(
            height: 4.h,
            width: 4.h,
            'assets/images/add-group_new.svg',
          )),
    );
  }

  //All Group List

  GroupList() {
    return FutureBuilder(
      future: ChatForumController.GetALLGroup(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
          itemCount: ChatForumController.GetAllGroupList.length,
          shrinkWrap: true,
          controller: ScrollController(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: 100.w,
              margin: EdgeInsets.all(1.h),
              padding: EdgeInsets.all(1.h),
              decoration: BoxDecoration(
                  color: PWhite,
                  boxShadow: Mainboxshadow,
                  borderRadius: MainBorderRadius),
              child: Row(
                children: [
                  Container(
                    height: 6.0.h,
                    width: 6.0.h,
                    margin: EdgeInsets.only(right: 1.h),
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: Color(0xffe4e4e4)),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/681/681392.png'))),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 75.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              label: ChatForumController.GetAllGroupList[index]
                                      ['name']
                                  .toString()
                                  .capitalizeFirst,
                              colorT: Colors.black,
                              fontw8: FontWeight.w500,
                              size: 11.sp,
                            ),
                            CommonText(
                              label: ChatForumController.GetAllGroupList[index]
                                      ['created_at']
                                  .toString()
                                  .replaceRange(9, 18, ''),
                              colorT: Colors.black,
                              fontw8: FontWeight.w400,
                              size: 9.sp,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
