import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

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
      content: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonText(label: widget.message),
            SizedBox(
              width: 1.5.h,
            ),
            CircularProgressIndicator(
              color: mainColor,
              strokeWidth: 2.75,
            ),
          ],
        ),
      ),
    );
  }
}
