// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:tssia_replica/Controller/EventsController.dart';
// import 'package:tssia_replica/Generic/Common/CommonImage.dart';
// import 'package:tssia_replica/Generic/Common/CommonText.dart';
// import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
// import 'package:tssia_replica/Generic/Common/Common_Color.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:tssia_replica/Screens/HomePage.dart';

// class EventDetails extends StatefulWidget {
//   final id;

//   const EventDetails({super.key, required this.id});
//   @override
//   State<EventDetails> createState() => _EventDetailsState();
// }

// class _EventDetailsState extends State<EventDetails> {
//   var TapColor;
//   var counter = 1.obs;
//   var finalPrice;
//   @override
//   void dispose() {
//     razorpay.clear();
//     super.dispose();
//   }

//   var eventcontroller = Get.put(EventsController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: PWhite,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         leading: BackButton(color: Colors.black),
//         title: Padding(
//           padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
//           child: CommonImage(
//             url: 'assets/images/Bharat_Logo.png',
//             height: 5.h,
//             width: 5.h,
//           ),
//         ),
//         titleTextStyle: TextStyle(
//             fontFamily: 'Poppins',
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//             fontSize: 13.sp),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//                 child: Container(
//               padding: EdgeInsets.all(2.1.h),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     FutureBuilder(
//                       future: eventcontroller.EventsDetailsApi(id: widget.id),
//                       builder: (BuildContext context,
//                           AsyncSnapshot<dynamic> snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return CustomLoader();
//                         }
//                         return ListView.builder(
//                           shrinkWrap: true,
//                           controller: ScrollController(),
//                           itemCount: eventcontroller.eventdetail.length,
//                           itemBuilder: (context, index) {
//                             finalPrice =
//                                 "${(eventcontroller.eventdetail[index]['event_price'] * counter.value) * 100}";

//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   height: 40.h,
//                                   width: 100.h,
//                                   margin: EdgeInsets.only(bottom: 1.5.h),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(6),
//                                       image: DecorationImage(
//                                           fit: BoxFit.fill,
//                                           image: AssetImage(
//                                               'assets/images/Event_Image.png')),
//                                       border: Border.all(
//                                           width: 0.5,
//                                           color: Color(0xffe4e4e4))),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(6),
//                                     // child: CommonImage(
//                                     //     url:
//                                     //         "${eventcontroller.eventdetail[index]['event_url']}"),
//                                   ),
//                                 ),
//                                 CommonText(
//                                   label:
//                                       "${eventcontroller.eventdetail[index]['event_name']}"
//                                           .replaceAll('Tssia', ''),
//                                   colorT: Colors.black,
//                                   fontw8: FontWeight.w400,
//                                   size: 12.sp,
//                                   maxline: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(vertical: 1.2.h),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/images/calendar.svg',
//                                         height: 2.5.h,
//                                         width: 2.5.h,
//                                       ),
//                                       SizedBox(
//                                         width: 2.h,
//                                       ),
//                                       CommonText(
//                                         label:
//                                             "${eventcontroller.eventdetail[index]['event_date']}",
//                                         colorT: Colors.black,
//                                         fontw8: FontWeight.w400,
//                                         size: 12.sp,
//                                         maxline: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       Spacer(),
//                                       SvgPicture.network(
//                                         '${ImagePath}clock.svg',
//                                         height: 2.5.h,
//                                         width: 2.5.h,
//                                       ),
//                                       SizedBox(
//                                         width: 2.h,
//                                       ),
//                                       CommonText(
//                                         label:
//                                             "${eventcontroller.eventdetail[index]['event_time']}",
//                                         colorT: Colors.black,
//                                         fontw8: FontWeight.w400,
//                                         size: 12.sp,
//                                         maxline: 3,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 1.h,
//                                 ),
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     SvgPicture.asset(
//                                         'assets/images/location.svg'),
//                                     SizedBox(
//                                       width: 1.5.h,
//                                     ),
//                                     CommonText(
//                                       label:
//                                           "${eventcontroller.eventdetail[index]['event_venue']}"
//                                               .replaceAll('Tssia', ''),
//                                       colorT: Colors.black,
//                                       fontw8: FontWeight.w400,
//                                       size: 12.sp,
//                                       maxline: 3,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(vertical: 1.5.h),
//                                   child: CommonText(
//                                     label:
//                                         "${eventcontroller.eventdetail[index]['event_desc']}"
//                                             .replaceAll('TSSIA', ''),
//                                     colorT: Colors.black,
//                                     fontw8: FontWeight.w400,
//                                     size: 12.sp,
//                                     maxline: 20,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                 ),
//                                 // Obx(() {
//                                 //   return Row(
//                                 //     crossAxisAlignment:
//                                 //         CrossAxisAlignment.center,
//                                 //     mainAxisAlignment:
//                                 //         MainAxisAlignment.spaceEvenly,
//                                 //     children: [
//                                 //       Container(
//                                 //         width: 18.h,
//                                 //         padding: EdgeInsets.symmetric(
//                                 //             vertical: 0.5.h, horizontal: 1.h),
//                                 //         decoration: BoxDecoration(
//                                 //             boxShadow: Mainboxshadow,
//                                 //             color: Colors.grey.shade50,
//                                 //             borderRadius:
//                                 //                 BorderRadius.circular(6),
//                                 //             border: Border.all(
//                                 //                 width: 0.5,
//                                 //                 color: Color(0xffe4e4e4))),
//                                 //         child: Row(
//                                 //           crossAxisAlignment:
//                                 //               CrossAxisAlignment.center,
//                                 //           mainAxisAlignment:
//                                 //               MainAxisAlignment.spaceEvenly,
//                                 //           children: [
//                                 //             GestureDetector(
//                                 //               onTap: () {
//                                 //                 if (counter.value > 1) {
//                                 //                   counter.value--;
//                                 //                 }
//                                 //               },
//                                 //               child: SvgPicture.asset(
//                                 //                   'assets/images/minus.svg'),
//                                 //             ),
//                                 //             CommonText(
//                                 //               colorT: Colors.black,
//                                 //               fontw8: FontWeight.w500,
//                                 //               size: 12.sp,
//                                 //               label: "${counter.value}",
//                                 //             ),
//                                 //             GestureDetector(
//                                 //               onTap: () {
//                                 //                 counter.value++;
//                                 //               },
//                                 //               child: SvgPicture.asset(
//                                 //                   '${ImagePath}plus.svg'),
//                                 //             ),
//                                 //           ],
//                                 //         ),
//                                 //       ),
//                                 //       Spacer(),
//                                 //       GestureDetector(
//                                 //         onTap: () {
//                                 //           setState(() {
//                                 //             // print(
//                                 //             //     "${(eventcontroller.eventdetail[index]['event_price'] * counter.value) * 100}");
//                                 //             MakePayment(
//                                 //                 amount:
//                                 //                     "${(eventcontroller.eventdetail[index]['event_price'] * counter.value) * 100}");
//                                 //           });
//                                 //         },
//                                 //         child: Container(
//                                 //             alignment: Alignment.center,
//                                 //             width: 21.h,
//                                 //             padding: EdgeInsets.symmetric(
//                                 //                 vertical: 1.2.h,
//                                 //                 horizontal: 1.h),
//                                 //             decoration: BoxDecoration(
//                                 //                 boxShadow: Mainboxshadow,
//                                 //                 color: Color(0xffF89902),
//                                 //                 borderRadius:
//                                 //                     BorderRadius.circular(6),
//                                 //                 border: Border.all(
//                                 //                     width: 0.5,
//                                 //                     color: Color(0xffe4e4e4))),
//                                 //             child: CommonText(
//                                 //               colorT: Colors.white,
//                                 //               fontw8: FontWeight.w400,
//                                 //               size: 12.sp,
//                                 //               label:
//                                 //                   "Rs ${(eventcontroller.eventdetail[index]['event_price'] * counter.value)}",
//                                 //             )),
//                                 //       ),
//                                 //     ],
//                                 //   );
//                                 // })
//                               ],
//                             );
//                           },
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             )),
//             CommonBottomBar(TapColor: TapColor)
//           ],
//         ),
//       ),
//     );
//   }

// // Payment Integration Events

//   Razorpay razorpay = Razorpay();
//   Future<void> MakePayment({
//     amount,
//   }) async {
//     var options = {
//       'key': eventcontroller.razorpaykey,
//       'amount': amount.toString(),
//       'name': 'TSSIA',
//       'description': 'Event',
//       'retry': {'enabled': true, 'max_count': 1},
//       'send_sms_hash': true,
//       // 'prefill': {'contact': MobNum.toString(), 'email': EmailId.toString()},
//       // 'external': {
//       //   'wallets': [
//       //     'paytm',
//       //   ]
//       // }
//     };
//     razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
//     razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
//     razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
//     razorpay.open(options);
//   }

//   void handlePaymentErrorResponse(PaymentFailureResponse response) {
//     Fluttertoast.showToast(
//         msg: "Payment Cancelled !!!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 2,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

//   void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
//     Fluttertoast.showToast(
//         msg: "Payment Successful !!!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 2,
//         textColor: Colors.white,
//         fontSize: 16.0);
//     Get.offAll(HomePage());
//   }

//   void handleExternalWalletSelected(ExternalWalletResponse response) {
//     Fluttertoast.showToast(
//         msg: "External Wallet Selected",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 2,
//         textColor: Colors.white,
//         fontSize: 16.0);
//   }

//   void showAlertDialog(BuildContext context, String title, String message) {
//     Widget continueButton = ElevatedButton(
//       child: const Text(
//         "Back",
//         style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400),
//       ),
//       onPressed: () {
//         Get.back();
//       },
//     );
//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//       actions: [
//         continueButton,
//       ],
//     );
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
