import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/HomePage.dart';
import 'package:tssia_replica/Screens/Sign_Up/OtpVerification.dart';

class signupcontroller extends GetxController {
  var CurrentuserID;
  var CurrentuserEmail;
  var MemberName;
  var CurrentToken;
  bool isStopped = false;
  var mobileForOTP;

  getIDfunction() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    CurrentuserID = _prefs.getString('CurrentuserID');
    MemberName = _prefs.getString('MemberName');
    CurrentuserEmail = _prefs.getString('MemberEmail');
    CurrentToken = _prefs.getString('token');
  }

  Future RegSignUpGroup(
      {regtype, email, name, mobile, groupname, context}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/user-register'),
      body: {
        'register_type': regtype,
        'email': email,
        'name': name,
        'mobile_number': mobile,
        'group_name': groupname
      },
    );
    var decodedResponse = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      Get.to(OtpVerification());
      mobileForOTP = mobile;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
    } else {
      Get.back();
      await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['fields']['mobile_number'][0]}"),
      ));
      await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['fields']['email'][0]}"),
      ));
    }
  }

  Future RegSignUpMember(
      {companyname,
      name,
      pancard,
      email,
      referral,
      mobile,
      context,
      regtype}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/user-register'),
      body: {
        'register_type': regtype,
        'company_name': companyname,
        'name': name,
        'pan_card_number': pancard,
        'email': email,
        'referral_code': referral,
        'mobile_number': mobile
      },
    );
    var decodedResponse = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      Get.to(OtpVerification());
      mobileForOTP = mobile;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
    } else {
      Get.back();
      await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['fields']['mobile_number'][0]}"),
      ));
      await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['fields']['email'][0]}"),
      ));
    }
  }

  Future Signin({mobilenum}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/generate-otp'),
      body: {'mobile_number': mobilenum, 'is_login': 'true'},
    );
    if (response.statusCode == 200) {
      mobileForOTP = mobilenum;
      Get.to(OtpVerification());
    }
  }

  Future OtpVerify({otp, context}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/verify-otp'),
      body: {'otp': otp, 'mobile_number': mobileForOTP},
    );
    var decodedResponse = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString(
          'CurrentuserID', decodedResponse['data']['user_id'].toString());
      _prefs.setString(
          'MemberName', decodedResponse['data']['name'].toString());
      _prefs.setString(
          'MemberEmail', decodedResponse['data']['mobile_number'].toString());
      _prefs.setString('token', decodedResponse['data']['token'].toString());
      CurrentuserID = _prefs.getString('CurrentuserID');
      CurrentuserEmail = _prefs.getString('MemberEmail');
      CurrentToken = _prefs.getString('token');
      MemberName = _prefs.getString('MemberName');
      print('token--${CurrentToken}');
      Get.offAll(HomePage());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
    }
  }
}
