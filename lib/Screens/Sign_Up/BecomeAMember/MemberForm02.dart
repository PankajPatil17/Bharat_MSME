import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class MemberForm02 extends StatefulWidget {
  final mebrarr;

  const MemberForm02({super.key, required this.mebrarr});
  @override
  State<MemberForm02> createState() => _MemberForm02State();
}

class _MemberForm02State extends State<MemberForm02> {
  TextEditingController NameOfPerson = TextEditingController();
  TextEditingController Designation = TextEditingController();
  var imgpath = ''.obs;
  FilePickerResult? result;
  var SigunpController = Get.put(signupcontroller());
  var filename;
  var fileType;
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
                label: 'Introduced By',
                fontw8: FontWeight.bold,
                size: 15.sp,
              ),
              SizedBox(
                height: 0.5.h,
              ),
              MemberHeaderText('Name of the Person'),
              TextFormField(
                controller: NameOfPerson,
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
                  hintText: 'Name of the Person',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      fontFamily: 'Lato'),
                ),
              ),
              MemberHeaderText('Designation'),
              TextFormField(
                controller: Designation,
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
                  hintText: 'Designation',
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11.sp,
                      fontFamily: 'Lato'),
                ),
              ),
              MemberHeaderText('Upload Document'),
              CommonText(
                label: 'Please upload PDF,JPG or valid Document.',
                fontw8: FontWeight.w400,
                size: 9.sp,
              ),
              Obx(
                () {
                  return imgpath.value == ''
                      ? GestureDetector(
                          onTap: () async {
                            result = await FilePicker.platform
                                .pickFiles(allowMultiple: false);
                            if (result == null) {
                              print("No file selected");
                            } else {
                              result?.files.forEach((element) {
                                // print('asdasd${element.path}');
                                imgpath.value = element.path!;
                                filename = element.name;
                                fileType = element.extension;
                                print(element.path);
                              });
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(1.5.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: MainBorderRadius,
                                color: mainColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.upload_file_outlined,
                                  color: Colors.white,
                                  size: 3.h,
                                ),
                                CommonText(
                                  label: 'Upload Document',
                                  fontw8: FontWeight.w600,
                                  size: 10.sp,
                                  colorT: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.all(1.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.h, vertical: 2.h),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                              borderRadius: MainBorderRadius,
                              color: Colors.white),
                          child: CommonText(
                            label: '${filename}',
                            fontw8: FontWeight.w600,
                            size: 10.sp,
                            colorT: Colors.black,
                            maxline: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                },
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
                    if (imgpath.value.toString() == '') {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("The valid Document are required."),
                      ));
                    }
                    SigunpController.BeMemberFunction(
                        context: context,
                        EstName: widget.mebrarr[0],
                        EstNature: widget.mebrarr[1],
                        Estmobile: widget.mebrarr[2],
                        EstAddress: widget.mebrarr[3],
                        EstEmail: widget.mebrarr[4],
                        OwnerName: widget.mebrarr[5],
                        OwnerAdress: widget.mebrarr[6],
                        ownerMobile: widget.mebrarr[7],
                        ownerEmail: widget.mebrarr[8],
                        udyam: widget.mebrarr[9],
                        specialFac: widget.mebrarr[10],
                        product: widget.mebrarr[11],
                        industry: widget.mebrarr[12],
                        PersonName: NameOfPerson.text,
                        PesronsDesignation: Designation.text,
                        file: imgpath.value,
                        filetype: fileType.toString(),
                        fileremark: 'remark');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.8.h),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
