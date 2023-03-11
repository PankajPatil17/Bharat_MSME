import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';
import 'package:url_launcher/url_launcher.dart';

class SubsidiesPage extends StatefulWidget {
  const SubsidiesPage({super.key});

  @override
  State<SubsidiesPage> createState() => _SubsidiesPageState();
}

class _SubsidiesPageState extends State<SubsidiesPage> {
  var ChangeTab = 'Central';
  var _url;
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              height: 7.h,
              width: 100.h,
              padding: EdgeInsets.all(1.2.h),
              decoration: BoxDecoration(color: PWhite, boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
              ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0XFFA8A8A8),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  CommonImage(
                    url: 'assets/images/Bharat_Logo.png',
                    height: 8.h,
                    width: 8.h,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: 100.h,
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 5.h,
                          height: 0.1.h,
                          color: Color(0xffBF2025),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h),
                          child: CommonText(
                            label: 'Subsidies',
                            fontw8: FontWeight.w500,
                            size: 13.sp,
                            colorT: Colors.black,
                          ),
                        ),
                        Container(
                          width: 5.h,
                          height: 0.1.h,
                          color: Color(0xffBF2025),
                        ),
                      ],
                    ),
                    TabButtons(),
                    ChangeTab == 'Central'
                        ? Central()
                        : ChangeTab == 'State'
                            ? CommonText(
                                label: 'State',
                              )
                            : ChangeTab == 'SC'
                                ? CommonText(
                                    label: 'SC',
                                  )
                                : ChangeTab == 'Women'
                                    ? CommonText(
                                        label: 'Women',
                                      )
                                    : CommonText(
                                        label: 'Central',
                                      )
                  ],
                ),
              ),
            )),
            CommonBottomBar(TapColor: '')
          ],
        ),
      ),
    );
  }

  TabButtons() {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, bottom: 2.5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                ChangeTab = 'Central';
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 22.7.w,
              padding: EdgeInsets.only(bottom: 1.h),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ChangeTab == 'Central'
                              ? mainColor
                              : Color(0xffb2b2b2),
                          width: 1.5))),
              child: CommonText(
                label: 'Central',
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                size: 11.sp,
                fontw8: FontWeight.w500,
                colorT: ChangeTab == 'Central' ? mainColor : Color(0xff404040),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                ChangeTab = 'State';
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 22.7.w,
              padding: EdgeInsets.only(bottom: 1.h),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ChangeTab == 'State'
                              ? mainColor
                              : Color(0xffb2b2b2),
                          width: 1.5))),
              child: CommonText(
                label: 'State',
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                size: 11.sp,
                fontw8: FontWeight.w500,
                colorT: ChangeTab == 'State' ? mainColor : Color(0xff404040),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                ChangeTab = 'SC';
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 22.7.w,
              padding: EdgeInsets.only(bottom: 1.h),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color:
                              ChangeTab == 'SC' ? mainColor : Color(0xffb2b2b2),
                          width: 1.5))),
              child: CommonText(
                label: 'SC/ST',
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                size: 11.sp,
                fontw8: FontWeight.w500,
                colorT: ChangeTab == 'SC' ? mainColor : Color(0xff404040),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                ChangeTab = 'Women';
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 22.7.w,
              padding: EdgeInsets.only(bottom: 1.h),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ChangeTab == 'Women'
                              ? mainColor
                              : Color(0xffb2b2b2),
                          width: 1.5))),
              child: CommonText(
                label: 'Women',
                maxline: 1,
                overflow: TextOverflow.ellipsis,
                size: 11.sp,
                fontw8: FontWeight.w500,
                colorT: ChangeTab == 'Women' ? mainColor : Color(0xff404040),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Central() {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      controller: ScrollController(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(2.h),
          margin: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: Mainboxshadow,
              color: Color(0xffFFFCFC)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                label:
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et do',
                maxline: 3,
                overflow: TextOverflow.ellipsis,
                size: 12.sp,
                fontw8: FontWeight.w500,
                colorT: Color(0xffBF2025),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.8.h, bottom: 0.8.h),
                child: CommonText(
                  label:
                      'Scheme / Key features : Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et do Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et do',
                  maxline: 6,
                  overflow: TextOverflow.ellipsis,
                  size: 10.sp,
                  fontw8: FontWeight.w500,
                  colorT: Color(0xff696969),
                ),
              ),
              SizedBox(
                height: 0.8.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(WebviewScreen(
                      url: 'https://www.Medibhai.com/', label: ''));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/website.svg'),
                    SizedBox(
                      width: 1.5.h,
                    ),
                    CommonText(
                      label: 'https://www.maharashtra.in/',
                      maxline: 1,
                      overflow: TextOverflow.ellipsis,
                      size: 11.sp,
                      fontw8: FontWeight.w500,
                      colorT: Colors.black,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/images/state.svg'),
                  SizedBox(
                    width: 1.5.h,
                  ),
                  CommonText(
                    label: 'Maharashtra',
                    maxline: 3,
                    overflow: TextOverflow.ellipsis,
                    size: 10.sp,
                    fontw8: FontWeight.w500,
                    colorT: Colors.black,
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _url = Uri.parse(
                            'https://morth.nic.in/sites/default/files/dd12-13_0.pdf');
                        Future.delayed(Duration(milliseconds: 100), () {
                          _launchUrl(_url);
                        });
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: 1.h, bottom: 1.h, left: 2.h, right: 2.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffBF2025)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/download.svg'),
                          SizedBox(
                            width: 1.5.h,
                          ),
                          CommonText(
                            label: 'Download',
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            size: 10.sp,
                            fontw8: FontWeight.w500,
                            colorT: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                height: 10,
              ),
              Center(
                child: CommonText(
                  label: 'Last Updated - March 6, 2023',
                  maxline: 1,
                  overflow: TextOverflow.ellipsis,
                  size: 10.sp,
                  fontw8: FontWeight.w400,
                  colorT: Colors.black,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
