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
                    padding: EdgeInsets.all(2.h),
                    child: SvgPicture.asset(
                      'assets/images/Login_Image.svg',
                      height: 30.h,
                    ),
                  ),
                ),
                CommonText(
                  label: 'Login',
                  colorT: Color(0xffD82A1B),
                  fontw8: FontWeight.w500,
                  size: 14.sp,
                ),
                SizedBox(
                  height: 1.h,
                ),
                CommonText(
                  label: 'Email',
                  size: 11.sp,
                  colorT: Colors.black,
                  fontw8: FontWeight.w400,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 1.2.h, top: 1.h),
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(24),
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
                        fillColor: PWhite,
                        filled: true,
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                CommonText(
                  label: 'Password',
                  size: 11.sp,
                  colorT: Colors.black,
                  fontw8: FontWeight.w400,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(24),
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
                        fillColor: PWhite,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.5),
                            borderRadius: BorderRadius.circular(24)),
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
                ),
                // Row(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           Get.to(ForgetPassword());
                //         },
                //         child: CommonText(
                //           label: 'Forget Password',
                //           fontw8: FontWeight.w400,
                //           size: 10.sp,
                //           colorT: Color(0xffAAAAAA),
                //         ),
                //       )
                //     ]),
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
