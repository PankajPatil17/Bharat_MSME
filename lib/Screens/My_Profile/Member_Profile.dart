import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/MemberController.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

class MemberProfile extends StatefulWidget {
  const MemberProfile({super.key});

  @override
  State<MemberProfile> createState() => _MemberProfileState();
}

class _MemberProfileState extends State<MemberProfile> {
  var ChangeTab = 'Central';

  var membercontroller = Get.put(MemberProfileController());

  TextEditingController companyName = TextEditingController();

  @override
  void initState() {
    super.initState();
    membercontroller.getCompanyDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              height: 7.h,
              width: 100.h,
              padding: EdgeInsets.all(1.2.h),
              decoration: BoxDecoration(
                  color: PWhite,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, 4))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0XFFA8A8A8),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  CommonImage(
                    url: 'assets/images/Bharat_Logo.png',
                    height: 8.h,
                    width: 8.h,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: 100.h,
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 5.h,
                          height: 0.1.h,
                          color: Color(0xffBF2025),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: CommonText(
                            label: 'Company Information',
                            fontw8: FontWeight.w500,
                            size: 13.sp,
                            colorT: Colors.black,
                          ),
                        ),
                        Container(
                          width: 5.h,
                          height: 0.1.h,
                          color: Color(0xffBF2025),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.5.h, bottom: 1.8.h),
                        child: CommonText(
                          label: 'Please fill all the details for verification',
                          fontw8: FontWeight.w400,
                          size: 10.sp,
                          maxline: 1,
                          overflow: TextOverflow.ellipsis,
                          colorT: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    NumberSequence(),
                    CompanyDetails()
                  ],
                ),
              ),
            )),
            CommonBottomBar(TapColor: '')
          ],
        ),
      ),
    );
  }

  NumberSequence() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sequence(
            BorderColor: mainBlue,
            NumberColor: mainBlue,
            BoxNumber: "1",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "2",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "3",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "4",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "5",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "6",
            BoxColor: PWhite),
      ],
    );
  }

  CompanyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CommonText(
            label: 'Company Details',
            fontw8: FontWeight.w400,
            size: 12.sp,
            colorT: mainBlue,
          ),
        ),
        HeaderText(Label: 'Company Name'),
        Material(
          elevation: 5,
          shadowColor: Color(0xffD1F1FF),
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            readOnly: true,
            controller: companyName,
            enableSuggestions: true,
            decoration: InputDecoration(
                hintText: 'Enter Your Company Name',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black26,
                    fontFamily: 'Poppins'),
                contentPadding: EdgeInsets.all(2.h),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffe4e4e4), width: 0.5),
                    borderRadius: BorderRadius.circular(40)),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffe4e4e4), width: 0.5),
                    borderRadius: BorderRadius.circular(40)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffe4e4e4), width: 0.5),
                    borderRadius: BorderRadius.circular(40)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffe4e4e4), width: 0.5),
                    borderRadius: BorderRadius.circular(40)),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
      ],
    );
  }
}
