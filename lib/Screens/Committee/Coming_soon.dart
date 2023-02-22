import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

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
            child: Image.network('${ImagePath}Coming_Soon.gif'),
          ),
        ],
      ),
    );
  }
}
