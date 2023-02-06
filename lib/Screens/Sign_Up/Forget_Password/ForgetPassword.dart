// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tssia_replica/Controller/SigupController.dart';
// import 'package:tssia_replica/Generic/Common/CommonText.dart';
// import 'package:tssia_replica/Generic/Common/Common_Color.dart';

// class ForgetPassword extends StatefulWidget {
//   const ForgetPassword({super.key});

//   @override
//   State<ForgetPassword> createState() => _ForgetPasswordState();
// }

// class _ForgetPasswordState extends State<ForgetPassword> {
//   var SigunpController = Get.put(signupcontroller());
//   final formKey = GlobalKey<FormState>();
//   TextEditingController email = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
//       floatingActionButton: Container(
//         height: 8.h,
//         width: 8.h,
//         padding: EdgeInsets.only(top: 2.h, left: 1.h),
//         child: FloatingActionButton(
//             onPressed: () {
//               Get.back();
//             },
//             backgroundColor: mainColor,
//             child: Icon(
//               Icons.keyboard_backspace,
//               color: Colors.white,
//             )),
//       ),
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: Form(
//         key: formKey,
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.h),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.center,
//                     child: Lottie.asset('assets/Lottie/Forget_Password.json'),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: CommonText(
//                       label: 'Forgot Password',
//                       fontw8: FontWeight.w400,
//                       size: 17.sp,
//                       colorT: Colors.black,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
//                     child: TextFormField(
//                       validator: (val) {
//                         if (val!.isEmpty) {
//                           return 'Please Enter Your email';
//                         } else if (val.length < 4) {
//                           return "Please enter valid email";
//                         }
//                         return null;
//                       },
//                       controller: email,
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.email_rounded),
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal: 20.0,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(6.0),
//                           borderSide: BorderSide(
//                             color: Color(0xffe4e4e4),
//                           ),
//                         ),
//                         hintText: 'Enter Email ID',
//                         hintStyle: TextStyle(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 11.sp,
//                             fontFamily: 'Poppins'),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: GestureDetector(
//                       onTap: () {
//                         if (formKey.currentState!.validate()) {
//                           SigunpController.ForgotPasswordSendOtpToMail(
//                               context: context, email: email.text);
//                         }
//                       },
//                       child: Container(
//                         height: 5.h,
//                         width: 32.w,
//                         decoration: BoxDecoration(
//                             borderRadius: MainBorderRadius, color: mainColor),
//                         child: Center(
//                           child: CommonText(
//                               label: 'Next',
//                               colorT: Colors.white,
//                               fontw8: FontWeight.w400,
//                               size: 12.sp),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       )),
//     );
//   }
// }
