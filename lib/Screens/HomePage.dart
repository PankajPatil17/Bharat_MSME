// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/EventsController.dart';
import 'package:tssia_replica/Controller/HomeController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/ChatAndDiscussionForum/ChatScreen.dart';
import 'package:tssia_replica/Screens/Circulars/Circulars.dart';
import 'package:tssia_replica/Screens/Committee/Coming_soon.dart';
import 'package:tssia_replica/Screens/Events/Events.dart';
import 'package:tssia_replica/Screens/Growth_Facilators/Subsidies.dart';
import 'package:tssia_replica/Screens/HelpOthers/HelpOthers.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';
import 'package:upgrader/upgrader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var HomePageController = Get.put(HomeController());
  var eventcontroller = Get.put(EventsController());
  var tapcolor;

  @override
  void initState() {
    HomePageController.HomePageApi();
    tapcolor = 'Home';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
          child: UpgradeAlert(
        upgrader: Upgrader(
            durationUntilAlertAgain: Duration(minutes: 1),
            debugDisplayAlways: false,
            showReleaseNotes: false,
            showIgnore: false,
            shouldPopScope: () => true,
            showLater: false,
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : UpgradeDialogStyle.material,
            canDismissDialog: false),
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
                    BannerImages(),
                    HomeSixModules(),
                    // SecondBanner(),
                    LatestUpdate(),
                    OurServices(),
                    UpcomingEvents(),
                    Gallery(),
                  ],
                ),
              ),
            )),
            CommonBottomBar(TapColor: tapcolor)
          ],
        ),
      )),
    );
  }

  BannerImages() {
    return FutureBuilder(
      future: HomePageController.HomeBannerSupportSection(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoader();
        }
        return Container(
          height: 19.h,
          width: 100.w,
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.h),
          child: CarouselSlider.builder(
            itemCount: HomePageController
                .HomeBannerAndSupportSection['slider_1'].length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: 100.h,
                decoration: BoxDecoration(
                  color: PWhite,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: Mainboxshadow,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "${HomePageController.HomeBannerAndSupportSection['slider_1'][index]['url']}",
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              aspectRatio: 16 / 9,
              initialPage: 0,
              autoPlayInterval: Duration(seconds: 4),
            ),
          ),
        );
      },
    );
  }

  HomeSixModules() {
    return FutureBuilder(
        future: HomePageController.HomePageApi(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          return Container(
            // margin: EdgeInsets.only(top: 2.2.h),
            padding: EdgeInsets.all(1.5.h),
            width: 100.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: true,
                      height: 12.5.h,
                      disableCenter: true,
                      viewportFraction: 0.32,
                      aspectRatio: 4 / 9,
                      initialPage: 0,
                      autoPlayInterval: Duration(seconds: 5)),
                  itemCount: HomePageController.HomeSixModulesImage.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return GestureDetector(
                        onTap: () {
                          if (index == 0) {
                            // Get.to(Members(), transition: transitonEffect);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WellnessComingSoon();
                              },
                            );
                          } else if (index == 1) {
                            // Get.to(Committee(), transition: transitonEffect);

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WellnessComingSoon();
                              },
                            );
                          } else if (index == 3) {
                            Get.to(Events(), transition: transitonEffect);
                            eventcontroller.UpcomingEventsListApi();
                          } else if (index == 4) {
                            Get.to(Circulars(), transition: transitonEffect);
                          } else if (index == 5) {
                            Get.to(ChatScreen(), transition: transitonEffect);
                           
                          } else if (index == 2) {
                            Get.to(HelpOtherJoin(),
                                transition: transitonEffect);
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: 1.h, right: 0.5.h),
                              decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  border: Border.all(
                                      width: 0.5, color: Color(0xffe4e4e4)),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        offset: Offset(0, 2),
                                        color: Color(0xffe4e4e4))
                                  ]),
                              child: Container(
                                padding: EdgeInsets.all(2.h),
                                height: 7.5.h,
                                width: 7.5.h,
                                child: SvgPicture.network(
                                  "${HomePageController.HomeSixModulesImage[index]}",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 0.5.h),
                              child: Text(
                                "${HomePageController.HomeSixModulesName[index]}",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Poppins',
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ],
            ),
          );
        });
  }

  SecondBanner() {
    return FutureBuilder(
      future: HomePageController.HomeBannerSupportSection(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 16.h,
            width: 100.w,
            child: CustomLoader(),
            decoration: BoxDecoration(
              color: PWhite,
              borderRadius: BorderRadius.circular(6),
            ),
          );
        }
        return Container(
          height: 16.h,
          width: 100.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: HomePageController
                .HomeBannerAndSupportSection['slider_2'].length,
            itemBuilder: (context, index) {
              return Container(
                width: 100.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    "${HomePageController.HomeBannerAndSupportSection['slider_2'][index]['url']}",
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  UpcomingEvents() {
    return FutureBuilder(
      future: eventcontroller.UpcomingEventsListApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
          margin: EdgeInsets.only(
            bottom: 1.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CommonText(
                  label: 'Upcoming Events',
                  fontw8: FontWeight.w500,
                  size: 12.sp,
                  colorT: Color(0xff003C5E),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              eventcontroller.UpcomingList.length == 0 ||
                      eventcontroller.UpcomingList.length == null
                  ? CommonText(
                      label: "No Events",
                      fontw8: FontWeight.w500,
                      size: 12.sp,
                    )
                  : Container(
                      height: 14.h,
                      width: 100.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: ScrollController(),
                        itemCount: eventcontroller.UpcomingList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.to(WebviewScreen(
                                  label: "Events",
                                  url:
                                      "${eventcontroller.UpcomingList[index]['url']}",
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 2.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          color: Colors.black12)
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 12.h,
                                      width: 11.h,
                                      margin: EdgeInsets.all(1.2.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              width: 0.5,
                                              color: Color(0xffe4e4e4)),
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(eventcontroller
                                                                  .UpcomingList[
                                                              index]
                                                          ['event_media'] ==
                                                      null
                                                  ? "https://cdn-icons-png.flaticon.com/512/2558/2558944.png"
                                                  : "${EventImagePath + eventcontroller.UpcomingList[index]['event_media']['image_path']}"))),
                                    ),
                                    SizedBox(
                                      width: 43.w,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(1.2.h),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.network(
                                                      '${ImagePath}clock.svg',
                                                      height: 2.5.h,
                                                      color: Color(0xffFFB932),
                                                    ),
                                                    SizedBox(
                                                      width: 0.5.h,
                                                    ),
                                                    CommonText(
                                                      label: DateFormat.jm()
                                                          .format(DateTime.parse(
                                                              eventcontroller
                                                                          .UpcomingList[
                                                                      index][
                                                                  'start_datetime']))
                                                          .toString(),
                                                      colorT: Color(0xffBF2025),
                                                      fontw8: FontWeight.w400,
                                                      maxline: 1,
                                                      size: 10.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.2.h,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SvgPicture.network(
                                                      '${ImagePath}calendar.svg',
                                                      color: Color(0xffFFB932),
                                                      height: 2.5.h,
                                                    ),
                                                    SizedBox(
                                                      width: 1.h,
                                                    ),
                                                    CommonText(
                                                      label:
                                                          '${eventcontroller.UpcomingList[index]['start_datetime']}'
                                                              .toString()
                                                              .replaceRange(
                                                                  11, 19, ''),
                                                      colorT: Color(0xffBF2025),
                                                      fontw8: FontWeight.w400,
                                                      maxline: 1,
                                                      size: 10.sp,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              padding: EdgeInsets.all(1.h),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffBF2025),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10))),
                                              child: CommonText(
                                                label: 'View Details',
                                                colorT: PWhite,
                                                fontw8: FontWeight.w400,
                                                maxline: 1,
                                                size: 11.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        },
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  OurServices() {
    return FutureBuilder(
      future: HomePageController.HomePageApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoader();
        }
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
          margin: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
          ),
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
                      label: 'Growth Facilitators',
                      fontw8: FontWeight.w500,
                      size: 12.sp,
                      colorT: Color(0xff003C5E),
                    ),
                  ),
                  Container(
                    width: 5.h,
                    height: 0.1.h,
                    color: Color(0xffBF2025),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  // padding: EdgeInsets.all(2.h),
                  height: 12.5.h,
                  child: FutureBuilder(
                    future: HomePageController.HomeBannerSupportSection(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CustomLoader();
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount:
                            HomePageController.ServicesModulesColor.length,
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                Get.to(WebviewScreen(
                                    url:
                                        "${HomePageController.HomeBannerAndSupportSection['support_system'][0]['url']}",
                                    label:
                                        "${HomePageController.HomeBannerAndSupportSection['support_system'][0]['title']}"));
                              } else if (index == 3) {
                                Get.to(WebviewScreen(
                                    url:
                                        "${HomePageController.HomeBannerAndSupportSection['support_system'][3]['url']}",
                                    label:
                                        "${HomePageController.HomeBannerAndSupportSection['support_system'][3]['title']}"));
                              } else if (index == 2) {
                                Get.to(SubsidiesPage());
                              }
                            },
                            // onTap: () {
                            // Get.to(WebviewScreen(
                            //     url:
                            //         "${HomePageController.HomeBannerAndSupportSection['support_system'][index]['url']}",
                            //     label:
                            //         "${HomePageController.HomeBannerAndSupportSection['support_system'][index]['title']}"));
                            // },
                            child: Container(
                              padding: EdgeInsets.only(top: 2.h),
                              width: 12.h,
                              margin: EdgeInsets.only(
                                  right: 2.h, bottom: 0.5.h, top: 0.5.h),
                              decoration: BoxDecoration(
                                color: PWhite,
                                boxShadow: Mainboxshadow,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.network(
                                      "${HomePageController.HomeBannerAndSupportSection['support_system'][index]['icon_url']}"),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 13.h,
                                    padding: EdgeInsets.all(0.8.h),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                '${ImagePath}shape.png'))),
                                    child: CommonText(
                                      colorT: Color(0xffBF2025),
                                      fontw8: FontWeight.w400,
                                      size: 9.sp,
                                      overflow: TextOverflow.ellipsis,
                                      maxline: 2,
                                      label:
                                          "${HomePageController.HomeBannerAndSupportSection['support_system'][index]['title']}",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  LatestUpdate() {
    return FutureBuilder(
      future: HomePageController.LatestUpdateApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoader();
        }
        return Column(
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
                    label: 'Latest Updates',
                    fontw8: FontWeight.w500,
                    size: 12.sp,
                    colorT: Color(0xff003C5E),
                  ),
                ),
                Container(
                  width: 5.h,
                  height: 0.1.h,
                  color: Color(0xffBF2025),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 18.5.h,
              width: 100.w,
              child: ListView.builder(
                itemCount: HomePageController.latestupdatelist.length,
                shrinkWrap: true,
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(WebviewScreen(
                        url:
                            "${HomePageController.latestupdatelist[index]['url']}",
                        label:
                            "${HomePageController.latestupdatelist[index]['title']}",
                      ));
                    },
                    child: Container(
                      width: 94.w,
                      padding: EdgeInsets.all(2.h),
                      margin: EdgeInsets.only(right: 2.h, left: 1.h),
                      decoration: BoxDecoration(
                          // color: PWhite,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "${HomePageController.latestupdatelist[index]['image']}"))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            label:
                                "${HomePageController.latestupdatelist[index]['title']}",
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            size: 12.sp,
                            fontw8: FontWeight.w500,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h),
                            child: CommonText(
                              label:
                                  "${HomePageController.latestupdatelist[index]['description']}",
                              maxline: 3,
                              overflow: TextOverflow.ellipsis,
                              size: 10.sp,
                              colorT: Color(0xff5E5E5E),
                              fontw8: FontWeight.w500,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CommonText(
                                label: 'Posted on ',
                                size: 10.sp,
                                fontw8: FontWeight.w400,
                                maxline: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              CommonText(
                                label:
                                    "${HomePageController.latestupdatelist[index]['date']}",
                                size: 10.sp,
                                colorT: Color(0xffBF2025),
                                fontw8: FontWeight.w400,
                                maxline: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Gallery() {
    return FutureBuilder(
      // future: HomePageController.HomePageApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
          margin: EdgeInsets.only(bottom: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                label: 'Gallery',
                fontw8: FontWeight.w500,
                size: 12.sp,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 18.h,
                width: 70.h,
                child: CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      width: 100.h,
                      decoration: BoxDecoration(
                          color: PWhite,
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              'https://www.msmebharatmanch.com/images/msmelogo.png',
                            ),
                          ),
                          boxShadow: Mainboxshadow,
                          border:
                              Border.all(width: 0.5, color: Color(0xffe4e4e4))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(1.h),
                            margin: EdgeInsets.only(
                                left: 2.h, right: 2.h, top: 1.h),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6),
                                    topRight: Radius.circular(6))),
                            child: Text(
                              'Gallery Name',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  color: PWhite),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 1,
                    disableCenter: false,
                    aspectRatio: 10 / 5,
                    initialPage: 0,
                    autoPlayInterval: Duration(seconds: 2),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
