import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class RegForMember extends StatefulWidget {
  const RegForMember({super.key});

  @override
  State<RegForMember> createState() => _RegForMemberState();
}

class _RegForMemberState extends State<RegForMember> {
  final formKey = GlobalKey<FormState>();
  bool checkvalue = false;
  var SigunpController = Get.put(signupcontroller());
  TextEditingController companyName = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController PanCard = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController refferal = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MemberHeaderText('Company Name'),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(24),
            child: TextFormField(
              controller: companyName,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please Enter Company Name';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(24)),
                fillColor: PWhite,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                hintText: 'Enter Your Company Name',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          MemberHeaderText('Username'),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(24),
            child: TextFormField(
              controller: Username,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please Enter Name of Username';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(24)),
                fillColor: PWhite,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Color(0xffe4e4e4),
                  ),
                ),
                hintText: 'Enter Your Username',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          MemberHeaderText('PanCard'),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(24),
            child: TextFormField(
              controller: PanCard,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please Enter PanCard';
                }
                return null;
              },
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(24)),
                fillColor: PWhite,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Color(0xffe4e4e4),
                  ),
                ),
                hintText: 'Enter Your PanCard',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          MemberHeaderText('Email'),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(24),
            child: TextFormField(
              controller: email,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please Enter Email';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(24)),
                fillColor: PWhite,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
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
          ),
          MemberHeaderText('Enter Referral'),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(24),
            child: TextFormField(
              controller: refferal,
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Please Enter Referral code';
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(24)),
                fillColor: PWhite,
                filled: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Color(0xffe4e4e4),
                  ),
                ),
                hintText: 'Enter Your Referral code',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          MemberHeaderText('Mobile Number'),
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(24),
            child: TextFormField(
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
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 0.5),
                    borderRadius: BorderRadius.circular(24)),
                fillColor: PWhite,
                filled: true,
                counterText: '',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    color: Color(0xffe4e4e4),
                  ),
                ),
                hintText: 'Enter Your Mobile Number',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11.sp,
                    fontFamily: 'Poppins'),
              ),
            ),
          ),
          SizedBox(
            height: 1.4.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
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
                          size: 10.sp,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Get.to(WebviewScreen(
                                  url:
                                      'https://msmebharatmanch.com/term-condition',
                                  label: 'Terms & Condition'));
                            });
                          },
                          child: Text(
                            'Terms & Condition ',
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                color: Color(0xffBF2025),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          label: 'and ',
                          fontw8: FontWeight.w400,
                          size: 10.sp,
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
                                fontSize: 10.sp,
                                fontFamily: 'Poppins',
                                color: Color(0xffBF2025),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              style: TextButton.styleFrom(
                elevation: 1,
                backgroundColor: Color(0xffBF2025),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (checkvalue == true) {
                    LoginLoader();
                    Future.delayed(Duration(milliseconds: 100), () {
                      SigunpController.RegSignUpMember(
                          companyname: companyName.text,
                          email: email.text,
                          mobile: mobile.text,
                          name: Username.text,
                          pancard: PanCard.text,
                          referral: refferal.text,
                          regtype: 'member',
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
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.9.h, vertical: 0.2.h),
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
      padding: EdgeInsets.symmetric(vertical: 1.8.h),
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