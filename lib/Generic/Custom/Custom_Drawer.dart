import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/My_Profile/Milestones.dart';
import 'package:tssia_replica/Screens/Order_History.dart';
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
              color: Color(0xffd8f9ff),
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
                  Get.to(OrderHistoryPage(), transition: transitonEffect);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Order_History.svg',
                      color: mainBlue,
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Order History',
                        size: 12.sp,
                        fontw8: FontWeight.w400)
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 3.5.h),
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.to(WebviewScreen(
              //         label: 'Legacy of Tssia',
              //         url: 'https://tssia.enirmaan.com/ts_lagacyoftssia',
              //       ));
              //     },
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SvgPicture.network(
              //           'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Legacy of Tssia.svg',
              //         ),
              //         SizedBox(
              //           width: 1.5.h,
              //         ),
              //         CommonText(
              //             label: 'Legacy of Tssia',
              //             size: 12.sp,
              //             fontw8: FontWeight.w400)
              //       ],
              //     ),
              //   ),
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Get.to(MileStones(), transition: transitonEffect);
              //   },
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SvgPicture.network(
              //         'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Milestones.svg',
              //       ),
              //       SizedBox(
              //         width: 1.5.h,
              //       ),
              //       CommonText(
              //           label: 'Milestone',
              //           size: 12.sp,
              //           fontw8: FontWeight.w400)
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 3.5.h),
              //   child: GestureDetector(
              //     onTap: () {
              //       Get.to(WebviewScreen(
              //         label: 'Activities',
              //         url: 'https://tssia.enirmaan.com/ts_activities',
              //       ));
              //     },
              //     child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         SvgPicture.network(
              //           'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Activities.svg',
              //         ),
              //         SizedBox(
              //           width: 1.5.h,
              //         ),
              //         CommonText(
              //             label: 'Activities',
              //             size: 12.sp,
              //             fontw8: FontWeight.w400)
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 3.5.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                    url: 'https://tssia.enirmaan.com/terms-and-conditions',
                    label: 'Terms And Conditions',
                  ));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.network(
                      'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Terms_and_Conditions.svg',
                      color: mainBlue,
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
                      url: 'https://tssia.enirmaan.com/privacy-policy',
                    ));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.network(
                        'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Privacy_Policy.svg',
                        color: mainBlue,
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
                onTap: () {
                  setState(() {
                    StoreRedirect.redirect(
                        androidAppId: 'com.medibhai',
                        iOSAppId: 'com.example.medibhaiproject');
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Rate_Us.svg',
                      color: mainBlue,
                    ),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                        label: 'Rate Us', size: 12.sp, fontw8: FontWeight.w400)
                  ],
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
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.5.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.network(
                        'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/logout.svg',
                        color: mainBlue,
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
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
