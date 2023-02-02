import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
import 'package:tssia_replica/Screens/Circulars/Circulars.dart';
import 'package:tssia_replica/Screens/Committee/Coming_soon.dart';
import 'package:tssia_replica/Screens/Events/Event_Details.dart';
import 'package:tssia_replica/Screens/Events/Events.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

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
                  SecondBanner(),
                  UpcomingEvents(),
                  OurServices(),
                  // Gallery(),
                ],
              ),
            ),
          )),
          CommonBottomBar(TapColor: tapcolor)
        ],
      )),
    );
  }

  BannerImages() {
    return FutureBuilder(
      future: HomePageController.HomeBannerSupportSection(),
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
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.h),
          height: 24.h,
          width: 70.h,
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
                      "https://${HomePageController.HomeBannerAndSupportSection['slider_1'][index]['url']}",
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
                Center(
                  child: CommonText(
                    fontw8: FontWeight.w400,
                    label: 'Lorem ipsum',
                    size: 11.sp,
                    colorT: Color(0xff003C5E),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: true,
                      height: 13.5.h,
                      disableCenter: true,
                      viewportFraction: 0.34,
                      aspectRatio: 9 / 9,
                      initialPage: 0,
                      autoPlayInterval: Duration(seconds: 5)),
                  itemCount: HomePageController.HomeSixModulesColor.length,
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
                          } else if (index == 4) {
                            Get.to(Circulars(), transition: transitonEffect);
                          } else if (index == 5) {
                            // Get.to(ChatScreen(), transition: transitonEffect);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WellnessComingSoon();
                              },
                            );
                          } else if (index == 2) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WellnessComingSoon();
                              },
                            );
                          }
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(bottom: 1.h, right: 1.5.h),
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
                                padding: EdgeInsets.all(1.5.h),
                                height: 8.5.h,
                                width: 8.5.h,
                                child: SvgPicture.asset(
                                  "${HomePageController.HomeSixModulesImage[index]}",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.5.h),
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
          margin: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 1.5.h),
          height: 24.h,
          width: 70.h,
          child: CarouselSlider.builder(
            itemCount: HomePageController
                .HomeBannerAndSupportSection['slider_2'].length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: 100.h,
                decoration: BoxDecoration(
                    color: PWhite,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: Mainboxshadow,
                    border: Border.all(width: 0.5, color: Color(0xffe4e4e4))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    "https://${HomePageController.HomeBannerAndSupportSection['slider_2'][index]['url']}",
                  ),
                ),
              );
            },
            options: CarouselOptions(
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              aspectRatio: 16 / 9,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
            ),
          ),
        );
      },
    );
  }

  UpcomingEvents() {
    return FutureBuilder(
      future: eventcontroller.EventsListApi(),
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
          margin: EdgeInsets.only(bottom: 1.h, top: 1.h),
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
              Container(
                height: 17.h,
                width: 100.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  itemCount: eventcontroller.EventsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(
                              EventDetails(
                                id: eventcontroller.EventsList[index]['id']
                                    .toString(),
                              ),
                              transition: transitonEffect);
                          eventcontroller.EventsDetailsApi(
                              id: "${eventcontroller.EventsList[index]['id'].toString()}");
                        },
                        child: Container(
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
                                height: 16.h,
                                width: 15.h,
                                margin: EdgeInsets.all(1.2.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        width: 0.5, color: Color(0xffe4e4e4)),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'assets/images/Event_Image.png'))),
                              ),
                              SizedBox(
                                width: 43.w,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(1.2.h),
                                      child: Column(
                                        children: [
                                          CommonText(
                                            label:
                                                'Lorem ipsum dolor sit amet, consetetur',
                                            colorT: Colors.black,
                                            fontw8: FontWeight.w400,
                                            maxline: 2,
                                            size: 10.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/clock.svg',
                                                height: 1.5.h,
                                                color: Color(0xff003C5E),
                                              ),
                                              SizedBox(
                                                width: 0.5.h,
                                              ),
                                              CommonText(
                                                label:
                                                    '${eventcontroller.EventsList[index]['event_time']}',
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                maxline: 1,
                                                size: 9.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/calendar.svg',
                                                color: Color(0xffF3AE33),
                                                height: 1.5.h,
                                              ),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              CommonText(
                                                label:
                                                    '${eventcontroller.EventsList[index]['event_date']}',
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                maxline: 1,
                                                size: 9.sp,
                                                overflow: TextOverflow.ellipsis,
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
                                            color: Color(0xffF67C80),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10))),
                                        child: CommonText(
                                          label:
                                              'Paid Rs ${eventcontroller.EventsList[index]['event_price']}',
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
                        )
                        // child: Container(
                        //   width: 39.5.h,
                        //   padding: EdgeInsets.all(1.3.h),
                        //   margin: EdgeInsets.only(right: 2.2.h),
                        //   decoration: BoxDecoration(
                        //       boxShadow: [
                        //         BoxShadow(
                        //             color: Colors.black12,
                        //             blurRadius: 2,
                        //             offset: Offset(0, 4))
                        //       ],
                        //       color: PWhite,
                        //       borderRadius: BorderRadius.circular(6),
                        //       border: Border.all(
                        //           width: 0.5, color: Color(0xffe4e4e4))),
                        //   child: Row(
                        //     children: [
                        // Container(
                        //   height: 12.h,
                        //   width: 12.h,
                        //   margin: EdgeInsets.only(right: 1.5.h),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(6),
                        //       image: DecorationImage(
                        //           fit: BoxFit.fill,
                        //           image: NetworkImage(
                        //               '${eventcontroller.EventsList[index]['event_url']}'))),
                        // ),
                        //       Expanded(
                        //         child: Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceBetween,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             CommonText(
                        //               label:
                        //                   '${eventcontroller.EventsList[index]['event_name']}'
                        //                       .replaceAll('Tssia', ''),
                        //               colorT: Colors.black,
                        //               fontw8: FontWeight.w400,
                        //               maxline: 2,
                        //               size: 10.sp,
                        //               overflow: TextOverflow.ellipsis,
                        //             ),
                        // Row(
                        //   crossAxisAlignment:
                        //       CrossAxisAlignment.center,
                        //   mainAxisAlignment:
                        //       MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment:
                        //           CrossAxisAlignment.start,
                        //       children: [
                        //         Row(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.center,
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.start,
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/images/calendar.svg'),
                        //             SizedBox(
                        //               width: 1.h,
                        //             ),
                        //             CommonText(
                        //               label:
                        //                   '${eventcontroller.EventsList[index]['event_date']}',
                        //               colorT: Colors.black,
                        //               fontw8: FontWeight.w400,
                        //               maxline: 2,
                        //               size: 10.sp,
                        //               overflow: TextOverflow.ellipsis,
                        //             ),
                        //           ],
                        //         ),
                        //         Row(
                        //           crossAxisAlignment:
                        //               CrossAxisAlignment.center,
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.start,
                        //           children: [
                        //             SvgPicture.asset(
                        //                 'assets/images/clock.svg'),
                        //             SizedBox(
                        //               width: 1.h,
                        //             ),
                        //             SizedBox(
                        //               width: 10.h,
                        //               child: CommonText(
                        //                 label:
                        //                     '${eventcontroller.EventsList[index]['event_time']}',
                        //                 colorT: Colors.black,
                        //                 fontw8: FontWeight.w400,
                        //                 maxline: 1,
                        //                 size: 10.sp,
                        //                 overflow:
                        //                     TextOverflow.ellipsis,
                        //               ),
                        //             ),
                        //           ],
                        //         )
                        //       ],
                        //     ),
                        //                 Container(
                        //                   alignment: Alignment.center,
                        //                   padding: EdgeInsets.only(
                        //                       top: 1.1.h,
                        //                       bottom: 1.1.h,
                        //                       left: 1.5.h,
                        //                       right: 1.5.h),
                        //                   decoration: BoxDecoration(
                        //                       color: Color(0xffF89902),
                        //                       borderRadius:
                        //                           BorderRadius.circular(6),
                        //                       border: Border.all(
                        //                           width: 0.5,
                        //                           color: Color(0xffe4e4e4))),
                        //                   child: CommonText(
                        //                     label:
                        //                         'Rs ${eventcontroller.EventsList[index]['event_price']}',
                        //                     colorT: PWhite,
                        //                     fontw8: FontWeight.w400,
                        //                     maxline: 2,
                        //                     size: 10.sp,
                        //                     overflow: TextOverflow.ellipsis,
                        //                   ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                        );
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
              Center(
                child: CommonText(
                  label: 'Support System',
                  fontw8: FontWeight.w500,
                  size: 12.sp,
                  colorT: Color(0xff003C5E),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                  // padding: EdgeInsets.all(2.h),
                  height: 13.5.h,
                  child: FutureBuilder(
                    future: HomePageController.HomeBannerSupportSection(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount:
                            HomePageController.ServicesModulesColor.length,
                        controller: ScrollController(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(WebviewScreen(
                                  url: HomePageController
                                          .HomeBannerAndSupportSection[
                                      'support_system'][index]['url'],
                                  label:
                                      "${HomePageController.ServicesModulesName[index]}"));
                            },
                            child: Container(
                              padding: EdgeInsets.all(1.5.h),
                              width: 15.h,
                              margin: EdgeInsets.only(
                                  right: 2.h, bottom: 0.5.h, top: 0.5.h),
                              decoration: BoxDecoration(
                                  color: PWhite,
                                  boxShadow: Mainboxshadow,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.0,
                                      color: Color(HomePageController
                                          .ServicesModulesColor[index]))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                      "${HomePageController.ServicesModulesImage[index]}"),
                                  CommonText(
                                    colorT: Colors.black,
                                    fontw8: FontWeight.w400,
                                    size: 9.sp,
                                    overflow: TextOverflow.ellipsis,
                                    maxline: 2,
                                    label:
                                        "${HomePageController.ServicesModulesName[index]}",
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
}
