import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/MemberController.dart';
import 'package:tssia_replica/Generic/Common/CommonImage.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Icon_Button.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/My_Profile/Common_Sequences.dart';
import 'package:tssia_replica/Screens/My_Profile/MemberAddressDetails.dart';

class MemberProfile extends StatefulWidget {
  const MemberProfile({super.key});

  @override
  State<MemberProfile> createState() => _MemberProfileState();
}

class _MemberProfileState extends State<MemberProfile> {
  final formKey = GlobalKey<FormState>();

  var membercontroller = Get.put(MemberProfileController());
  TextEditingController companyDesc = TextEditingController();
  TextEditingController membershipNo = TextEditingController();
  TextEditingController udyamregNo = TextEditingController();
  TextEditingController gstNo = TextEditingController();
  TextEditingController cinNo = TextEditingController();

  String? companyScale;
  String? constitution;
  String? importer;
  String? importerCountry;
  String? companyTurnover;
  String? noofemployee;
  String? industrytype;

  var imgpath = ''.obs;
  int val = -1;
  String? one;

  FilePickerResult? result;

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
                      CommonSequences(number: "1"),
                      CompanyDetails(),
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

  CompanyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: CommonText(
            label: 'Company Details',
            fontw8: FontWeight.w400,
            size: 12.sp,
            colorT: mainBlue,
          ),
        ),
        HeaderText(Label: 'Company Name'),
        FutureBuilder(
          future: membercontroller.getCompanyDetails(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return TextFormField(
              readOnly: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                  hintText:
                      '${membercontroller.companydetails['login_user_info']['company_name']}',
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
            );
          },
        ),
        HeaderText(Label: 'Company Description'),
        Material(
          elevation: 1,
          shadowColor: Color.fromARGB(255, 253, 124, 112),
          borderRadius: BorderRadius.circular(6),
          color: PWhite,
          child: TextFormField(
            controller: companyDesc,
            validator: (v) {
              if (v == null || v.isEmpty) {
                return 'The Description is Required';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: 'Enter Business Description',
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
        FutureBuilder(
          future: membercontroller.MasterDetails(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(Label: 'Company Scale'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select Company Scale',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: companyScale,
                      items: membercontroller.companyTypeDetailList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['display_name'].toString(),
                            child: Text(
                              item['display_name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        companyScale = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'Constitution'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select Constitution',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: constitution,
                      items: membercontroller.constitutionList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        constitution = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'Exp/Imp Type'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select Exp/Imp Type',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: importer,
                      items: membercontroller.exportDetailList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['display_name'].toString(),
                            child: Text(
                              item['display_name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        importer = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'Exp/Imp Country'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select Exp/Imp Country',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: importerCountry,
                      items: membercontroller.countryDetailList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        importerCountry = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'Company Turnover'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select Company Turnover',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: companyTurnover,
                      items: membercontroller.turnOverList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        companyTurnover = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'No. of Employee'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select No. of Employee',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: noofemployee,
                      items: membercontroller.companySizeList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['display_name'].toString(),
                            child: Text(
                              item['display_name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        noofemployee = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'Industry Type'),
                Container(
                  height: 6.h,
                  alignment: Alignment.centerLeft,
                  width: 100.h,
                  padding: EdgeInsets.only(
                    left: 1.5.h,
                    right: 1.5.h,
                  ),
                  decoration: BoxDecoration(
                      boxShadow: FormBoxShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Color(0xffe4e4e4), width: 1.0)),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: CommonText(
                        label: 'Select Industry Type',
                        fontw8: FontWeight.w400,
                        size: 11.sp,
                        colorT: Color(0xffb2b2b2),
                        maxline: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: industrytype,
                      items: membercontroller.industryDetailsList.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item['id'].toString(),
                            child: Text(
                              item['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        industrytype = _v!;
                        setState(() {});
                      }),
                ),
                HeaderText(Label: 'Logo'),
                Material(
                  elevation: 3.0,
                  shadowColor: Colors.white,
                  child: Obx(() {
                    String imgName = '';
                    if (imgpath.value != '') {
                      imgName = imgpath.value.split('/').last;
                    }
                    return imgpath.value == ''
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  result = await FilePicker.platform.pickFiles(
                                      type: FileType.any, allowMultiple: false);

                                  result?.files.forEach((element) {
                                    imgpath.value = element.path!;
                                  });
                                },
                                child: Container(
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      boxShadow: FormBoxShadow,
                                      borderRadius: BorderRadius.circular(6),
                                      color: PWhite,
                                      border: Border.all(
                                          width: 1.0,
                                          color: Color(0xffe4e4e4))),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 1.5.h,
                                      ),
                                      Icon(Icons.upload_file),
                                      Container(
                                        padding: EdgeInsets.all(1.5.h),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        alignment: Alignment.center,
                                        child: CommonText(
                                          label: 'Browse',
                                          fontw8: FontWeight.w500,
                                          maxline: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xfff7f7f7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.photo_rounded,
                                    size: 19.0,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "${imgName}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                CustomIconButton(
                                  icon: Icons.clear,
                                  color: Colors.red[50],
                                  diameter: 25.0,
                                  iconSize: 18.0,
                                  onTap: () {
                                    imgpath.value = '';
                                  },
                                )
                              ],
                            ),
                          );
                  }),
                ),
                HeaderText(Label: 'Membership No.'),
                Material(
                  elevation: 1,
                  shadowColor: Color.fromARGB(255, 253, 124, 112),
                  borderRadius: BorderRadius.circular(6),
                  color: PWhite,
                  child: TextFormField(
                    controller: membershipNo,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'The membership no is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter Membership No.',
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
                HeaderText(Label: 'Udyam Reg. No'),
                Material(
                  elevation: 1,
                  shadowColor: Color.fromARGB(255, 253, 124, 112),
                  borderRadius: BorderRadius.circular(6),
                  color: PWhite,
                  child: TextFormField(
                    controller: udyamregNo,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return 'The Udyam reg no is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter Udyam Reg. No',
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
                HeaderText(Label: 'CIN No'),
                Material(
                  elevation: 1,
                  shadowColor: Color.fromARGB(255, 253, 124, 112),
                  borderRadius: BorderRadius.circular(6),
                  color: PWhite,
                  child: TextFormField(
                    controller: cinNo,
                    decoration: InputDecoration(
                        hintText: 'Enter CIN No',
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
                HeaderText(Label: 'GST No'),
                Material(
                  elevation: 1,
                  shadowColor: Color.fromARGB(255, 253, 124, 112),
                  borderRadius: BorderRadius.circular(6),
                  color: PWhite,
                  child: TextFormField(
                    controller: gstNo,
                    decoration: InputDecoration(
                        hintText: 'Enter GST No',
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
                Padding(
                  padding: EdgeInsets.only(top: 1.3.h),
                  child: CommonText(
                    label: 'GST',
                    size: 11.sp,
                    colorT: Colors.black,
                    maxline: 1,
                    overflow: TextOverflow.ellipsis,
                    fontw8: FontWeight.w400,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                          visualDensity:
                              VisualDensity(vertical: 0, horizontal: 0),
                          value: 1,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = 1;
                              one = "Yes";
                            });
                          },
                          activeColor: Color(0xff2479AB),
                        ),
                        CommonText(
                          label: "Yes",
                          fontw8: FontWeight.w500,
                          maxline: 1,
                          overflow: TextOverflow.ellipsis,
                          colorT: Colors.black,
                          size: 10.sp,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: val,
                          onChanged: (value) {
                            setState(() {
                              val = 2;
                              one = "No";
                            });
                          },
                          activeColor: Color(0xff2479AB),
                        ),
                        CommonText(
                          label: "No",
                          fontw8: FontWeight.w500,
                          maxline: 1,
                          overflow: TextOverflow.ellipsis,
                          colorT: Colors.black,
                          size: 10.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  SaveButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            if (imgpath.value != '' ||
                companyScale != null ||
                constitution != null ||
                importer != null ||
                importerCountry != null ||
                companyTurnover != null ||
                noofemployee != null ||
                industrytype != null) {
              Get.to(MemberAddressDetails(
                firstpageDetails: [
                  companyDesc.text, //0
                  companyScale, //1
                  constitution, //2
                  importer, //3
                  importerCountry, //4
                  companyTurnover, //5
                  noofemployee, //6
                  industrytype, //7
                  membershipNo.text, //8
                  udyamregNo.text, //9
                  one, //10
                  gstNo.text, //11
                  cinNo.text, //12
                  imgpath.value.toString(), //13
                ],
              ));
            } else {
              Fluttertoast.showToast(
                  msg: 'Please fill all the details',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER);
            }
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
}
