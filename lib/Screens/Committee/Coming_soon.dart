import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';

class WellnessComingSoon extends StatefulWidget {
  const WellnessComingSoon({super.key});

  @override
  State<WellnessComingSoon> createState() => _WellnessComingSoonState();
}

class _WellnessComingSoonState extends State<WellnessComingSoon> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 25.h,
            width: 25.h,
            child: Image.asset('assets/images/Coming_Soon.gif'),
          ),
        ],
      ),
    );
  }
}
