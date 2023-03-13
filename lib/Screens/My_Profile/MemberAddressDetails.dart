import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/MemberController.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/My_Profile/MemberContactDetails.dart';

class MemberAddressDetails extends StatefulWidget {
  const MemberAddressDetails({super.key});

  @override
  State<MemberAddressDetails> createState() => _MemberAddressDetailsState();
}

class _MemberAddressDetailsState extends State<MemberAddressDetails> {
  final formKey = GlobalKey<FormState>();

  var membercontroller = Get.put(MemberProfileController());
  TextEditingController companyAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(
            child: Container(
              height: 7.h,
              width: 100.h,
              padding: EdgeInsets.all(1.2.h),
              decoration: BoxDecoration(
                  color: PWhite,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, 4))
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Color(0XFFA8A8A8),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  CommonImage(
                    url: 'assets/images/Bharat_Logo.png',
                    height: 8.h,
                    width: 8.h,
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: 100.h,
              padding: EdgeInsets.all(2.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 5.h,
                            height: 0.1.h,
                            color: Color(0xffBF2025),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 1.h),
                            child: CommonText(
                              label: 'Company Information',
                              fontw8: FontWeight.w500,
                              size: 13.sp,
                              colorT: Colors.black,
                            ),
                          ),
                          Container(
                            width: 5.h,
                            height: 0.1.h,
                            color: Color(0xffBF2025),
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 1.5.h, bottom: 1.8.h),
                          child: CommonText(
                            label:
                                'Please fill all the details for verification',
                            fontw8: FontWeight.w400,
                            size: 10.sp,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                            colorT: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      NumberSequence(),
                      AddressDetails(),
                      SaveButton()
                    ],
                  ),
                ),
              ),
            )),
            CommonBottomBar(TapColor: '')
          ],
        ),
      ),
    );
  }

  AddressDetails() {
    return FutureBuilder(
      future: membercontroller.getCompanyDetails(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CommonText(
                label: 'Address Details',
                fontw8: FontWeight.w400,
                size: 12.sp,
                colorT: mainBlue,
              ),
            ),
            HeaderText(Label: 'Company Address'),
            Material(
              shadowColor: Color.fromARGB(255, 253, 124, 112),
              borderRadius: BorderRadius.circular(6),
              color: PWhite,
              child: TextFormField(
                controller: companyAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'The Address is Required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Enter Company Address',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.black54,
                        fontFamily: 'Poppins'),
                    contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        borderSide: BorderSide(
                          color: Color(0xffb2b2b2),
                          width: 0.5,
                        )),
                    fillColor: Colors.white,
                    filled: true),
              ),
            ),
            HeaderText(Label: 'Pincode'),
            TextFormField(
              readOnly: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                  hintText:
                      '${membercontroller.companydetails['company_detais']['zip']}',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Poppins'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffffffff),
                        width: 0.5,
                      )),
                  fillColor: Colors.grey.shade300,
                  filled: true),
            ),
            HeaderText(Label: 'City'),
            TextFormField(
              readOnly: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                  hintText:
                      '${membercontroller.companydetails['company_detais']['city']}',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Poppins'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffffffff),
                        width: 0.5,
                      )),
                  fillColor: Colors.grey.shade300,
                  filled: true),
            ),
            HeaderText(Label: 'State'),
            TextFormField(
              readOnly: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                  hintText:
                      '${membercontroller.companydetails['company_detais']['state']}',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.black,
                      fontFamily: 'Poppins'),
                  contentPadding: EdgeInsets.symmetric(horizontal: 2.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(width: 0.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffffffff),
                        width: 0.5,
                      )),
                  fillColor: Colors.grey.shade300,
                  filled: true),
            )
          ],
        );
      },
    );
  }

  SaveButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            Get.to(MemberContactDetails());
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 4.h, bottom: 6.h),
          width: 45.w,
          height: 5.5.h,
          decoration: BoxDecoration(
            color: mainBlue,
            borderRadius: BorderRadius.circular(6),
          ),
          child: CommonText(
            label: 'SAVE & NEXT',
            colorT: PWhite,
            fontw8: FontWeight.w500,
            size: 12.sp,
            overflow: TextOverflow.ellipsis,
            maxline: 1,
          ),
        ),
      ),
    );
  }

  NumberSequence() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "1",
            BoxColor: PWhite),
        Sequence(
            BorderColor: mainBlue,
            NumberColor: mainBlue,
            BoxNumber: "2",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "3",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "4",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "5",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
            BoxNumber: "6",
            BoxColor: PWhite),
      ],
    );
  }
}
