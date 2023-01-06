// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class MileStones extends StatefulWidget {
  const MileStones({super.key});

  @override
  State<MileStones> createState() => _MileStonesState();
}

class _MileStonesState extends State<MileStones> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      appBar: AppBar(
        backgroundColor: PWhite,
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        title: Padding(
          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
          child: CommonImage(
            url: 'assets/images/rupee_logo.png',
            height: 5.h,
            width: 5.h,
          ),
        ),
        titleTextStyle: TextStyle(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13.sp),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(1.7.h),
            width: 100.h,
            child: SingleChildScrollView(
              child: Image.asset(
                'assets/images/milestone.png',
                fit: BoxFit.cover,
              ),
            ),
          )),
          CommonBottomBar(TapColor: '')
        ],
      )),
    );
  }
}
