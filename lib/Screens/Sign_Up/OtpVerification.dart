import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController OTP = TextEditingController();

  var SigunpController = Get.put(signupcontroller());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                padding: EdgeInsets.all(5.h),
                margin: EdgeInsets.only(bottom: 6.5.h),
                decoration: BoxDecoration(
                    color: Color(0xffFFF7F7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    )),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    '${ImagePath}Login_Image.png',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(1.5.h),
                margin: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: PWhite,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          color: Color(0xffFFEAE1),
                          offset: Offset(0, 1))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CommonText(
                        label: 'Verify OTP',
                        colorT: Color(0xffD82A1B),
                        fontw8: FontWeight.w500,
                        size: 14.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 2.4.h, top: 2.h, left: 2.h, right: 2.h),
                      child: TextFormField(
                        maxLength: 6,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Your OTP';
                          } else if (val.length != 6) {
                            return "Please Enter Your OTP";
                          }
                          return null;
                        },
                        controller: OTP,
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
                              borderSide: BorderSide(color: Color(0xffe4e4e4))),
                          hintText: 'Enter Your OTP',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11.sp,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                          String? fcmKey = await getFcmToken();
                          print('FCM Key : $fcmKey');
                          if (formKey.currentState!.validate()) {
                            SigunpController.OtpVerify(
                                otp: OTP.text, context: context);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 3.h),
                          height: 5.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                              color: Color(0xffBF2025),
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: CommonText(
                                label: 'Verify',
                                colorT: Colors.white,
                                fontw8: FontWeight.w400,
                                size: 12.sp),
                          ),
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
}
