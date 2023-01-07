// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
// import 'package:tssia_replica/Controller/Local_Notification_Controller.dart';
import 'package:tssia_replica/Screens/WebView/splashScreen.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalNotification.initialize();
    // // For Forground State ( NOTIFICATION )
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   LocalNotification.showNotification(message);
    // });
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplahsScreen(),
          title: '',
        );
      },
    );
  }
}
