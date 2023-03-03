// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tssia_replica/Controller/EventsController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  var TapColor;
  var eventTap = 'upcoming';
  var eventcontroller = Get.put(EventsController());
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
              padding: EdgeInsets.all(1.5.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              eventTap = 'upcoming';
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 20.h,
                            margin: EdgeInsets.only(right: 2.h),
                            padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: Mainboxshadow,
                                color: eventTap == 'upcoming'
                                    ? Color(0xffFFF7F7)
                                    : Colors.white,
                                border: Border.all(
                                    width: 0.5, color: Color(0xffe4e4e4))),
                            child: CommonText(
                              label: 'Upcoming Events',
                              colorT: eventTap == 'upcoming'
                                  ? Colors.red.shade700
                                  : Colors.black,
                              fontw8: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                              size: 11.sp,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              eventTap = 'all';
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 20.h,
                            margin: EdgeInsets.only(right: 2.h),
                            padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: Mainboxshadow,
                                color: eventTap == 'all'
                                    ? Color(0xffFFF7F7)
                                    : Colors.white,
                                border: Border.all(
                                    width: 0.5, color: Color(0xffe4e4e4))),
                            child: CommonText(
                              label: 'All Events',
                              colorT: eventTap == 'all'
                                  ? Colors.red.shade700
                                  : Colors.black,
                              fontw8: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                              size: 11.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    eventTap == 'upcoming'
                        ? UpcomingEvents()
                        : eventTap == 'all'
                            ? AllEvents()
                            : UpcomingEvents()
                  ],
                ),
              ),
            )),
            CommonBottomBar(TapColor: TapColor)
          ],
        ),
      ),
    );
  }

  AllEvents() {
    return FutureBuilder(
        future: eventcontroller.AllEventsListApi(),
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
          return eventcontroller.AllEventsList.length == 0 ||
                  eventcontroller.AllEventsList.length == null
              ? Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Center(
                    child: CommonText(
                      label: 'No Events',
                    ),
                  ),
                )
              : ListView.builder(
                  controller: ScrollController(),
                  itemCount: eventcontroller.AllEventsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(WebviewScreen(
                          label: "Events",
                          url: "${eventcontroller.AllEventsList[index]['url']}",
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.5.h),
                        margin: EdgeInsets.only(top: 2.2.h),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 4))
                            ],
                            color: PWhite,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 0.5, color: Color(0xffe4e4e4))),
                        child: Row(
                          children: [
                            Container(
                              height: 12.h,
                              width: 12.h,
                              margin: EdgeInsets.only(right: 1.5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(eventcontroller
                                                      .AllEventsList[index]
                                                  ['event_media'] ==
                                              null
                                          ? "https://cdn-icons-png.flaticon.com/512/2558/2558944.png"
                                          : "${EventImagePath + eventcontroller.AllEventsList[index]['event_media']['image_path']}"))),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    label:
                                        '${eventcontroller.AllEventsList[index]['name']}',
                                    colorT: Colors.black,
                                    fontw8: FontWeight.w500,
                                    maxline: 2,
                                    size: 11.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.network(
                                                  '${ImagePath}calendar.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              SizedBox(
                                                width: 13.h,
                                                child: CommonText(
                                                  label:
                                                      '${eventcontroller.AllEventsList[index]['start_datetime']}'
                                                          .toString()
                                                          .replaceRange(
                                                              11, 19, ''),
                                                  colorT: Colors.black,
                                                  fontw8: FontWeight.w400,
                                                  maxline: 1,
                                                  size: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.network(
                                                  '${ImagePath}clock.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              SizedBox(
                                                width: 13.h,
                                                child: CommonText(
                                                  label: DateFormat.jm()
                                                      .format(DateTime.parse(
                                                          eventcontroller
                                                                      .AllEventsList[
                                                                  index][
                                                              'start_datetime']))
                                                      .toString(),
                                                  colorT: Colors.black,
                                                  fontw8: FontWeight.w400,
                                                  maxline: 1,
                                                  size: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(WebviewScreen(
                                                label: "Events",
                                                url:
                                                    "${eventcontroller.AllEventsList[index]['url']}",
                                              ));
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(top: 1.2.h),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  top: 1.1.h,
                                                  bottom: 1.1.h,
                                                  left: 1.5.h,
                                                  right: 1.5.h),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffBF2025),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          Color(0xffe4e4e4))),
                                              child: CommonText(
                                                label: 'View Details',
                                                colorT: PWhite,
                                                fontw8: FontWeight.w400,
                                                maxline: 2,
                                                size: 10.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        });
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
          return eventcontroller.UpcomingList.length == 0 ||
                  eventcontroller.UpcomingList.length == null
              ? Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Center(
                    child: CommonText(
                      label: 'No Events',
                    ),
                  ),
                )
              : ListView.builder(
                  controller: ScrollController(),
                  itemCount: eventcontroller.UpcomingList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(WebviewScreen(
                          label: "Events",
                          url: "${eventcontroller.UpcomingList[index]['url']}",
                        ));
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.5.h),
                        margin: EdgeInsets.only(top: 2.2.h),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 4))
                            ],
                            color: PWhite,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                width: 0.5, color: Color(0xffe4e4e4))),
                        child: Row(
                          children: [
                            Container(
                              height: 12.h,
                              width: 12.h,
                              margin: EdgeInsets.only(right: 1.5.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(eventcontroller
                                                      .UpcomingList[index]
                                                  ['event_media'] ==
                                              null
                                          ? "https://cdn-icons-png.flaticon.com/512/2558/2558944.png"
                                          : "${EventImagePath + eventcontroller.UpcomingList[index]['event_media']['image_path']}"))),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    label:
                                        '${eventcontroller.UpcomingList[index]['name']}',
                                    colorT: Colors.black,
                                    fontw8: FontWeight.w500,
                                    maxline: 2,
                                    size: 11.sp,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.network(
                                                  '${ImagePath}calendar.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              SizedBox(
                                                width: 13.h,
                                                child: CommonText(
                                                  label:
                                                      '${eventcontroller.UpcomingList[index]['start_datetime']}'
                                                          .toString()
                                                          .replaceRange(
                                                              11, 19, ''),
                                                  colorT: Colors.black,
                                                  fontw8: FontWeight.w400,
                                                  maxline: 1,
                                                  size: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.network(
                                                  '${ImagePath}clock.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              SizedBox(
                                                width: 13.h,
                                                child: CommonText(
                                                  label: DateFormat.jm()
                                                      .format(DateTime.parse(
                                                          eventcontroller
                                                                      .UpcomingList[
                                                                  index][
                                                              'start_datetime']))
                                                      .toString(),
                                                  colorT: Colors.black,
                                                  fontw8: FontWeight.w400,
                                                  maxline: 1,
                                                  size: 10.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(WebviewScreen(
                                                label: "Events",
                                                url:
                                                    "${eventcontroller.UpcomingList[index]['url']}",
                                              ));
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(top: 1.2.h),
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  top: 1.1.h,
                                                  bottom: 1.1.h,
                                                  left: 1.5.h,
                                                  right: 1.5.h),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffBF2025),
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color:
                                                          Color(0xffe4e4e4))),
                                              child: CommonText(
                                                label: 'View Details',
                                                colorT: PWhite,
                                                fontw8: FontWeight.w400,
                                                maxline: 2,
                                                size: 10.sp,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        });
  }
}
