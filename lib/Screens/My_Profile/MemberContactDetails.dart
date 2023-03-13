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

class MemberContactDetails extends StatefulWidget {
  const MemberContactDetails({super.key});

  @override
  State<MemberContactDetails> createState() => _MemberContactDetailsState();
}

class _MemberContactDetailsState extends State<MemberContactDetails> {
  final formKey = GlobalKey<FormState>();

  var membercontroller = Get.put(MemberProfileController());
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController mailid = TextEditingController();
  TextEditingController website = TextEditingController();

  @override
  void initState() {
    super.initState();
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
                child: Form(
                  key: formKey,
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
                            label:
                                'Please fill all the details for verification',
                            fontw8: FontWeight.w400,
                            size: 10.sp,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            colorT: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      NumberSequence(),
                      ContactDetails(),
                      SaveButton()
                    ],
                  ),
                ),
              ),
            )),
            CommonBottomBar(TapColor: '')
          ],
        ),
      ),
    );
  }

  ContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CommonText(
            label: 'Contact Details',
            fontw8: FontWeight.w400,
            size: 12.sp,
            colorT: mainBlue,
          ),
        ),
        HeaderText(Label: 'Contact Number'),
        Material(
          shadowColor: Color.fromARGB(255, 253, 124, 112),
          borderRadius: BorderRadius.circular(6),
          color: PWhite,
          child: TextFormField(
            controller: mobilenumber,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'The Mobile Number field is required';
              } else if (v.length != 10) {
                return 'The Mobile Number field is not in the correct format';
              }
              return null;
            },
            maxLength: 10,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                counterText: '',
                hintText: 'Enter Customer Care No.',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black54,
                    fontFamily: 'Poppins'),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Color(0xffb2b2b2),
                      width: 0.5,
                    )),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        HeaderText(Label: 'Mail ID'),
        Material(
          shadowColor: Color.fromARGB(255, 253, 124, 112),
          borderRadius: BorderRadius.circular(6),
          color: PWhite,
          child: TextFormField(
            controller: mailid,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'The Mail Id is required';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'Enter Mail ID',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black54,
                    fontFamily: 'Poppins'),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Color(0xffb2b2b2),
                      width: 0.5,
                    )),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        HeaderText(Label: 'Website'),
        Material(
          shadowColor: Color.fromARGB(255, 253, 124, 112),
          borderRadius: BorderRadius.circular(6),
          color: PWhite,
          child: TextFormField(
            controller: mobilenumber,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'The Website is required';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'Enter Website',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black54,
                    fontFamily: 'Poppins'),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: Color(0xffb2b2b2),
                      width: 0.5,
                    )),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
      ],
    );
  }

  SaveButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            // Get.to(());
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 4.h, bottom: 6.h),
          width: 45.w,
          height: 5.5.h,
          decoration: BoxDecoration(
            color: mainBlue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: CommonText(
            label: 'SAVE & NEXT',
            colorT: PWhite,
            fontw8: FontWeight.w500,
            size: 12.sp,
            overflow: TextOverflow.ellipsis,
            maxline: 1,
          ),
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
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "1",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "2",
            BoxColor: PWhite),
        Sequence(
            BorderColor: mainBlue,
            NumberColor: mainBlue,
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
}
