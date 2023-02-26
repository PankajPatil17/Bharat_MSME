import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class RegForGroup extends StatefulWidget {
  const RegForGroup({super.key});

  @override
  State<RegForGroup> createState() => _RegForGroupState();
}

class _RegForGroupState extends State<RegForGroup> {
  var SigunpController = Get.put(signupcontroller());
  TextEditingController GroupName = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool checkvalue = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MemberHeaderText('Group Name'),
          TextFormField(
            controller: GroupName,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter Group Name';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              fillColor: PWhite,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1.0,
              ),
              hintText: 'Enter Group Name',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  fontFamily: 'Poppins'),
            ),
          ),
          MemberHeaderText('Username'),
          TextFormField(
            controller: Username,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter Name of Username';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              fillColor: PWhite,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1.0,
              ),
              hintText: 'Enter Your Username',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  fontFamily: 'Poppins'),
            ),
          ),
          MemberHeaderText('Email'),
          TextFormField(
            controller: email,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter Email';
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              fillColor: PWhite,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1.0,
              ),
              hintText: 'Enter Your Email',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  fontFamily: 'Poppins'),
            ),
          ),
          MemberHeaderText('Mobile Number'),
          TextFormField(
            controller: mobile,
            maxLength: 10,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter Mobile Number';
              } else if (val.length != 10) {
                return "Please Enter Mobile Number";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffcdcdcd))),
              fillColor: PWhite,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 1.0,
              ),
              hintText: 'Enter Your Mobile Number',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  fontFamily: 'Poppins'),
            ),
          ),
          SizedBox(
            height: 1.4.h,
          ),
          Row(
            children: [
              Checkbox(
                side: BorderSide(
                    style: BorderStyle.solid,
                    strokeAlign: 1.0,
                    color: mainColor),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: Color(0xffFFFFFF),
                fillColor: MaterialStateProperty.all(Color(0xffBF2025)),
                value: checkvalue,
                onChanged: (checkboxValue) {
                  setState(() {
                    checkvalue = checkboxValue ?? false;
                  });
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          label: 'I have read and accept the ',
                          fontw8: FontWeight.w400,
                          size: 9.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Get.to(WebviewScreen(
                                url:
                                    'https://msmebharatmanch.com/privacy-policy',
                                label: 'Privacy Policy',
                              ));
                            });
                          },
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: 'Poppins',
                                color: Color(0xffBF2025),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              if (formKey.currentState!.validate()) {
                if (checkvalue == true) {
                  LoginLoader();
                  Future.delayed(Duration(milliseconds: 100), () {
                    SigunpController.RegSignUpGroup(
                        email: email.text,
                        groupname: GroupName.text,
                        mobile: mobile.text,
                        name: Username.text,
                        regtype: 'group',
                        context: context);
                  });
                } else {
                  Fluttertoast.showToast(
                      msg: "Please accept conditions",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              }
            },
            child: Center(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 1.5.h),
                height: 5.h,
                width: 16.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: mainColor),
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  MemberHeaderText(memberLabel) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: CommonText(
        label: memberLabel,
        fontw8: FontWeight.w400,
        size: 11.sp,
      ),
    );
  }

  LoginLoader() {
    return showDialog(
      barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.all(8),
          content: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(label: 'Please Wait'),
                SizedBox(
                  width: 1.5.h,
                ),
                CircularProgressIndicator(
                  color: Color(0xffD82A1B),
                  strokeWidth: 2.75,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
