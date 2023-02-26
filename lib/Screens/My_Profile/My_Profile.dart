import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:store_redirect/store_redirect.dart';
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
    '${ImagePath}Contact Us.svg',
    // '${ImagePath}Terms & conditions.svg',
    '${ImagePath}Privacy Policy.svg',
    '${ImagePath}Rate_Us.svg',
    '${ImagePath}logout.svg',
  ];
  List titles = [
    'Contact Us',
    // 'Terms & Condition',
    'Privacy Policy',
    'Rate Us',
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
                    height: 16.h,
                    padding: EdgeInsets.all(2.5.h),
                    margin: EdgeInsets.only(
                      bottom: 2.5.h,
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: Color.fromARGB(255, 244, 225, 219),
                              offset: Offset(0, 1))
                        ],
                        color: Color(0xffFFF7F7),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                    size: 11.sp,
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
                          } else if (index == 1) {
                            Get.to(WebviewScreen(
                              label: 'Privacy Policy',
                              url: 'https://msmebharatmanch.com/privacy-policy',
                            ));
                          } else if (index == 2) {
                            StoreRedirect.redirect(
                                androidAppId: 'com.msmebharat', iOSAppId: '');
                          } else if (index == 3) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.clear();
                            Get.offAll(LoginScreen(),
                                transition: transitonEffect);
                          }
                        },
                        child: Container(
                          width: 100.w,
                          alignment: Alignment.center,
                          margin:
                              EdgeInsets.only(left: 2.h, right: 2.h, top: 2.h),
                          decoration: BoxDecoration(
                              color: PWhite,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/Profile_Shape.png')),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Color.fromARGB(255, 244, 225, 219),
                                    offset: Offset(0, 1))
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(18),
                                bottomRight: Radius.circular(18),
                              )),
                          child: Row(
                            children: [
                              Container(
                                width: 0.5.h,
                                margin: EdgeInsets.only(right: 2.h),
                                height: 7.h,
                                color: Color(0xffBF2025),
                              ),
                              SvgPicture.network("${images[index]}"),
                              SizedBox(
                                width: 2.h,
                              ),
                              CommonText(
                                colorT: Colors.black,
                                fontw8: FontWeight.w500,
                                label: "${titles[index]}",
                                size: 10.sp,
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 2.5.h,
                                  ))
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
