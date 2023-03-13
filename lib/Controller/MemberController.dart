// ignore_for_file: unused_local_variable

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

class MemberProfileController extends GetxController {
  List exportDetailList = [].obs;
  List constitutionList = [].obs;

  List countryDetailList = [].obs;
  List turnOverList = [].obs;
  List industryDetailsList = [].obs;
  List companyTypeDetailList = [].obs;
  List companySizeList = [].obs;
  var companydetails;
  var SignController = Get.put(signupcontroller());

  List MasterAPI = [
    'api/import-export-details',
    'api/constitution-details',
    'api/country-details',
    'api/turn-over-details',
    'api/industry-details',
    'api/company-type-details',
    'api/company-size',
  ].obs;

  Future MasterDetails() async {
    http.Response response1 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[0]}'),
    );
    http.Response response2 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[1]}'),
    );
    http.Response response3 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[2]}'),
    );
    http.Response response4 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[3]}'),
    );
    http.Response response5 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[4]}'),
    );
    http.Response response6 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[5]}'),
    );
    http.Response response7 = await http.get(
      Uri.parse('${MSMEURL}${MasterAPI[6]}'),
    );
    var decodedResponse1 = json.decode(response1.body);
    exportDetailList = await decodedResponse1['data']['importExportDetails'];

    var decodedResponse2 = json.decode(response2.body);
    constitutionList = await decodedResponse2['data']['constitutionDetails'];

    var decodedResponse3 = json.decode(response3.body);
    countryDetailList = await decodedResponse3['data']['countryDetails'];

    var decodedResponse4 = json.decode(response4.body);
    turnOverList = await decodedResponse4['data']['turnOverDetails'];
    ;

    var decodedResponse5 = json.decode(response5.body);
    industryDetailsList = await decodedResponse5['data']['industryDetails'];

    var decodedResponse6 = json.decode(response6.body);
    companyTypeDetailList =
        await decodedResponse6['data']['companyTypeDetails'];

    var decodedResponse7 = json.decode(response7.body);
    companySizeList = await decodedResponse7['data']['companySize'];
  }

  Future getCompanyDetails() async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/member/get-company-details'),
      headers: {
        "Authorization": SignController.CurrentToken,
      },
      body: {
        "user_id": SignController.CurrentuserID.toString(),
      },
    );
    var decodedResponse = json.decode(response.body);
    companydetails = decodedResponse['data'];
  }
}
