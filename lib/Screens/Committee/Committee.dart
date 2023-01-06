import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/CommitteeController.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';

class Committee extends StatefulWidget {
  const Committee({super.key});

  @override
  State<Committee> createState() => _CommitteeState();
}

class _CommitteeState extends State<Committee> {
  var committeecontroller = Get.put(CommitteeController());
  var tapcolor;

  @override
  void initState() {
    tapcolor = '';
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
            padding: EdgeInsets.all(1.5.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Committees',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 2.h),
                    child: Text(
                      'Professional ethics govern the values of social responsibility that help us deliver our obligations within a coherent social framework.',
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff000000),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  FutureBuilder(
                    future: committeecontroller.CommitteeListApi(),
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

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                          childAspectRatio: 0.75,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: committeecontroller.CommitteeList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(1.2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 17.h,
                                    width: 17.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffe4e4e4)),
                                        borderRadius: BorderRadius.circular(6),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                '${committeecontroller.CommitteeList[index]['image']}'))),
                                  ),
                                ),
                                SizedBox(
                                  height: 0.7.h,
                                ),
                                Text(
                                  '${committeecontroller.CommitteeList[index]['name']}',
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                    fontSize: 11.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.7.h,
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                    fontSize: 11.sp,
                                  ),
                                  '${committeecontroller.CommitteeList[index]['designation']}',
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      // return ListView.builder(
                      //   itemCount: committeecontroller.CommitteeList.length,
                      //   shrinkWrap: true,
                      //   controller: ScrollController(),
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       padding: EdgeInsets.all(1.5.h),
                      //       margin: EdgeInsets.only(bottom: 2.h),
                      //       decoration: BoxDecoration(
                      //           color: PWhite,
                      //           border: Border.all(
                      //               width: 0.5, color: Color(0xffe4e4e4)),
                      //           borderRadius: BorderRadius.circular(6),
                      //           boxShadow: Mainboxshadow),
                      //       child: Row(
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Container(
                      //             margin: EdgeInsets.only(right: 1.3.h),
                      //             width: 12.h,
                      //             height: 12.h,
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(6),
                      //                 border: Border.all(
                      //                     width: 0.5, color: Color(0xffe4e4e4)),
                      //                 image: DecorationImage(
                      //                     fit: BoxFit.fill,
                      //                     image: NetworkImage(
                      //                         '${committeecontroller.CommitteeList[index]['image']}'))),
                      //           ),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      // CommonText(
                      //   colorT: Colors.black,
                      //   fontw8: FontWeight.w400,
                      //   size: 13.sp,
                      //   label:
                      //       '${committeecontroller.CommitteeList[index]['name']}',
                      // ),
                      // SizedBox(
                      //   height: 0.8.h,
                      // ),
                      // CommonText(
                      //   colorT: Colors.black,
                      //   fontw8: FontWeight.w400,
                      //   size: 13.sp,
                      //   label:
                      //       '${committeecontroller.CommitteeList[index]['designation']}',
                      // ),
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
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
