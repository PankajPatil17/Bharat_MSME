import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/Order_HistoryController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  var orderhistorycontrolller = Get.put(OrderHistoryController());
  var tapcolor;

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
            padding: EdgeInsets.all(1.6.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: orderhistorycontrolller.OrderHistoryList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                            child: CommonText(
                              colorT: Colors.black,
                              fontw8: FontWeight.w400,
                              label: "Order History",
                              size: 13.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ListView.builder(
                            itemCount: orderhistorycontrolller.orderList.length,
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.all(1.5.h),
                                  margin: EdgeInsets.only(bottom: 2.h),
                                  decoration: BoxDecoration(
                                      color: Color(0xffD4FFFD),
                                      boxShadow: Mainboxshadow,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 0.5,
                                          color: Color(0xffe4e4e4))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.network(
                                              '${orderhistorycontrolller.orderList[index]['img_url']}'),
                                          SizedBox(
                                            width: 1.5.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                label:
                                                    '${orderhistorycontrolller.orderList[index]['name']}',
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                maxline: 1,
                                                overflow: TextOverflow.ellipsis,
                                                size: 12.sp,
                                              ),
                                              CommonText(
                                                label:
                                                    '${orderhistorycontrolller.orderList[index]['email']}',
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                maxline: 1,
                                                overflow: TextOverflow.ellipsis,
                                                size: 11.sp,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          CommonText(
                                            label:
                                                '${orderhistorycontrolller.orderList[index]['create_date']}',
                                            colorT: Color(0xff706E6E),
                                            fontw8: FontWeight.w400,
                                            maxline: 1,
                                            overflow: TextOverflow.ellipsis,
                                            size: 10.sp,
                                          )
                                        ],
                                      )
                                    ],
                                  ));
                            },
                          )
                        ],
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
