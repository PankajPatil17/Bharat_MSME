// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tssia_replica/Controller/EventsController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Screens/Committee/Coming_soon.dart';

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
                    eventTap == 'upcoming' ? UpcomingEvents() : AllEvents()
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
          return ListView.builder(
            controller: ScrollController(),
            itemCount: eventcontroller.AllEventsList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return WellnessComingSoon();
                    },
                  );
                  // Get.to(
                  //     EventDetails(
                  //       id: eventcontroller.AllEventsList[index]['id'].toString(),
                  //     ),
                  //     transition: transitonEffect);
                  // eventcontroller.EventsDetailsApi(
                  //     id: "${eventcontroller.AllEventsList[index]['id']}");
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
                      border: Border.all(width: 0.5, color: Color(0xffe4e4e4))),
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
                                image: NetworkImage(
                                    '${eventcontroller.AllEventsList[index]['image']}'))),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              label:
                                  '${eventcontroller.AllEventsList[index]['event_name']}',
                              colorT: Colors.black,
                              fontw8: FontWeight.w400,
                              maxline: 2,
                              size: 10.sp,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/calendar.svg'),
                                        SizedBox(
                                          width: 1.h,
                                        ),
                                        CommonText(
                                          label:
                                              '${eventcontroller.AllEventsList[index]['date']}',
                                          colorT: Colors.black,
                                          fontw8: FontWeight.w400,
                                          maxline: 2,
                                          size: 10.sp,
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
                                            'assets/images/clock.svg'),
                                        SizedBox(
                                          width: 1.h,
                                        ),
                                        SizedBox(
                                          width: 10.h,
                                          child: CommonText(
                                            label:
                                                '${eventcontroller.AllEventsList[index]['time']}',
                                            colorT: Colors.black,
                                            fontw8: FontWeight.w400,
                                            maxline: 1,
                                            size: 10.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        top: 1.1.h,
                                        bottom: 1.1.h,
                                        left: 1.5.h,
                                        right: 1.5.h),
                                    decoration: BoxDecoration(
                                        color: Color(0xffBF2025),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffe4e4e4))),
                                    child: CommonText(
                                      label:
                                          'Rs ${eventcontroller.AllEventsList[index]['price']}',
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
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: CommonText(
                      label: 'No Upcoming Events',
                      fontw8: FontWeight.w500,
                      size: 12.sp,
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return WellnessComingSoon();
                          },
                        );
                        // Get.to(
                        //     EventDetails(
                        //       id: eventcontroller.UpcomingList[index]['id']
                        //           .toString(),
                        //     ),
                        //     transition: transitonEffect);
                        // eventcontroller.EventsDetailsApi(
                        //     id: "${eventcontroller.UpcomingList[index]['id']}");
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
                                      image: NetworkImage(
                                          '${eventcontroller.UpcomingList[index]['image']}'))),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonText(
                                    label:
                                        '${eventcontroller.UpcomingList[index]['event_name']}',
                                    colorT: Colors.black,
                                    fontw8: FontWeight.w400,
                                    maxline: 2,
                                    size: 10.sp,
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
                                              SvgPicture.asset(
                                                  'assets/images/calendar.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              CommonText(
                                                label:
                                                    '${eventcontroller.UpcomingList[index]['date']}',
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                maxline: 2,
                                                size: 10.sp,
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
                                                  'assets/images/clock.svg'),
                                              SizedBox(
                                                width: 1.h,
                                              ),
                                              SizedBox(
                                                width: 10.h,
                                                child: CommonText(
                                                  label:
                                                      '${eventcontroller.UpcomingList[index]['time']}',
                                                  colorT: Colors.black,
                                                  fontw8: FontWeight.w400,
                                                  maxline: 1,
                                                  size: 10.sp,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
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
                                                  color: Color(0xffe4e4e4))),
                                          child: CommonText(
                                            label:
                                                'Rs ${eventcontroller.UpcomingList[index]['price']}',
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
