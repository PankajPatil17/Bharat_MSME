import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Screens/Sign_Up/Registration/RegForGroup.dart';
import 'package:tssia_replica/Screens/Sign_Up/Registration/RegForMember.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  var checkradio = 'member';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
              Padding(
                padding: EdgeInsets.only(top: 1.2.h),
                child: Row(
                  children: [
                    MemberHeaderText('Register as'),
                    checkradio == 'member'
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
                      label: 'Group',
                      fontw8: FontWeight.w400,
                      size: 12.sp,
                    ),
                    checkradio == 'group'
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                checkradio = 'member';
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
              checkradio == 'group' ? RegForGroup() : RegForMember()
            ],
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
