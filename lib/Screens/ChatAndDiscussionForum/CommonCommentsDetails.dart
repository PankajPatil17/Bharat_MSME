import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonCommentsDetails extends StatefulWidget {
  final userId;
  final postID;

  const CommonCommentsDetails(
      {super.key, required this.userId, required this.postID});

  @override
  State<CommonCommentsDetails> createState() => _CommonCommentsDetailsState();
}

class _CommonCommentsDetailsState extends State<CommonCommentsDetails> {
  var SigunpController = Get.put(signupcontroller());
  var ChatForumController = Get.put(ChatAndDiscussionController());
  final formKey = GlobalKey<FormState>();
  TextEditingController Description = TextEditingController();
  var imgpath = ''.obs;
  FilePickerResult? result;
  var filename;
  var fileType;
  var _url;
  var statusCodelike = true;
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    SigunpController.isStopped = false;
    sec5Timer();
    super.initState();
  }

  sec5Timer() {
    Timer.periodic(Duration(seconds: 4), (timer) {
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
    return Scaffold(
      backgroundColor: PWhite,
      appBar: PreferredSize(
          child: SafeArea(
              child: Container(
            height: 7.h,
            width: 100.h,
            padding: EdgeInsets.all(1.2.h),
            decoration: BoxDecoration(color: PWhite, boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
            ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: mainBlue,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    );
                  },
                ),
                CommonImage(
                  url: 'assets/images/Bharat_Logo.png',
                  height: 6.h,
                  width: 6.h,
                ),
              ],
            ),
          )),
          preferredSize: Size(100.h, 20.h)),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: ChatForumController.AllPostwithCommentsList(
                          userId: widget.userId, postID: widget.postID),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [MainCommentPost(), OtherComments()],
                        );
                      }))),
          AddComment()
        ],
      ),
    );
  }

  //AddComment

  AddComment() {
    return Obx(() {
      return Container(
        width: 100.w,
        margin: EdgeInsets.all(1.h),
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            color: PWhite,
            boxShadow: Mainboxshadow,
            borderRadius: MainBorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgpath.value == ''
                ? Container()
                : Container(
                    margin: EdgeInsets.all(1.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 2.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: MainBorderRadius,
                        color: PWhite),
                    child: CommonText(
                      label: '${filename}',
                      fontw8: FontWeight.w600,
                      size: 10.sp,
                      colorT: Colors.black,
                      maxline: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
            Row(
              children: [
                Container(
                  height: 4.0.h,
                  width: 4.0.h,
                  margin: EdgeInsets.only(right: 1.h),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xffe4e4e4)),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                ),
                SizedBox(
                  width: 2.w,
                ),
                SizedBox(
                  height: 4.4.h,
                  width: 62.w,
                  child: TextFormField(
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
                          fontFamily: 'Poppins',
                          color: Mainfentbackgrey),
                    ),
                  ),
                ),
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
                    color: mainColor,
                    size: 3.h,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
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
                        ? ChatForumController.AddNewConversationwithParent(
                            userID: SigunpController.CurrentuserID.toString(),
                            title: ChatForumController
                                .CommentsParentsWholedata['post_details']
                                    ['parent_details']['title']
                                .toString(),
                            descrpition: Description.text,
                            parentID: widget.postID.toString(),
                            file: imgpath.value,
                            context: context)
                        : ChatForumController
                            .AddConversationWithoutAttachmentwithParent(
                                userID:
                                    SigunpController.CurrentuserID.toString(),
                                title: ChatForumController
                                    .CommentsParentsWholedata['post_details']
                                        ['parent_details']['title']
                                    .toString(),
                                descrpition: Description.text,
                                parentID: widget.postID.toString(),
                                context: context);
                  },
                  child: Icon(
                    Icons.send,
                    color: mainColor,
                    size: 3.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

//other comments

  OtherComments() {
    return ListView.builder(
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: ChatForumController.GetPostWithComments.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 100.w,
          margin: EdgeInsets.only(
              top: 2.4.h, bottom: 2.4.h, right: 2.4.h, left: 12.h),
          padding: EdgeInsets.all(1.h),
          decoration: BoxDecoration(
              color: Color(0xffF6FFF7),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 1,
                    color: Color.fromARGB(255, 147, 233, 161),
                    offset: Offset(0, 1))
              ],
              borderRadius: MainBorderRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                                'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  CommonText(
                    label: ChatForumController.GetPostWithComments[index]
                            ['founder_name']
                        .toString()
                        .capitalizeFirst,
                    colorT: Colors.black,
                    fontw8: FontWeight.w500,
                    size: 11.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              CommonText(
                label: ChatForumController.GetPostWithComments[index]['message']
                    .toString()
                    .capitalizeFirst,
                colorT: Colors.black,
                fontw8: FontWeight.w400,
                size: 11.sp,
              ),
              ChatForumController.GetPostWithComments[index]
                          ['attachment_file'] ==
                      ''
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        _url = Uri.parse(
                            '${ChatForumController.GetPostWithComments[index]['attachment_file']}');
                        Future.delayed(Duration(milliseconds: 100), () {
                          _launchUrl(_url);
                        });
                      },
                      child: Container(
                        width: 100.w,
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(0.5.h),
                        decoration: BoxDecoration(
                            color: PWhite, borderRadius: MainBorderRadius),
                        child:
                            '${ChatForumController.GetPostWithComments[index]['attachment_file']}'
                                    .contains('pdf')
                                ? Row(
                                    children: [
                                      Expanded(
                                          child: Icon(
                                        Icons.file_present_rounded,
                                        color: mainColor,
                                        size: 3.5.h,
                                      )),
                                      SizedBox(
                                        width: 70.w,
                                        child: CommonText(
                                          label:
                                              '${ChatForumController.GetPostWithComments[index]['attachment_file']}',
                                          fontw8: FontWeight.w500,
                                          maxline: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                : Image.network(
                                    height: 20.h,
                                    '${ChatForumController.GetPostWithComments[index]['attachment_file']}',
                                  ),
                      ),
                    ),
              Align(
                alignment: Alignment.centerRight,
                child: CommonText(
                  label: ChatForumController.GetPostWithComments[index]
                          ['created_at']
                      .toString()
                      .replaceRange(9, 18, ''),
                  colorT: Colors.black,
                  fontw8: FontWeight.w400,
                  size: 9.sp,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //MainCommentPost

  MainCommentPost() {
    statusCodelike = ChatForumController
        .CommentsParentsWholedata['post_details']['parent_details']['is_like'];
    return Container(
      width: 68.w,
      margin: EdgeInsets.all(2.4.h),
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          color: Color(0xffFFF5E2),
          border: Border.all(color: Color(0xffF3AE33)),
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                spreadRadius: 2,
                color: Color(0xffFFDEA2),
                offset: Offset(0, 2))
          ],
          borderRadius: MainBorderRadius),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                                'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  CommonText(
                    label: ChatForumController
                        .CommentsParentsWholedata['post_details']
                            ['parent_details']['founder_name']
                        .toString()
                        .capitalizeFirst,
                    colorT: Colors.black,
                    fontw8: FontWeight.w500,
                    size: 11.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              CommonText(
                label: ChatForumController
                    .CommentsParentsWholedata['post_details']['parent_details']
                        ['message']
                    .toString()
                    .capitalizeFirst,
                colorT: Colors.black,
                fontw8: FontWeight.w400,
                size: 11.sp,
              ),
              ChatForumController.CommentsParentsWholedata['post_details']
                          ['parent_details']['attachment_file'] ==
                      ''
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        _url = Uri.parse(
                            '${ChatForumController.CommentsParentsWholedata['post_details']['parent_details']['attachment_file']}');
                        Future.delayed(Duration(milliseconds: 100), () {
                          _launchUrl(_url);
                        });
                      },
                      child: Container(
                        width: 100.w,
                        margin: EdgeInsets.symmetric(vertical: 1.h),
                        padding: EdgeInsets.all(0.5.h),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: MainBorderRadius),
                        child:
                            '${ChatForumController.CommentsParentsWholedata['post_details']['parent_details']['attachment_file']}'
                                    .contains('pdf')
                                ? Row(
                                    children: [
                                      Expanded(
                                          child: Icon(
                                        Icons.file_present_rounded,
                                        color: mainColor,
                                        size: 3.5.h,
                                      )),
                                      SizedBox(
                                        width: 70.w,
                                        child: CommonText(
                                          label:
                                              '${ChatForumController.CommentsParentsWholedata['post_details']['parent_details']['attachment_file']}',
                                          fontw8: FontWeight.w500,
                                          maxline: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                : Image.network(
                                    height: 20.h,
                                    '${ChatForumController.CommentsParentsWholedata['post_details']['parent_details']['attachment_file']}',
                                  ),
                      ),
                    ),
              Align(
                alignment: Alignment.centerRight,
                child: CommonText(
                  label: ChatForumController
                      .CommentsParentsWholedata['post_details']
                          ['parent_details']['created_at']
                      .toString()
                      .replaceRange(9, 18, ''),
                  colorT: Colors.black,
                  fontw8: FontWeight.w400,
                  size: 9.sp,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        statusCodelike = !statusCodelike;
                        if (statusCodelike == false) {
                          ChatForumController.LikePost(
                              PostID: ChatForumController
                                      .CommentsParentsWholedata['post_details']
                                  ['parent_details']['id'],
                              UserID: SigunpController.CurrentuserID.toString(),
                              status: 0);
                        } else {
                          ChatForumController.LikePost(
                              PostID: ChatForumController
                                      .CommentsParentsWholedata['post_details']
                                  ['parent_details']['id'],
                              UserID: SigunpController.CurrentuserID.toString(),
                              status: 1);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(1.h),
                      padding: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        color: PWhite,
                        boxShadow: Mainboxshadow,
                        shape: BoxShape.circle,
                      ),
                      child: statusCodelike == false
                          ? Icon(
                              Icons.favorite_border,
                              size: 2.5.h,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 2.5.h,
                            ),
                    ),
                  ),
                  CommonText(
                    label:
                        '${ChatForumController.CommentsParentsWholedata['post_details']['parent_details']['total_likes']}',
                    fontw8: FontWeight.w500,
                    size: 12.sp,
                  ),
                  Container(
                    margin: EdgeInsets.all(1.h),
                    padding: EdgeInsets.all(1.h),
                    decoration: BoxDecoration(
                      color: PWhite,
                      boxShadow: Mainboxshadow,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chat,
                      size: 2.5.h,
                    ),
                  ),
                  CommonText(
                    label:
                        '${ChatForumController.CommentsParentsWholedata['post_details']['no_of_comments']}',
                    fontw8: FontWeight.w500,
                    size: 12.sp,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
