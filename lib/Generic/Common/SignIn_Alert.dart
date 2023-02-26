import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';

class SignInAlert extends StatefulWidget {
  final message;

  const SignInAlert({super.key, required this.message});

  @override
  State<SignInAlert> createState() => _SignInAlertState();
}

class _SignInAlertState extends State<SignInAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(8),
      content: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(2.5.h),
          child: CommonText(
            label: widget.message,
            colorT: Colors.green,
            fontw8: FontWeight.w500,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
