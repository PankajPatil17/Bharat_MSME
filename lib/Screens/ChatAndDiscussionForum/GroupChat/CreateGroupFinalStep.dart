import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/ChatAndDiscussionController.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class CreateGroupFinalStep extends StatefulWidget {
  const CreateGroupFinalStep({super.key});

  @override
  State<CreateGroupFinalStep> createState() => _CreateGroupFinalStepState();
}

class _CreateGroupFinalStepState extends State<CreateGroupFinalStep> {
  var SigunpController = Get.put(signupcontroller());
  var ChatForumController = Get.put(ChatAndDiscussionController());
  var tapcolor;
  var imgpath = ''.obs;
  FilePickerResult? result;
  TextEditingController Name = TextEditingController();
  TextEditingController Description = TextEditingController();

  @override
  void initState() {
    tapcolor = 'Chat';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: FloatingActionButton(
            onPressed: () {
              if (imgpath.value == '') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Group Image is mandatory"),
                ));
              } else {
                ChatForumController.CreateGroup(
                    GroupName: Name.text,
                    context: context,
                    file: imgpath.value,
                    UserID: SigunpController.CurrentuserID.toString());
              }
            },
            backgroundColor: mainColor,
            child: Icon(
              Icons.done_rounded,
              color: Colors.white,
            )),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: CommonText(
          label: 'Create Group',
          colorT: mainColor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        titleTextStyle: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13.sp),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(1.5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      return InkWell(
                          onTap: () async {
                            result = await FilePicker.platform
                                .pickFiles(allowMultiple: false);
                            if (result == null) {
                              print("No file selected");
                            } else {
                              result?.files.forEach((element) {
                                // print('asdasd${element.path}');
                                imgpath.value = element.path!;
                                print(element.path);
                              });
                            }
                          },
                          child: imgpath.value == ''
                              ? Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.5.h),
                                  padding: EdgeInsets.all(1.5.h),
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.h))),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 10.h,
                                    color: Colors.white70,
                                  ),
                                )
                              : Container(
                                  height: 20.h,
                                  width: 20.h,
                                  margin: EdgeInsets.symmetric(vertical: 1.5.h),
                                  padding: EdgeInsets.all(0.5.h),
                                  decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.h))),
                                  child: ClipOval(
                                    child: Image.file(
                                      File(imgpath.value.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ));
                    }),
                    SizedBox(
                      height: 1.h,
                    ),
                    TextFormField(
                      controller: Name,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        hintText: 'Add Group Name',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Lato',
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFormField(
                      controller: Description,
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 4),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        hintText: 'Write Description here...',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Lato',
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 1.2.h,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CommonText(
                        label: 'Selected Members',
                        colorT: Colors.black,
                        fontw8: FontWeight.w600,
                        size: 12.sp,
                      ),
                    ),
                    ListView.builder(
                      itemCount:
                          ChatForumController.GrpMembersFinalArrayOfName.length,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 100.w,
                          margin: EdgeInsets.symmetric(vertical: 1.h),
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: MainBorderRadius,
                              border: Border.all(color: mainColor)),
                          child: CommonText(
                            label: ChatForumController
                                .GrpMembersFinalArrayOfName[index]
                                .toString(),
                            colorT: Colors.black,
                            fontw8: FontWeight.w500,
                            size: 13.sp,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }
}
