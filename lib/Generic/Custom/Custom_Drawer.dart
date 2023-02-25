import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/My_Profile/Contact_Us.dart';
import 'package:tssia_replica/Screens/Sign_Up/LoginScreen.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  var SigunpController = Get.put(signupcontroller());

  @override
  Widget build(BuildContext context) {
    SigunpController.getIDfunction();
    return SafeArea(
      child: Container(
        width: 33.5.h,
        decoration: BoxDecoration(
            color: PWhite,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(6), bottomRight: Radius.circular(6))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(1.2.h),
            decoration: BoxDecoration(
              color: Color(0xffFFF7F7),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6)),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close_outlined,
                          color: mainBlue,
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.2.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 6.0.h,
                        width: 6.0.h,
                        margin: EdgeInsets.only(right: 1.h),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5, color: Color(0xffe4e4e4)),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn-icons-png.flaticon.com/512/236/236832.png'))),
                      ),
                      FutureBuilder(
                        future: SigunpController.Signin(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              height: 24.h,
                              width: 100.w,
                              child: CustomLoader(),
                            );
                          }
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 20.h,
                                child: CommonText(
                                  label:
                                      '${SigunpController.MemberName == null ? '' : SigunpController.MemberName}',
                                  size: 12.sp,
                                  fontw8: FontWeight.w400,
                                  colorT: Colors.black,
                                  maxline: 1,
                                ),
                              ),
                              SizedBox(
                                width: 20.h,
                                child: CommonText(
                                  label:
                                      '${SigunpController.CurrentuserEmail == null ? '' : SigunpController.CurrentuserEmail}',
                                  size: 12.sp,
                                  fontw8: FontWeight.w400,
                                  colorT: Colors.black,
                                  maxline: 1,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Padding(
            padding: EdgeInsets.all(1.2.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  Get.to(ContactUs());
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}Contact Us.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Contact Us',
                        size: 12.sp,
                        fontw8: FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                    url: 'https://www.msmebharatmanch.com/our-mission',
                    label: 'Our Mission',
                  ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}Terms & conditions.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Our Mission',
                        size: 12.sp,
                        fontw8: FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                    url: 'https://www.msmebharatmanch.com/the-board',
                    label: 'The Board',
                  ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}Terms & conditions.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'The Board',
                        size: 12.sp,
                        fontw8: FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                    url: 'https://www.msmebharatmanch.com/our-partners',
                    label: 'Our Partners',
                  ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}Terms & conditions.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Our Partners',
                        size: 12.sp,
                        fontw8: FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                    url: 'https://www.msmebharatmanch.com/our-team',
                    label: 'Our Team',
                  ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}Terms & conditions.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Our Team', size: 12.sp, fontw8: FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 3.5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                    url: 'https://msmebharatmanch.com/term-condition',
                    label: 'Terms And Conditions',
                  ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}Terms & conditions.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Terms & Conditions',
                        size: 12.sp,
                        fontw8: FontWeight.w400)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.5.h),
                child: GestureDetector(
                  onTap: () {
                    Get.to(WebviewScreen(
                      label: 'Privacy Policy',
                      url: 'https://msmebharatmanch.com/privacy-policy',
                    ));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.network(
                        '${ImagePath}Privacy Policy.svg',
                      ),
                      SizedBox(
                        width: 1.5.h,
                      ),
                      CommonText(
                          label: 'Privacy Policy',
                          size: 12.sp,
                          fontw8: FontWeight.w400)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  setState(() {
                    Get.offAll(LoginScreen(), transition: transitonEffect);
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      '${ImagePath}logout.svg',
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                      label: 'Logout',
                      size: 12.sp,
                      fontw8: FontWeight.w400,
                    )
                  ],
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
