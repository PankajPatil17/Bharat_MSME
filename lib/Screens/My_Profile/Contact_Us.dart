// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/HomePage.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController remark = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        title: Padding(
          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
          child: CommonImage(
            url: 'assets/images/Bharat_Logo.png',
            height: 5.h,
            width: 5.h,
          ),
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13.sp),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(1.7.h),
            width: 100.h,
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/Lottie/Contact_Us.json'),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your name';
                        } else if (val.length < 3) {
                          return "Please enter full name";
                        }
                        return null;
                      },
                      controller: name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                        hintText: 'Enter Your Name',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Email';
                        }
                        return null;
                      },
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your Mobile Number';
                        }
                        return null;
                      },
                      controller: phone,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                        hintText: 'Enter Your Number',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    TextFormField(
                      controller: remark,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Color(0xffe4e4e4),
                          ),
                        ),
                        hintText: 'Remark',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              Get.to(HomePage());
                              Get.snackbar(
                                  'Success', 'Your Request Sent Successfully');
                            }
                          });
                        },
                        child: Container(
                          height: 5.h,
                          width: 32.w,
                          margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xffB65EBA),
                                Color(0xff2A8DE1),
                              ]),
                              borderRadius: MainBorderRadius),
                          child: Center(
                            child: CommonText(
                                label: 'Submit',
                                colorT: Colors.white,
                                fontw8: FontWeight.w400,
                                size: 12.sp),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
          CommonBottomBar(TapColor: '')
        ],
      )),
    );
  }
}
