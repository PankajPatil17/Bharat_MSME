import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/CircularController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:url_launcher/url_launcher.dart';

class Circulars extends StatefulWidget {
  const Circulars({super.key});

  @override
  State<Circulars> createState() => _CircularsState();
}

class _CircularsState extends State<Circulars> {
  var circularcontroller = Get.put(CircularController());
  var tapcolor;
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    tapcolor = '';
    super.initState();
  }

  SearchFunction() {
    final result = circularcontroller.CircularList.where((movie) {
      final movietitle = movie['name'].toString().toLowerCase();
      final input = search.text.toLowerCase();
      return movietitle.contains(input);
    }).toList();
    setState(() {
      circularcontroller.SearchResult = result;
    });
  }

  var _url;
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    )) {
      throw 'Could not launch $url';
    }
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
                  TextFormField(
                    controller: search,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (v) {
                      Get.to(SearchFunction());
                    },
                    onChanged: (value) {
                      SearchFunction();
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      suffixIcon: search.text == ''
                          ? IconButton(
                              padding: EdgeInsets.only(bottom: 0.2.h),
                              icon: Icon(
                                Icons.search_rounded,
                                color: mainBlue,
                                size: 3.h,
                              ),
                              onPressed: () {
                                SearchFunction();
                              },
                            )
                          : IconButton(
                              padding: EdgeInsets.only(bottom: 0.2.h),
                              icon: Icon(
                                Icons.clear_sharp,
                                color: mainBlue,
                                size: 3.h,
                              ),
                              onPressed: () {
                                setState(() {
                                  search.clear();
                                  search.text == '';
                                });
                              },
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Color(0xffe4e4e4),
                        ),
                      ),
                      hintText: 'Search Here',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          fontFamily: 'Lato'),
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  CommonText(
                    label: 'Circular',
                    fontw8: FontWeight.w500,
                    size: 13.sp,
                    colorT: Color(0xff2479ab),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  FutureBuilder(
                    future: circularcontroller.CircularListApi(),
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
                      return search.text == ''
                          ? ListView.builder(
                              itemCount: circularcontroller.CircularList.length,
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _url = Uri.parse(circularcontroller
                                          .CircularList[index]['url']);
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        _launchUrl(_url);
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.3.h),
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xffBEFEFA),
                                          Color(0xffFFFFFF),
                                        ]),
                                        boxShadow: Mainboxshadow,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffe4e4e4))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 9.h,
                                          width: 9.h,
                                          margin: EdgeInsets.only(right: 1.3.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: SvgPicture.asset(
                                              'assets/images/pdf-file.svg'),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                size: 11.sp,
                                                maxline: 2,
                                                label:
                                                    '${circularcontroller.CircularList[index]['name']}',
                                              ),
                                              CommonText(
                                                colorT: Colors.grey.shade600,
                                                fontw8: FontWeight.w400,
                                                size: 11.sp,
                                                maxline: 1,
                                                label:
                                                    '${circularcontroller.CircularList[index]['circular_date']}',
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                            'assets/images/downloading.svg'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: circularcontroller.SearchResult.length,
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _url = Uri.parse(circularcontroller
                                          .SearchResult[index]['url']);
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        _launchUrl(_url);
                                      });
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.3.h),
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Color(0xffBEFEFA),
                                          Color(0xffFFFFFF),
                                        ]),
                                        boxShadow: Mainboxshadow,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 0.5,
                                            color: Color(0xffe4e4e4))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 9.h,
                                          width: 9.h,
                                          margin: EdgeInsets.only(right: 1.3.h),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: SvgPicture.asset(
                                              'assets/images/pdf-file.svg'),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CommonText(
                                                colorT: Colors.black,
                                                fontw8: FontWeight.w400,
                                                size: 11.sp,
                                                maxline: 2,
                                                label:
                                                    '${circularcontroller.SearchResult[index]['name']}',
                                              ),
                                              CommonText(
                                                colorT: Colors.grey.shade600,
                                                fontw8: FontWeight.w400,
                                                size: 11.sp,
                                                maxline: 1,
                                                label:
                                                    '${circularcontroller.SearchResult[index]['circular_date']}',
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        SvgPicture.asset(
                                            'assets/images/downloading.svg'),
                                      ],
                                    ),
                                  ),
                                );
                              },
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
