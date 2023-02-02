import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/My_Profile/Contact_Us.dart';
import 'package:tssia_replica/Screens/Order_History.dart';
import 'package:tssia_replica/Screens/Sign_Up/LoginScreen.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class MyProfile extends StatefulWidget {
  final emailId;

  const MyProfile({super.key, this.emailId});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  var tapcolor;
  var SigunpController = Get.put(signupcontroller());

  @override
  void initState() {
    tapcolor = 'Profile';
    super.initState();
  }

  List images = [
    'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Order_History.svg',
    // 'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Legacy of Tssia.svg',
    // 'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Milestones.svg',
    // 'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Activities.svg',
    'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Contact Us.svg',
    'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Terms_and_Conditions.svg',
    'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/Privacy_Policy.svg',
    'https://tssia.enirmaan.com/tssia/images/Home_Grid_Imgs/api_images/logout.svg',
  ];
  List titles = [
    'Order History',
    // 'Legacy of Tssia',
    // 'Milestones',
    // 'Activities',
    'Contact Us',
    'Terms & Condition',
    'Privacy Policy',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.emailId);
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            width: 100.h,
            padding: EdgeInsets.only(
              top: 2.2.h,
              right: 4.5.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.5.h),
                    margin: EdgeInsets.only(bottom: 2.5.h),
                    decoration: BoxDecoration(
                        boxShadow: Mainboxshadow,
                        color: PWhite,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(23),
                            topRight: Radius.circular(23))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 6.5.h,
                            width: 6.5.h,
                            margin: EdgeInsets.only(right: 1.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Color(0xffe4e4e4)),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cdn-icons-png.flaticon.com/512/236/236832.png')))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                    decoration: BoxDecoration(
                                      color: PWhite,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  );
                                }
                                return SizedBox(
                                  width: 30.h,
                                  child: CommonText(
                                    label:
                                        '${SigunpController.MemberName == null ? '' : SigunpController.MemberName}',
                                    size: 12.sp,
                                    fontw8: FontWeight.w500,
                                    colorT: Colors.black,
                                    maxline: 1,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 30.h,
                              child: CommonText(
                                label:
                                    '${SigunpController.CurrentuserEmail == null ? '' : SigunpController.CurrentuserEmail}',
                                size: 12.sp,
                                fontw8: FontWeight.w400,
                                colorT: Colors.black,
                                maxline: 1,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: titles.length,
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (index == 0) {
                            Get.to(OrderHistoryPage(),
                                transition: transitonEffect);
                          }
                          // else if (index == 1) {
                          //   Get.to(WebviewScreen(
                          //     label: 'Legacy of Tssia',
                          //     url:
                          //         'https://tssia.enirmaan.com/ts_lagacyoftssia',
                          //   ));
                          // }
                          // else if (index == 2) {
                          //   Get.to(MileStones(), transition: transitonEffect);
                          // }
                          //  else if (index == 3) {
                          //   Get.to(WebviewScreen(
                          //     label: 'Activities',
                          //     url: 'https://tssia.enirmaan.com/ts_activities',
                          //   ));
                          // }
                          else if (index == 1) {
                            Get.to(ContactUs());
                          } else if (index == 2) {
                            Get.to(WebviewScreen(
                              url: 'https://msmebharatmanch.com/term-condition',
                              label: 'Terms And Conditions',
                            ));
                          } else if (index == 3) {
                            Get.to(WebviewScreen(
                              label: 'Privacy Policy',
                              url: 'https://msmebharatmanch.com/privacy-policy',
                            ));
                          } else if (index == 4) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.clear();
                            Get.offAll(LoginScreen(),
                                transition: transitonEffect);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(1.7.h),
                          margin: EdgeInsets.only(bottom: 2.1.h),
                          decoration: BoxDecoration(
                              color: PWhite,
                              boxShadow: Mainboxshadow,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 1.h,
                              ),
                              SvgPicture.network(
                                "${images[index]}",
                                color: Color(0xffBF2025),
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              Text(
                                '${titles[index]}',
                                maxLines: 1,
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.sp,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          )),
          CommonBottomBar(TapColor: tapcolor)
        ],
      )),
    );
  }
}
