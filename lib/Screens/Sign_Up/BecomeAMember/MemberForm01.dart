import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Screens/Sign_Up/BecomeAMember/MemberForm02.dart';

class MemberForm01 extends StatefulWidget {
  const MemberForm01({super.key});

  @override
  State<MemberForm01> createState() => _MemberForm01State();
}

class _MemberForm01State extends State<MemberForm01> {
  List NatureOfEst = ['1', '2', '3'];
  TextEditingController NameOfEst = TextEditingController();
  TextEditingController AddresOfEst = TextEditingController();
  TextEditingController EstPhone = TextEditingController();
  TextEditingController EstEmail = TextEditingController();
  TextEditingController NameOfOwner = TextEditingController();
  TextEditingController OwnerRedArea = TextEditingController();
  TextEditingController OwnerMobile = TextEditingController();
  TextEditingController OwnerEmail = TextEditingController();
  TextEditingController UdyamReg = TextEditingController();
  TextEditingController SpecialFac = TextEditingController();
  TextEditingController Product = TextEditingController();
  TextEditingController Indsustry = TextEditingController();

  String? NOE;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: Container(
        height: 8.h,
        width: 8.h,
        padding: EdgeInsets.only(top: 2.h, left: 1.h),
        child: FloatingActionButton(
            onPressed: () {
              Get.back();
            },
            backgroundColor: mainColor,
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
            )),
      ),
      body: SafeArea(
          child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                CommonText(
                  label: 'Become a Member',
                  fontw8: FontWeight.bold,
                  size: 15.sp,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                MemberHeaderText('Name of the Establishment'),
                TextFormField(
                  controller: NameOfEst,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Establishment';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Name of the Establishment',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Address of the Establishment'),
                TextFormField(
                  controller: AddresOfEst,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Address of the Establishment';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Address of the Establishment',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Nature of the Establishment'),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 1.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 0.5),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: DropdownButton(
                      focusColor: Colors.white,
                      menuMaxHeight: 300.0,
                      isExpanded: true,
                      isDense: true,
                      hint: Padding(
                        padding: EdgeInsets.only(top: 2.0),
                        child: CommonText(
                          label: 'Nature of the Establishment',
                          colorT: Color(0xffb2b2b2),
                          fontw8: FontWeight.w400,
                          size: 11.sp,
                        ),
                      ),
                      underline: Container(
                        color: Colors.white,
                      ),
                      value: NOE,
                      items: NatureOfEst.map((item) {
                        return DropdownMenuItem(
                            enabled: true,
                            value: item.toString(),
                            child: Text(
                              item,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp,
                                  fontFamily: 'Poppins',
                                  overflow: TextOverflow.ellipsis),
                            ));
                      }).toList(),
                      onChanged: (String? _v) {
                        setState(() {
                          NOE = _v!;
                        });
                      }),
                ),
                MemberHeaderText('Establishment Phone Number'),
                TextFormField(
                  controller: EstPhone,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Your Phone Number';
                    } else if (val.length != 10) {
                      return "Please enter your valid Phone Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Establishment Phone Number',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Establishment Email'),
                TextFormField(
                  controller: EstEmail,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Establishment Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Establishment Email',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Name of Owner/Managing Partner/Director'),
                TextFormField(
                  controller: NameOfOwner,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Name of Owner/Managing Partner/Director';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Name of Owner/Managing Partner/Director',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Owner Registration Area'),
                TextFormField(
                  controller: OwnerRedArea,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Owner Registration Area';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Owner Registration Area',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Owner Mobile Number'),
                TextFormField(
                  controller: OwnerMobile,
                  maxLength: 10,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Owner Mobile Number';
                    } else if (val.length != 10) {
                      return "Please enter your valid Mobile Number";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Owner Mobile Number',
                    counterText: '',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Owner Email'),
                TextFormField(
                  controller: OwnerEmail,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Owner Email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Owner Email',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Udyam Registration & GST No'),
                TextFormField(
                  controller: UdyamReg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Udyam Registration & GST No';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Udyam Registration & GST No',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Special Facilities Available [Machinery]'),
                TextFormField(
                  controller: SpecialFac,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Special Facilities Available';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Special Facilities Available [Machinery]',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Product'),
                TextFormField(
                  controller: Product,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Product';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Product',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                MemberHeaderText('Industory'),
                TextFormField(
                  controller: Indsustry,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Industory Name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Color(0xffe4e4e4),
                      ),
                    ),
                    hintText: 'Industory',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        fontFamily: 'Poppins'),
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      elevation: 2,
                      backgroundColor: mainColor,
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.to(MemberForm02(
                          mebrarr: [
                            NameOfEst.text, //0
                            NOE, //1
                            EstPhone.text, //2
                            AddresOfEst.text, //3
                            EstEmail.text, //4
                            NameOfOwner.text, //5
                            OwnerRedArea.text, //6
                            OwnerMobile.text, //7
                            OwnerEmail.text, //8
                            UdyamReg.text, //9
                            SpecialFac.text, //10
                            Product.text, //11
                            Indsustry.text //12
                          ],
                        ));
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 1.9.h, vertical: 0.2.h),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  MemberHeaderText(memberLabel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.8.h),
      child: CommonText(
        label: memberLabel,
        fontw8: FontWeight.w500,
        size: 12.sp,
      ),
    );
  }
}
