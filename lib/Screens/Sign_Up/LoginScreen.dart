import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tssia_replica/Screens/Sign_Up/Registration/RegistrationForm.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobile = TextEditingController();
  var SigunpController = Get.put(signupcontroller());
  final formKey = GlobalKey<FormState>();
  bool checkvalue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30.h,
                width: 100.w,
                margin: EdgeInsets.only(bottom: 2.5.h),
                decoration: BoxDecoration(
                    color: Color(0xffFFF7F7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/Login_Image.svg',
                  ),
                ),
              ),
              Center(
                child: CommonText(
                  label: 'Login',
                  colorT: Color(0xffBF2025),
                  fontw8: FontWeight.w500,
                  size: 18.sp,
                ),
              ),
              Container(
                padding: EdgeInsets.all(1.5.h),
                margin: EdgeInsets.only(top: 2.5.h, left: 1.5.h, right: 1.5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: PWhite,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 2,
                          color: Color(0xffFFEAE1),
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      label: 'Mobile Number',
                      size: 11.sp,
                      colorT: Colors.black,
                      fontw8: FontWeight.w400,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 1.2.h, top: 1.h),
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
                          counterText: '',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                          fillColor: PWhite,
                          filled: true,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffe4e4e4))),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffc0c0c0))),
                          hintText: 'Enter Your Mobile Number',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Color(0xffFFFFFF),
                          fillColor:
                              MaterialStateProperty.all(Color(0xffBF2025)),
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
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (formKey.currentState!.validate()) {
                              if (checkvalue == true) {
                                LoginLoader();
                                Future.delayed(Duration(milliseconds: 100), () {
                                  SigunpController.Signin(
                                      mobilenum: mobile.text, context: context);
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
                          });
                        },
                        child: Container(
                          height: 5.h,
                          width: 32.w,
                          margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
                          decoration: BoxDecoration(
                              color: Color(0xffBF2025),
                              borderRadius: MainBorderRadius),
                          child: Center(
                            child: CommonText(
                                label: 'Login',
                                colorT: Colors.white,
                                fontw8: FontWeight.w400,
                                size: 12.sp),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(RegistrationForm());
                        },
                        child: CommonText(
                          label: 'Create Account',
                          colorT: Color(0xffD82A1B),
                          fontw8: FontWeight.w500,
                          size: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
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
