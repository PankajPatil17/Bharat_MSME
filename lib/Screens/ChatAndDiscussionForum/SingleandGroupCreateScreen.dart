import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';

class SingleandGroupCreateScreen extends StatefulWidget {
  const SingleandGroupCreateScreen({super.key});

  @override
  State<SingleandGroupCreateScreen> createState() =>
      _SingleandGroupCreateScreenState();
}

class _SingleandGroupCreateScreenState
    extends State<SingleandGroupCreateScreen> {
  var SigunpController = Get.put(signupcontroller());
  var tapcolor;

  @override
  void initState() {
    tapcolor = 'Chat';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [],)
              ],
            ),
          ),
          CommonBottomBar(TapColor: tapcolor)
        ],
      ),
    );
  }
}
