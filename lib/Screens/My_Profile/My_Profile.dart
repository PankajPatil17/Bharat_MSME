import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/My_Profile/Contact_Us.dart';
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
    'assets/images/Contact Us.svg',
    'assets/images/Terms & conditions.svg',
    'assets/images/Privacy Policy.svg',
    'assets/images/logout.svg',
  ];
  List titles = [
    'Contact Us',
    'Terms & Condition',
    'Privacy Policy',
    'Logout',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            width: 100.h,
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
                                  return CustomLoader();
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
                            Get.to(ContactUs());
                          } else if (index == 0) {
                            Get.to(WebviewScreen(
                              url: 'https://msmebharatmanch.com/term-condition',
                              label: 'Terms And Conditions',
                            ));
                          } else if (index == 2) {
                            Get.to(WebviewScreen(
                              label: 'Privacy Policy',
                              url: 'https://msmebharatmanch.com/privacy-policy',
                            ));
                          } else if (index == 3) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.clear();
                            Get.offAll(LoginScreen(),
                                transition: transitonEffect);
                          }
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 2.h, right: 2.h, top: 2.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(18),
                            bottomRight: Radius.circular(18),
                          )),
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
