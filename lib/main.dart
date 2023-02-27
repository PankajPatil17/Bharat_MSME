import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Screens/WebView/splashScreen.dart';
import 'package:upgrader/upgrader.dart';

//MSMEW
Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplahsScreen(),
            darkTheme: ThemeData(fontFamily: 'Poppins'),
            title: 'Bharat MSME',
          );
        },
      ),
    );
  }
}
