import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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

  String? companyScale;
  String? constitution;
  String? importer;
  String? importerCountry;
  String? companyTurnover;
  String? noofemployee;
  String? industrytype;

  var imgpath = ''.obs;

  FilePickerResult? result;

  @override
  void initState() {
    super.initState();
  }

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

  NumberSequence() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sequence(
            BorderColor: mainBlue,
            NumberColor: mainBlue,
            BoxNumber: "1",
            BoxColor: PWhite),
        Sequence(
            BorderColor: Colors.transparent,
            NumberColor: Colors.grey.shade500,
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
                            value: item['name'].toString(),
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
                            value: item['name'].toString(),
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
                            value: item['name'].toString(),
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
                            value: item['name'].toString(),
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
            Get.to(MemberAddressDetails());
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
