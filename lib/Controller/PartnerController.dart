import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class PartnerController extends GetxController {
  List partnerList = [].obs;

  PartnerListApi() async {
    http.Response response = await http
        .post(Uri.parse('${MSMEURL}api/Common_Controller/partners'), body: {});

    var decodedResponse = json.decode(response.body);
    partnerList = decodedResponse['partners'];
  }
}
