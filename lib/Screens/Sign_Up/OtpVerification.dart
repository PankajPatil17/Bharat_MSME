import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

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
                      height: 42.h,
                    ),
                  ),
                ),
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
                  padding: EdgeInsets.only(bottom: 2.4.h, top: 2.h),
                  child: Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(24),
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
                        hintText: 'Enter Your OTP',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 11.sp,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          SigunpController.OtpVerify(
                              otp: OTP.text, context: context);
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
          ),
        ),
      )),
    );
  }
}
