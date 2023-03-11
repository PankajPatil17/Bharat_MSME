import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class MemberController extends GetxController {
  List MemberList = [].obs;
  List SearchResult = [].obs;

  List representativedetail = [].obs;
  List productdetails = [].obs;

  var complogo;
  var compName;
  var businessspread;
  var industrytype;
  var emailId;
  var customercareno;
  var website;

  Future MemberListApi() async {
    http.Response response = await http.post(
        Uri.parse('${MSMEURL}api/Common_Controller/members_list'),
        body: {});

    var decodedResponse = json.decode(response.body);
    MemberList = decodedResponse['member_details'];
  }

  Future MemberDetails({id}) async {
    final response = await http.post(
      Uri.parse('${MSMEURL}api/Common_Controller/members_details'),
      body: {
        "id": id.toString(),
      },
    );
    var decodedResponse = json.decode(response.body);

    representativedetail = decodedResponse['representative_details']['data'];
    productdetails = decodedResponse['product_details']['data'];
    complogo = decodedResponse['member_deatils']['comp_logo'];
    compName = decodedResponse['member_deatils']['comp_name'];
    businessspread = decodedResponse['member_deatils']['business_spread'];
    industrytype = decodedResponse['member_deatils']['industry_name'];
    emailId = decodedResponse['member_deatils']['comp_emailid'];
    customercareno = decodedResponse['member_deatils']['customer_careno'];
    website = decodedResponse['member_deatils']['website'];
  }
}
