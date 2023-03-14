import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/GroupChat/AddMemberToList.dart';

class GroupChatList extends StatefulWidget {
  const GroupChatList({super.key});

  @override
  State<GroupChatList> createState() => _GroupChatListState();
}

class _GroupChatListState extends State<GroupChatList> {
  var tapcolor;
  var ChatForumController = Get.put(ChatAndDiscussionController());
  @override
  void initState() {
    tapcolor = 'Chat';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: CommonText(
          label: 'Groups',
          colorT: mainColor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13.sp),
        actions: [
          GestureDetector(
            onTap: () {
              ChatForumController.GrpMembersFinalArrayOfName.clear();
              ChatForumController.GrpMembersFinalArrayOfID.clear();
              Get.to(AddMemberToList());
            },
            child: Icon(
              Icons.group_add_outlined,
              color: Colors.black,
              size: 3.5.h,
            ),
          ),
          SizedBox(
            width: 4.w,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: ChatForumController.GetALLGroup(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
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
                                      border: Border.all(
                                          width: 0.5, color: Color(0xffe4e4e4)),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://tssia.enirmaan.com//assets/uploads/comp_logo/bright_engineers/group_img/${ChatForumController.GetAllGroupList[index]['group_img']}'))),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CommonText(
                                            label: ChatForumController
                                                .GetAllGroupList[index]['name']
                                                .toString()
                                                .capitalizeFirst,
                                            colorT: Colors.black,
                                            fontw8: FontWeight.w500,
                                            size: 11.sp,
                                          ),
                                          CommonText(
                                            label: ChatForumController
                                                .GetAllGroupList[index]
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
                  )
                ],
              ),
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }
}
