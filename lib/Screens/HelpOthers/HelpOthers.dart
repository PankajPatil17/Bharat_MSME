import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';

class HelpOtherJoin extends StatelessWidget {
  const HelpOtherJoin({super.key});

  @override
  Widget build(BuildContext context) {
    var TapColor;
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: QrImage(
                    data: "https://www.msmebharatmanch.com/",
                    version: QrVersions.auto,
                    foregroundColor: Colors.black,
                    size: 250.0,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Please Scan This Code For any Help',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          )),
          CommonBottomBar(TapColor: TapColor)
        ],
      ),
    );
  }
}
