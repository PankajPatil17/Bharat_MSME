import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/MemberController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/Members/Member_Details.dart';

class Members extends StatefulWidget {
  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  var memberController = Get.put(MemberController());
  var tapcolor;
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    tapcolor = '';
    super.initState();
  }

  SearchFunction() {
    final result = memberController.MemberList.where((movie) {
      final movietitle = movie['member_heading'].toString().toLowerCase();
      final input = search.text.toLowerCase();
      return movietitle.contains(input);
    }).toList();
    setState(() {
      memberController.SearchResult = result;
    });
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
                      hintText: 'Search by Member',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          fontFamily: 'Lato'),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  FutureBuilder(
                    future: memberController.MemberListApi(),
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
                              itemCount: memberController.MemberList.length,
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        MemberDetails(
                                            id: memberController
                                                .MemberList[index]['id']
                                                .toString()),
                                        transition: transitonEffect);
                                    memberController.MemberDetails(
                                        id: memberController.MemberList[index]
                                                ['id']
                                            .toString());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.5.h),
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    decoration: BoxDecoration(
                                        color: PWhite,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/images/Member_background.png')),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 12.h,
                                            width: 12.h,
                                            margin:
                                                EdgeInsets.only(bottom: 1.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        '${memberController.MemberList[index]['member_logo']}'))),
                                          ),
                                        ),
                                        Center(
                                          child: CommonText(
                                            colorT: Color(0xff038CDA),
                                            label:
                                                '${memberController.MemberList[index]['member_heading']}',
                                            maxline: 2,
                                            overflow: TextOverflow.ellipsis,
                                            fontw8: FontWeight.w400,
                                            size: 11.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Center(
                                          child: Text(
                                            '${memberController.MemberList[index]['member_sub_heading']}',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              color: Color(0xff038CDA),
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on_rounded,
                                              color: Color.fromARGB(
                                                  255, 255, 118, 106),
                                            ),
                                            SizedBox(
                                              width: 1.2.h,
                                            ),
                                            Expanded(
                                              child: CommonText(
                                                fontw8: FontWeight.w400,
                                                maxline: 3,
                                                size: 11.sp,
                                                overflow: TextOverflow.ellipsis,
                                                colorT: Colors.black,
                                                label:
                                                    '${memberController.MemberList[index]['address']}',
                                              ),
                                            )
                                          ],
                                        ),
                                        Center(
                                          child: Container(
                                            width: 20.h,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(
                                                top: 1.5.h, bottom: 1.5.h),
                                            padding: EdgeInsets.only(
                                                top: 1.1.h,
                                                bottom: 1.1.h,
                                                left: 1.5.h,
                                                right: 1.5.h),
                                            decoration: BoxDecoration(
                                                color: PWhite,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                  width: 0.5,
                                                  color: Color(0xff783ffe),
                                                )),
                                            child: CommonText(
                                              label: 'View Profile',
                                              colorT: Color(0xff783ffe),
                                              fontw8: FontWeight.w400,
                                              maxline: 2,
                                              size: 11.sp,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : ListView.builder(
                              itemCount: memberController.SearchResult.length,
                              shrinkWrap: true,
                              controller: ScrollController(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        MemberDetails(
                                            id: memberController
                                                .SearchResult[index]['id']
                                                .toString()),
                                        transition: transitonEffect);
                                    memberController.MemberDetails(
                                        id: memberController.SearchResult[index]
                                                ['id']
                                            .toString());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(1.5.h),
                                    margin: EdgeInsets.only(bottom: 2.h),
                                    decoration: BoxDecoration(
                                        color: PWhite,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                                'assets/images/Member_background.png')),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            height: 12.h,
                                            width: 12.h,
                                            margin:
                                                EdgeInsets.only(bottom: 1.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        '${memberController.SearchResult[index]['member_logo']}'))),
                                          ),
                                        ),
                                        Center(
                                          child: CommonText(
                                            colorT: Color(0xff038CDA),
                                            label:
                                                '${memberController.SearchResult[index]['member_heading']}',
                                            maxline: 2,
                                            overflow: TextOverflow.ellipsis,
                                            fontw8: FontWeight.w400,
                                            size: 11.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Center(
                                          child: Text(
                                            '${memberController.SearchResult[index]['member_sub_heading']}',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 11.sp,
                                              color: Color(0xff038CDA),
                                            ),
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on_rounded,
                                              color: Color.fromARGB(
                                                  255, 255, 118, 106),
                                            ),
                                            SizedBox(
                                              width: 1.2.h,
                                            ),
                                            Expanded(
                                              child: CommonText(
                                                fontw8: FontWeight.w400,
                                                maxline: 3,
                                                size: 11.sp,
                                                overflow: TextOverflow.ellipsis,
                                                colorT: Colors.black,
                                                label:
                                                    '${memberController.SearchResult[index]['address']}',
                                              ),
                                            )
                                          ],
                                        ),
                                        Center(
                                          child: Container(
                                            width: 20.h,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.only(
                                                top: 1.5.h, bottom: 1.5.h),
                                            padding: EdgeInsets.only(
                                                top: 1.1.h,
                                                bottom: 1.1.h,
                                                left: 1.5.h,
                                                right: 1.5.h),
                                            decoration: BoxDecoration(
                                                color: PWhite,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                border: Border.all(
                                                  width: 0.5,
                                                  color: Color(0xff783ffe),
                                                )),
                                            child: CommonText(
                                              label: 'View Profile',
                                              colorT: Color(0xff783ffe),
                                              fontw8: FontWeight.w400,
                                              maxline: 2,
                                              size: 11.sp,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        )
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
