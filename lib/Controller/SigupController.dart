import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/HomePage.dart';
import 'package:tssia_replica/Screens/Sign_Up/LoginScreen.dart';
import 'package:tssia_replica/Screens/Sign_Up/OtpVerification.dart';

class signupcontroller extends GetxController {
  var CurrentuserID;
  var CurrentuserEmail;
  var MemberName;
  var CurrentToken;
  bool isStopped = false;
  var mobileForOTP;
  var PlatformNum;

  getIDfunction() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    CurrentuserID = _prefs.getString('CurrentuserID');
    MemberName = _prefs.getString('MemberName');
    CurrentuserEmail = _prefs.getString('MemberEmail');
    CurrentToken = _prefs.getString('token');
    if (Platform.isAndroid) {
      PlatformNum = 2;
    } else {
      PlatformNum = 3;
    }
  }

  Future RegSignUpGroup(
      {regtype, email, name, mobile, groupname, context}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/registration'),
      headers: {'api-token': secToken},
      body: {
        'register_type': regtype,
        'email': email,
        'username': name,
        'mobile_number': mobile,
        'group_name': groupname,
        'is_registered_by': PlatformNum.toString()
      },
    );
    var decodedResponse = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      Get.to(LoginScreen());
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
      Uri.parse('${MSMEURL}api/registration'),
      headers: {'api-token': secToken},
      body: {
        'register_type': regtype,
        'company_name': companyname,
        'username': name,
        'pan_card_number': pancard,
        'email': email,
        'referral_code': referral,
        'mobile_number': mobile,
        'is_registered_by': PlatformNum.toString()
      },
    );
    var decodedResponse = json.decode(response.body);
    print(PlatformNum.toString());
    if (response.statusCode == 200) {
      mobileForOTP = mobile;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));

      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString(
          'CurrentuserID', decodedResponse['data']['user_id'].toString());
      _prefs.setString(
          'MemberName', decodedResponse['data']['name'].toString());
      _prefs.setString(
          'MemberEmail', decodedResponse['data']['mobile_number'].toString());
      _prefs.setString('token', response.headers['authorization'].toString());
      CurrentuserID = _prefs.getString('CurrentuserID');
      CurrentuserEmail = _prefs.getString('MemberEmail');
      CurrentToken = _prefs.getString('token');
      MemberName = _prefs.getString('MemberName');
      print('token--${CurrentToken}');
      Get.offAll(HomePage());
    } else {
      Get.back();
      await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
      if (decodedResponse['fields']['mobile_number'].length != 0) {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${decodedResponse['fields']['mobile_number'][0]}"),
        ));
      } else if (decodedResponse['fields']['email'].length != 0) {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${decodedResponse['fields']['email'][0]}"),
        ));
      } else if (decodedResponse['fields']['pan_card_number'].length != 0) {
        await ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${decodedResponse['fields']['pan_card_number'][0]}"),
        ));
      }
    }
  }

  Future Signin({mobilenum, context}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/generate-otp'),
      headers: {'api-token': secToken},
      body: {'mobile_number': mobilenum, 'is_login': 'true'},
    );
    var decodedResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      mobileForOTP = mobilenum;
      Get.to(OtpVerification());
    } else {
      Get.back();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("${decodedResponse['message']}"),
      ));
    }
  }

  Future OtpVerify({otp, context}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/verify-otp'),
      headers: {'api-token': secToken},
      body: {'otp': otp, 'mobile_number': mobileForOTP},
    );
    var decodedResponse = json.decode(response.body);
    print(response.headers['authorization']);
    if (response.statusCode == 200) {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString(
          'CurrentuserID', decodedResponse['data']['user_id'].toString());
      _prefs.setString(
          'MemberName', decodedResponse['data']['name'].toString());
      _prefs.setString(
          'MemberEmail', decodedResponse['data']['mobile_number'].toString());
      _prefs.setString('token', response.headers['authorization'].toString());
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
