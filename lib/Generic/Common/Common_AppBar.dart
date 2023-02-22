import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
// import 'package:tssia_replica/Generic/Custom/variables.dart';
// import 'package:tssia_replica/Screens/Notification_Page.dart';

class CommonAppBar extends StatefulWidget {
  const CommonAppBar({super.key});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 100.h,
      padding: EdgeInsets.all(1.2.h),
      decoration: BoxDecoration(color: PWhite, boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 4))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: mainBlue,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          CommonImage(
            url: 'assets/images/Bharat_Logo.png',
            height: 8.h,
            width: 8.h,
          ),
          Spacer(),
          // GestureDetector(
          //   onTap: () {
          //     // Get.to(NotificationPage(), transition: transitonEffect);
          //   },
          //   child: SvgPicture.asset(
          //     'assets/images/Notification.svg',
          //     color: mainBlue,
          //   ),
          // )
        ],
      ),
    );
  }
}
