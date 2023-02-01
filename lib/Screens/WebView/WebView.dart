// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  final url;
  final label;
  WebviewScreen({
    super.key,
    required this.url,
    required this.label,
  });
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        title: Text("${label}"),
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontSize: 13.sp),
      ),
      body: SafeArea(
        child: Container(
          height: 100.h,
          width: 100.h,
          color: Colors.grey.shade100,
          child: Stack(
            children: [
              WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onPageStarted: (url) async {
                  controller.runJavascript(
                      "document.getElementsByTagName('header')[0].style.display='none'");
                  controller.runJavascript(
                      "document.getElementsByClassName('header-wraper')[0].style.display='none'");
                  controller.runJavascript(
                      "document.getElementsByTagName('footer')[0].style.display='none'");

                  await controller.runJavascript(
                      "document.getElementsByTagName('header')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('header-new-wraper sticky-top')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('m-mega-footer-main-wrap')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('mob-fix-foot-wrap fixed-bottom')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByTagName('footer')[0].style.display='none'");
                },
                onPageFinished: (webAddress) async {
                  controller.runJavascript(
                      "document.getElementsByTagName('header')[0].style.display='none'");
                  controller.runJavascript(
                      "document.getElementsByClassName('header-wraper')[0].style.display='none'");
                  controller.runJavascript(
                      "document.getElementsByTagName('footer')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByTagName('header')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('header-new-wraper sticky-top')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('m-mega-footer-main-wrap')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByClassName('mob-fix-foot-wrap fixed-bottom')[0].style.display='none'");
                  await controller.runJavascript(
                      "document.getElementsByTagName('footer')[0].style.display='none'");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
