import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
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
          child: SingleChildScrollView(
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18.h,
              width: 100.w,
              margin: EdgeInsets.only(bottom: 2.5.h),
              padding: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                  color: Color(0xffFFF7F7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.network(
                    '${ImagePath}Registration.svg',
                  ),
                  SizedBox(
                    width: 2.5.h,
                  ),
                  CommonText(
                    label: 'Registration',
                    fontw8: FontWeight.w500,
                    size: 14.sp,
                    colorT: mainColor,
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 13.5.h,
                  color: Colors.transparent,
                ),
                Container(
                  width: 100.w,
                  padding: EdgeInsets.all(1.5.h),
                  margin:
                      EdgeInsets.only(left: 1.5.h, right: 1.5.h, bottom: 2.h),
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
                      Padding(
                        padding:
                            EdgeInsets.only(top: 1.2.h, left: 2.h, right: 2.h),
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
              ],
            ),
          ],
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
