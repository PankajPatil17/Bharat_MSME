// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tssia_replica/Controller/PartnerController.dart';
// import 'package:tssia_replica/Generic/Common/CommonText.dart';
// import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
// import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
// import 'package:tssia_replica/Generic/Common/Common_Color.dart';
// import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
// import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
// import 'package:tssia_replica/Screens/WebView/WebView.dart';

// class Partners extends StatefulWidget {
//   const Partners({super.key});

//   @override
//   State<Partners> createState() => _PartnersState();
// }

// class _PartnersState extends State<Partners> {
//   var partnercontroller = Get.put(PartnerController());
//   var tapcolor;

//   @override
//   void initState() {
//     tapcolor = 'Partners';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       drawer: CustomDrawer(),
//       appBar: PreferredSize(
//           child: SafeArea(child: CommonAppBar()),
//           preferredSize: Size(100.h, 20.h)),
//       body: SafeArea(
//           child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//               child: Container(
//             width: 100.h,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [Partner()],
//               ),
//             ),
//           )),
//           CommonBottomBar(TapColor: tapcolor)
//         ],
//       )),
//     );
//   }

//   Partner() {
//     return FutureBuilder(
//       future: partnercontroller.PartnerListApi(),
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Container(
//             height: 24.h,
//             width: 100.w,
//             child: CustomLoader(),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(6),
//             ),
//           );
//         }
//         return Container(
//           padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
//           margin: EdgeInsets.only(bottom: 2.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CommonText(
//                 label: 'Partners',
//                 size: 13.sp,
//                 colorT: Colors.black,
//                 fontw8: FontWeight.w500,
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               ListView.builder(
//                 itemCount: partnercontroller.partnerList.length,
//                 shrinkWrap: true,
//                 controller: ScrollController(),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       partnercontroller.partnerList[index]['redirect_url'] ==
//                                   "#" ||
//                               partnercontroller.partnerList[index]
//                                       ['redirect_url'] ==
//                                   ''
//                           ? SizedBox.shrink()
//                           : Get.to(WebviewScreen(
//                               url: partnercontroller.partnerList[index]
//                                   ['redirect_url'],
//                               label:
//                                   '${partnercontroller.partnerList[index]['name']}',
//                             ));
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(1.5.h),
//                       margin: EdgeInsets.only(bottom: 2.h),
//                       decoration: BoxDecoration(
//                           boxShadow: Mainboxshadow,
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(6),
//                           border:
//                               Border.all(width: 0.5, color: Color(0xffe4e4e4))),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(right: 1.5.h),
//                             height: 10.h,
//                             width: 10.h,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                       '${partnercontroller.partnerList[index]['logo']}')),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${partnercontroller.partnerList[index]['name']}',
//                                 maxLines: 1,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontFamily: 'Poppins',
//                                     fontSize: 12.sp,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 '${partnercontroller.partnerList[index]['description']}',
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontFamily: 'Poppins',
//                                     fontSize: 11.sp,
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
