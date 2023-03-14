import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/CommonCommentsDetails.dart';

class DiscussionForum extends StatefulWidget {
  const DiscussionForum({super.key});

  @override
  State<DiscussionForum> createState() => _DiscussionForumState();
}

class _DiscussionForumState extends State<DiscussionForum> {
  var SigunpController = Get.put(signupcontroller());
  var ChatForumController = Get.put(ChatAndDiscussionController());
  TextEditingController Title = TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController Description = TextEditingController();
  var imgpath = ''.obs;
  FilePickerResult? result;
  var filename;
  var fileType;
  var tapcolor;

  @override
  void initState() {
    tapcolor = 'chat';
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

  var TapColor;
  @override
  Widget build(BuildContext context) {
    print('hit');
    return Scaffold(
      backgroundColor: Colors.white,
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
                children: [PostBox(), AllPostList()],
              ),
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }

//allPostList
  AllPostList() {
    return FutureBuilder(
      future: ChatForumController.AllPostList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          controller: ScrollController(),
          itemCount: ChatForumController.GetAllPosts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                SigunpController.isStopped = await true;
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
                      color: Colors.white,
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
                            width: 86.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  label: ChatForumController.GetAllPosts[index]
                                          ['founder_name']
                                      .toString()
                                      .capitalizeFirst,
                                  colorT: Colors.black,
                                  fontw8: FontWeight.w500,
                                  size: 11.sp,
                                ),
                                CommonText(
                                  label: ChatForumController.GetAllPosts[index]
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
                            label: ChatForumController.GetAllPosts[index]
                                    ['title']
                                .toString()
                                .capitalizeFirst,
                            colorT: Colors.black,
                            fontw8: FontWeight.w400,
                            size: 10.sp,
                          ),
                          CommonText(
                            label: ChatForumController.GetAllPosts[index]
                                    ['comp_name']
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

// creat convresation
  PostBox() {
    return Form(
      key: formKey,
      child: Container(
        width: 100.w,
        margin: EdgeInsets.all(1.h),
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: Mainboxshadow,
            borderRadius: MainBorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Container(
                //   height: 6.0.h,
                //   width: 6.0.h,
                //   margin: EdgeInsets.only(right: 1.h),
                //   decoration: BoxDecoration(
                //       border: Border.all(width: 0.5, color: Color(0xffe4e4e4)),
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //           image: NetworkImage(
                //               'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                // ),
                SizedBox(
                  width: 2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      label: SigunpController.MemberName == null
                          ? ''
                          : SigunpController.MemberName.toString()
                              .capitalizeFirst,
                      colorT: Colors.black,
                      fontw8: FontWeight.w500,
                      size: 13.sp,
                    ),
                    CommonText(
                      label: 'Add New Conversation',
                      colorT: Colors.black,
                      fontw8: FontWeight.w400,
                      size: 10.sp,
                    ),
                  ],
                )
              ],
            ),
            TextFormField(
              controller: Title,
              maxLines: 1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Start Conversation With Title',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'OpenSans',
                    color: Mainfentbackgrey),
              ),
            ),
            TextFormField(
              controller: Description,
              maxLines: 5,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'Write something here...',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'OpenSans',
                    color: Mainfentbackgrey),
              ),
            ),
            Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imgpath.value == ''
                      ? Container()
                      : Container(
                          margin: EdgeInsets.all(1.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 2.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: MainBorderRadius,
                              color: Colors.white),
                          child: CommonText(
                            label: '${filename}',
                            fontw8: FontWeight.w600,
                            size: 10.sp,
                            colorT: Colors.black,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                  Container(
                    padding: EdgeInsets.all(1.2.h),
                    decoration: BoxDecoration(
                        color: mainColor, borderRadius: MainBorderRadius),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            result = await FilePicker.platform
                                .pickFiles(allowMultiple: false);
                            if (result == null) {
                              print("No file selected");
                            } else {
                              result?.files.forEach((element) {
                                // print('asdasd${element.path}');
                                imgpath.value = element.path!;
                                filename = element.name;
                                fileType = element.extension;
                                print(element.path);
                              });
                            }
                          },
                          child: Icon(
                            imgpath.value == ''
                                ? Icons.attach_file_sharp
                                : Icons.change_circle,
                            color: Colors.white,
                            size: 3.h,
                          ),
                        ),
                        Spacer(),
                        CommonText(
                          label: 'Add New Conversation',
                          colorT: Colors.white,
                          fontw8: FontWeight.w400,
                          size: 10.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          onTap: () {
                            Future.delayed(
                              Duration(seconds: 2),
                              () {
                                setState(() {});
                              },
                            );
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LottieBuilder.asset(
                                      'assets/Lottie/LoadingChat.json',
                                      width: 25.h,
                                    ),
                                    CommonText(
                                      label: '',
                                      colorT: Colors.black,
                                      size: 12.sp,
                                    )
                                  ],
                                );
                              },
                            );
                            imgpath.value != ''
                                ? ChatForumController.AddNewConversation(
                                    userID: SigunpController.CurrentuserID
                                        .toString(),
                                    title: Title.text,
                                    descrpition: Description.text,
                                    file: imgpath.value,
                                    context: context)
                                : ChatForumController
                                    .AddConversationWithoutAttachment(
                                        userID: SigunpController.CurrentuserID
                                            .toString(),
                                        title: Title.text,
                                        descrpition: Description.text,
                                        context: context);
                          },
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 3.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
