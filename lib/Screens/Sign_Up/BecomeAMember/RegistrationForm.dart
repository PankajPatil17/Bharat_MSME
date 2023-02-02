import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController companyName = TextEditingController();
  TextEditingController Username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Confirmpassword = TextEditingController();
  TextEditingController mobile = TextEditingController();
  var checkradio = 'group';
  var SigunpController = Get.put(signupcontroller());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  child: Center(
                    child: CommonText(
                      label: 'Registration Form',
                      fontw8: FontWeight.w600,
                      size: 13.sp,
                      colorT: Color(0xffBF2025),
                    ),
                  ),
                ),
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
                MemberHeaderText('Password'),
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(24),
                  child: TextFormField(
                    controller: password,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter Your Password';
                      }
                      return null;
                    },
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
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                MemberHeaderText('Confirm Password'),
                Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(24),
                  child: TextFormField(
                    controller: Confirmpassword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter Your Confirm Password';
                      }
                      return null;
                    },
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
                      hintText: 'Enter Your Confirm Password',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  child: Row(
                    children: [
                      MemberHeaderText('Register as'),
                      checkradio == 'Member'
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  checkradio = 'group';
                                });
                              },
                              icon: Icon(
                                Icons.radio_button_off,
                                size: 3.h,
                                color: Colors.red,
                              ))
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.radio_button_checked,
                                size: 3.h,
                                color: Colors.red,
                              )),
                      CommonText(
                        label: 'Association',
                        fontw8: FontWeight.w400,
                        size: 12.sp,
                      ),
                      checkradio == 'group'
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  checkradio = 'Member';
                                });
                              },
                              icon: Icon(
                                Icons.radio_button_off,
                                size: 3.h,
                                color: Colors.red,
                              ))
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.radio_button_checked,
                                size: 3.h,
                                color: Colors.red,
                              )),
                      CommonText(
                        label: 'Member',
                        fontw8: FontWeight.w400,
                        size: 12.sp,
                      ),
                    ],
                  ),
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
                        if (password.text == Confirmpassword.text) {
                          SigunpController.SignUp(
                              companyname: companyName.text,
                              name: Username.text,
                              email: email.text,
                              mobile: mobile.text,
                              pass: password.text,
                              confirmpass: Confirmpassword.text,
                              regtype: checkradio.toString(),
                              context: context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Password Should match with Confirm Password"),
                          ));
                        }
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.9.h, vertical: 0.2.h),
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
          ),
        ),
      )),
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
}
