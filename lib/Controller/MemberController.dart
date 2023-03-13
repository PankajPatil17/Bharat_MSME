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
    exportDetailList = decodedResponse1['data']['importExportDetails'];

    var decodedResponse2 = json.decode(response1.body);
    constitutionList = decodedResponse2;

    var decodedResponse3 = json.decode(response1.body);
    countryDetailList = decodedResponse3['data']['importExportDetails'];

    var decodedResponse4 = json.decode(response1.body);
    turnOverList = decodedResponse4;

    var decodedResponse5 = json.decode(response1.body);
    industryDetailsList = decodedResponse5['data']['importExportDetails'];

    var decodedResponse6 = json.decode(response1.body);
    companyTypeDetailList = decodedResponse6;

    var decodedResponse7 = json.decode(response1.body);
    companySizeList = decodedResponse7['data']['importExportDetails'];
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
    print(response.body);
  }
}
