// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/HomeController.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var NotificationController = Get.put(HomeController());

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
            padding: EdgeInsets.all(1.5.h),
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: NotificationController.NotificationList(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return NotificationController.notification.length == 0 ||
                          NotificationController.notification.length == null ||
                          NotificationController.notification.isEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Lottie.asset(
                                  'assets/Lottie/No_Notification.json'),
                            ),
                            Text(
                              "No Notification Here",
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Lato',
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemCount:
                                  NotificationController.notification.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  // padding: EdgeInsets.all(2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Color(0xffe4e4e4))),
                                  child: ExpansionTile(
                                    onExpansionChanged: (value) {
                                      setState(() {});
                                    },
                                    leading: Container(
                                      height: 8.h,
                                      width: 8.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          border: Border.all(
                                              width: 0.5,
                                              color: Color(0xffe4e4e4))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: "${NotificationController.notification[index]['image']}" ==
                                                ''
                                            ? Image.network(
                                                "https://tssia.enirmaan.com//tssia_assets/images/Bharat_Logo.png")
                                            : Image.network(
                                                "${NotificationController.notification[index]['image']}"),
                                      ),
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          NotificationController
                                                          .notification[index]
                                                      ['title'] ==
                                                  ''
                                              ? ''
                                              : "${NotificationController.notification[index]['title']}",
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          NotificationController
                                                          .notification[index]
                                                      ['message'] ==
                                                  null
                                              ? ''
                                              : NotificationController
                                                  .notification[index]
                                                      ['message']
                                                  .toString()
                                                  .replaceAll('<p>', '')
                                                  .replaceAll('</p>', '')
                                                  .replaceAll('<h2>', '')
                                                  .replaceAll('</h2>', ''),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Lato',
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w400),
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(1.5.h),
                                        child: HtmlWidget(
                                          '''
                             ${NotificationController.notification[index]['message']}
                            ''',
                                          customStylesBuilder: (element) {
                                            if (element.classes
                                                .contains('foo')) {
                                              return {'color': 'red'};
                                            }
                                            return null;
                                          },
                                          enableCaching: true,
                                          onErrorBuilder: (context, element,
                                                  error) =>
                                              Text('$element error: $error'),
                                          onLoadingBuilder: (context, element,
                                                  loadingProgress) =>
                                              CircularProgressIndicator(),
                                          renderMode: RenderMode.column,
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Lato',
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )
                          ],
                        );
                },
              ),
            ),
          )),
          CommonBottomBar(TapColor: '')
        ],
      )),
    );
  }
}
