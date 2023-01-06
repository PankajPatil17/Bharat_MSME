// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/MemberController.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberDetails extends StatefulWidget {
  final id;

  const MemberDetails({super.key, required this.id});
  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {
  var TapColor;
  var memberController = Get.put(MemberController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        title: Padding(
          padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
          child: CommonImage(
            url: 'assets/images/rupee_logo.png',
            height: 5.h,
            width: 5.h,
          ),
        ),
      ),
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
                    FutureBuilder(
                      future: memberController.MemberDetails(id: widget.id),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 24.h,
                            width: 100.w,
                            child: CustomLoader(),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 18.h,
                                margin:
                                    EdgeInsets.only(top: 2.5.h, bottom: 1.5.h),
                                padding: EdgeInsets.all(2.h),
                                width: 20.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5, color: Color(0xffe4e4e4)),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            '${memberController.complogo}'))),
                              ),
                            ),
                            Center(
                              child: CommonText(
                                colorT: Color(0xffFE2712),
                                label: '${memberController.compName}',
                                fontw8: FontWeight.w400,
                                size: 13.sp,
                                maxline: 1,
                              ),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            IndustrialDetails(),
                            FounderDetails(),
                            ProductDetails()
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          CommonBottomBar(TapColor: TapColor)
        ],
      )),
    );
  }

  IndustrialDetails() {
    return Container(
      width: 100.h,
      padding: EdgeInsets.all(1.5.h),
      decoration: BoxDecoration(
        color: Color(0xffFEFFF9),
        boxShadow: Mainboxshadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 18.h,
            child: CommonText(
              colorT: Colors.black,
              label: 'Business Spread : ',
              fontw8: FontWeight.w500,
              size: 12.sp,
              maxline: 1,
            ),
          ),
          CommonText(
            colorT: Colors.black,
            label: '${memberController.businessspread}',
            fontw8: FontWeight.w400,
            size: 11.sp,
            maxline: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  colorT: Colors.black,
                  label: 'Industry Type : ',
                  fontw8: FontWeight.w500,
                  size: 12.sp,
                  maxline: 1,
                ),
                CommonText(
                  colorT: Colors.black,
                  label: '${memberController.industrytype}',
                  fontw8: FontWeight.w400,
                  size: 11.sp,
                  maxline: 5,
                ),
              ],
            ),
          ),
          CommonText(
            colorT: Colors.black,
            label: 'Email Id : ',
            fontw8: FontWeight.w500,
            size: 12.sp,
            maxline: 1,
          ),
          GestureDetector(
            onTap: () {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

// ···
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'support@medibhai.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': '',
                }),
              );

              launchUrl(emailLaunchUri);
            },
            child: CommonText(
              colorT: Colors.black,
              label: '${memberController.emailId}',
              fontw8: FontWeight.w400,
              size: 11.sp,
              maxline: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  colorT: Colors.black,
                  label: 'Customer Care Number : ',
                  fontw8: FontWeight.w500,
                  size: 12.sp,
                  maxline: 2,
                ),
                GestureDetector(
                  onTap: () {
                    launch("tel: +91 ${memberController.customercareno}");
                  },
                  child: CommonText(
                    colorT: Colors.black,
                    label: '${memberController.customercareno}',
                    fontw8: FontWeight.w400,
                    size: 11.sp,
                    maxline: 5,
                  ),
                ),
              ],
            ),
          ),
          CommonText(
            colorT: Colors.black,
            label: 'Website : ',
            fontw8: FontWeight.w500,
            size: 12.sp,
            maxline: 1,
          ),
          GestureDetector(
            onTap: () {
              Get.to(WebviewScreen(url: memberController.website, label: ''));
            },
            child: CommonText(
              colorT: Colors.black,
              label: '${memberController.website}',
              fontw8: FontWeight.w400,
              size: 11.sp,
              maxline: 2,
            ),
          ),
        ],
      ),
    );
  }

  FounderDetails() {
    return memberController.representativedetail.length == 0 ||
            memberController.representativedetail.length == null
        ? Container()
        : Container(
            width: 100.h,
            padding: EdgeInsets.all(1.5.h),
            margin: EdgeInsets.symmetric(vertical: 1.6.h),
            decoration: BoxDecoration(
              color: Color(0xffFEFFF9),
              boxShadow: Mainboxshadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  colorT: Color(0xff363636),
                  fontw8: FontWeight.w500,
                  size: 13.sp,
                  label: 'Representative Details:',
                ),
                SizedBox(
                  height: 1.1.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: memberController.representativedetail.length,
                  controller: ScrollController(),
                  itemBuilder: (context, index) {
                    return memberController.representativedetail.length == 0 ||
                            memberController.representativedetail.length == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(1.5.h),
                            margin: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/Member_Detail_Card.png')),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 1.2.h),
                                      height: 13.h,
                                      width: 13.h,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  '${memberController.representativedetail[index]['profile_pic']}')),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              width: 0.5,
                                              color: Color(0xffe4e4e4))),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/member_Profile.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              CommonText(
                                                colorT: Colors.black,
                                                label:
                                                    '${memberController.representativedetail[index]['founder_name']}',
                                                fontw8: FontWeight.w400,
                                                size: 10.sp,
                                                maxline: 2,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 0.8.h),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/email.svg'),
                                                  SizedBox(
                                                    width: 1.h,
                                                  ),
                                                  Expanded(
                                                    child: CommonText(
                                                      colorT: Colors.black,
                                                      label:
                                                          '${memberController.representativedetail[index]['founder_email']}',
                                                      fontw8: FontWeight.w400,
                                                      size: 10.sp,
                                                      maxline: 2,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/call.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              CommonText(
                                                colorT: Colors.black,
                                                label:
                                                    '${memberController.representativedetail[index]['founder_mobile']}',
                                                fontw8: FontWeight.w400,
                                                size: 11.sp,
                                                maxline: 2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          );
  }

  ProductDetails() {
    return memberController.productdetails.length == 0 ||
            memberController.productdetails.length == null
        ? Container()
        : Container(
            width: 100.h,
            padding: EdgeInsets.all(1.5.h),
            margin: EdgeInsets.symmetric(vertical: 1.6.h),
            decoration: BoxDecoration(
              color: Color(0xffFEFFF9),
              boxShadow: Mainboxshadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  colorT: Color(0xff363636),
                  fontw8: FontWeight.w500,
                  size: 13.sp,
                  label: 'Product Details',
                ),
                SizedBox(
                  height: 1.1.h,
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 0.75,
                  ),
                  controller: ScrollController(),
                  shrinkWrap: true,
                  itemCount: memberController.productdetails.length,
                  itemBuilder: (context, index) {
                    return memberController.productdetails.length == 0 ||
                            memberController.productdetails.length == null
                        ? Container()
                        : Container(
                            padding: EdgeInsets.all(1.5.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: Mainboxshadow,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    width: 0.5, color: Color(0xffe4e4e4))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 1.2.h),
                                  height: 16.h,
                                  width: 20.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${memberController.productdetails[index]['product_img']}')),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Color(0xffe4e4e4))),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        colorT: mainBlue,
                                        label:
                                            '${memberController.productdetails[index]['product_name']}',
                                        fontw8: FontWeight.w400,
                                        size: 11.sp,
                                        maxline: 2,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0.8.h),
                                          child: CommonText(
                                            colorT: mainBlue,
                                            label:
                                                '₹ ${memberController.productdetails[index]['product_price']}',
                                            fontw8: FontWeight.w400,
                                            size: 11.sp,
                                            maxline: 2,
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                ),
              ],
            ),
          );
  }
}
