import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/Sign_Up/Forget_Password/ForgetPassword.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';
import 'BecomeAMember/MemberForm01.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  var SigunpController = Get.put(signupcontroller());
  final formKey = GlobalKey<FormState>();
  bool checkvalue = false;

  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(3.h),
                    child: Lottie.asset('assets/Lottie/Login_Gif.json'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CommonText(
                    label: 'Welcome Back',
                    fontw8: FontWeight.w400,
                    size: 16.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.2.h, top: 2.h),
                  child: TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Your email';
                      } else if (val.length < 4) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  child: TextFormField(
                    obscureText: !_passwordVisible,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Please Enter Your Password';
                      } else if (v.length < 2) {
                        return "Please enter valid password";
                      }
                      return null;
                    },
                    controller: pass,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Color(0xffe4e4e4),
                        ),
                      ),
                      hintText: 'Enter Your Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xffBF2025),
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.black54,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Row(
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
                                            'https://tssia.enirmaan.com/terms-and-conditions',
                                        label: 'Terms & Condition'));
                                  });
                                },
                                child: Text(
                                  'Terms & Condition ',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 10.sp,
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
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          if (checkvalue == true) {
                            Future.delayed(Duration(milliseconds: 100), () {
                              SigunpController.Signin(
                                  empId: email.text, pass: pass.text);
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(ForgetPassword());
                        },
                        child: CommonText(
                          label: 'Forgot Password',
                          fontw8: FontWeight.w600,
                          size: 12.sp,
                        ),
                      ),
                      Container(
                        height: 2.h,
                        width: 0.5.w,
                        color: mainColor,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(MemberForm01());
                        },
                        child: CommonText(
                          label: 'Become a Member',
                          fontw8: FontWeight.w600,
                          size: 12.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
