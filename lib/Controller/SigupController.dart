import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/HomePage.dart';
import 'package:tssia_replica/Screens/Sign_Up/Forget_Password/Forget_Password_OTP.dart';
import 'package:tssia_replica/Screens/Sign_Up/LoginScreen.dart';

class signupcontroller extends GetxController {
  var CurrentuserID;
  var CurrentuserEmail;
  var MemberName;
  bool isStopped = false;

  getIDfunction() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    CurrentuserID = _prefs.getString('CurrentuserID');
    MemberName = _prefs.getString('MemberName');
  }

  Future Signin({empId, pass}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/login'),
      body: {'user_name': empId, 'password': pass, 'login_type': '2'},
    );
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == 200) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString(
          'CurrentuserID', decodedResponse['data']['user_id'].toString());
      _prefs.setString(
          'MemberName', decodedResponse['data']['user_name'].toString());
      _prefs.setString('MemberEmail', empId.toString());
      CurrentuserID = _prefs.getString('CurrentuserID');
      CurrentuserEmail = _prefs.getString('MemberEmail');
      print('token--${CurrentuserID}');
      Get.offAll(HomePage());
    }
  }

//Become a member function

  BeMemberFunction(
      {EstName,
      EstNature,
      Estmobile,
      EstAddress,
      EstEmail,
      OwnerName,
      OwnerAdress,
      ownerMobile,
      ownerEmail,
      udyam,
      specialFac,
      product,
      industry,
      PersonName,
      PesronsDesignation,
      file,
      filetype,
      fileremark,
      context}) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${BaseURL}/api/Common_Controller/save_bmemeber'));
    request.fields['bmem_estab_name'] = '${EstName}';
    request.fields['bmem_estab_nature'] = '${EstNature}';
    request.fields['bmem_estab_mobile'] = "${Estmobile}";
    request.fields['bmem_estab_address'] = '${EstAddress}';
    request.fields['bmem_estab_email'] = EstEmail;
    request.fields['bmem_owner_name'] = OwnerName;
    request.fields['bmem_owner_address'] = OwnerAdress;
    request.fields['bmem_owner_mobile'] = ownerMobile;
    request.fields['bmem_owner_email'] = ownerEmail;
    request.fields['bmem_owner_gstno_udyam'] = udyam;
    request.fields['bmem_special_facilities'] = specialFac;
    request.fields['bmem_product'] = product;
    request.fields['bmem_industry'] = industry;
    request.fields['bmem_name_person'] = PersonName;
    request.fields['bmem_designation'] = PesronsDesignation;
    request.fields['attachment_type[0]'] = filetype;
    request.fields['attachment_remark[0]'] = fileremark;

    request.files
        .add(await http.MultipartFile.fromPath("attachment[0]", "${file}"));
    var response = await request.send();
    var responsed = await http.Response.fromStream(response);
    var decodedResponse = json.decode(responsed.body);
    print(decodedResponse);
    if (decodedResponse['status'] == 200) {
      print('resbeco${responsed.body}');
      Get.to(LoginScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields and valid Document are required."),
      ));
    }
  }

  //Forgot Password

  Future ForgotPasswordSendOtpToMail({email, context}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/send_otp'),
      body: {'email_id': email},
    );
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == 200) {
      Get.to(ForgetPasswordotp(email: email));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("The Email ID field must contain a valid email address."),
      ));
    }
  }

  Future ForgotPasswordVerify({email, context, password, otp}) async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/validate_otp'),
      body: {'email_id': email, 'password': password, 'otp_code': otp},
    );
    var decodedResponse = json.decode(response.body);
    if (decodedResponse['status'] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset succefully"),
      ));
      Get.to(LoginScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
    }
  }
}
