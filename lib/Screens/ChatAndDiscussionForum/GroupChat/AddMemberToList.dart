import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/GroupChat/CreateGroupFinalStep.dart';

class AddMemberToList extends StatefulWidget {
  const AddMemberToList({super.key});

  @override
  State<AddMemberToList> createState() => _AddMemberToListState();
}

class _AddMemberToListState extends State<AddMemberToList> {
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
          label: 'Add Members',
          colorT: mainColor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13.sp),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(CreateGroupFinalStep());
            },
            child: Icon(
              Icons.done_rounded,
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
                    future: ChatForumController.GetGropuMemberList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return ListView.builder(
                        itemCount:
                            ChatForumController.GetAllGroupMembers.length,
                        shrinkWrap: true,
                        controller: ScrollController(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (ChatForumController
                                        .GrpMembersFinalArrayOfName
                                    .contains(ChatForumController
                                        .GetAllGroupMembers[index]['comp_name']
                                        .toString())) {
                                  (ChatForumController
                                          .GrpMembersFinalArrayOfName
                                      .remove(ChatForumController
                                          .GetAllGroupMembers[index]
                                              ['comp_name']
                                          .toString()));
                                } else {
                                  (ChatForumController
                                          .GrpMembersFinalArrayOfName
                                      .add(ChatForumController
                                          .GetAllGroupMembers[index]
                                              ['comp_name']
                                          .toString()));
                                }

                                if (ChatForumController.GrpMembersFinalArrayOfID
                                    .contains(ChatForumController
                                        .GetAllGroupMembers[index]['comp_id']
                                        .toString())) {
                                  (ChatForumController.GrpMembersFinalArrayOfID
                                      .remove(ChatForumController
                                          .GetAllGroupMembers[index]['comp_id']
                                          .toString()));
                                } else {
                                  (ChatForumController.GrpMembersFinalArrayOfID
                                      .add(ChatForumController
                                          .GetAllGroupMembers[index]['comp_id']
                                          .toString()));
                                }
                              });
                            },
                            child: Container(
                              width: 100.w,
                              margin: EdgeInsets.all(1.5.h),
                              padding: EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                  color: ChatForumController
                                              .GrpMembersFinalArrayOfName
                                          .contains(ChatForumController
                                              .GetAllGroupMembers[index]
                                                  ['comp_name']
                                              .toString())
                                      ? Colors.cyan.shade50
                                      : Colors.white,
                                  borderRadius: MainBorderRadius,
                                  border: Border.all(color: mainColor)),
                              child: CommonText(
                                label: ChatForumController
                                    .GetAllGroupMembers[index]['comp_name']
                                    .toString()
                                    .capitalizeFirst,
                                colorT: Colors.black,
                                fontw8: FontWeight.w500,
                                size: 13.sp,
                              ),
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
