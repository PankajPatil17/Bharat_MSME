import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class ForgetPasswordotp extends StatefulWidget {
  final email;

  const ForgetPasswordotp({super.key, required this.email});

  @override
  State<ForgetPasswordotp> createState() => _ForgetPasswordotpState();
}

class _ForgetPasswordotpState extends State<ForgetPasswordotp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController EnterOtp = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool _passwordVisible = true;
  var SigunpController = Get.put(signupcontroller());
  bool _confirmpasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Container(
        height: 8.h,
        width: 8.h,
        padding: EdgeInsets.only(top: 2.h, left: 1.h),
        child: FloatingActionButton(
            onPressed: () {
              Get.back();
            },
            backgroundColor: mainColor,
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            )),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Lottie.asset('assets/Lottie/Reset_Password.json'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: TextFormField(
                      maxLength: 6,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Enter Your OTP';
                        } else if (val.length < 6) {
                          return "Please enter valid OTP";
                        }
                        return null;
                      },
                      controller: EnterOtp,
                      keyboardType: TextInputType.number,
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
                        hintText: 'Enter OTP Here',
                        counterText: '',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Lato'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.2.h),
                    child: TextFormField(
                      validator: (v) {
                        if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])')
                                .hasMatch(v!) &&
                            v.length >= 8) {
                          return null;
                        } else {
                          return 'Required Number, Symbols, Uppercase and Lowercase';
                        }
                      },
                      controller: newpassword,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_open_rounded),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
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
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: Colors.black54,
                            fontFamily: 'Lato'),
                      ),
                      obscureText: !_passwordVisible,
                    ),
                  ),
                  TextFormField(
                    validator: (v) {
                      if (newpassword.text != confirmpassword.text) {
                        return 'New password and confirm password should be same';
                      } else {
                        return null;
                      }
                    },
                    obscureText: !_confirmpasswordVisible,
                    controller: confirmpassword,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _confirmpasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _confirmpasswordVisible = !_confirmpasswordVisible;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Color(0xffe4e4e4),
                        ),
                      ),
                      hintText: 'Confirm Your Password',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: Colors.black54,
                          fontFamily: 'Lato'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          SigunpController.ForgotPasswordVerify(
                              context: context,
                              email: widget.email,
                              otp: EnterOtp.text,
                              password: newpassword.text);
                        }
                      },
                      child: Container(
                        height: 5.5.h,
                        width: 50.w,
                        margin: EdgeInsets.only(top: 3.h),
                        decoration: BoxDecoration(
                            borderRadius: MainBorderRadius, color: mainColor),
                        child: Center(
                          child: CommonText(
                            label: 'Reset Password',
                            colorT: Colors.white,
                            fontw8: FontWeight.w400,
                            size: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
