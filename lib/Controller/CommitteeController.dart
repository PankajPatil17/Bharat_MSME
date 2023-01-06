import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class CommitteeController extends GetxController {
  List CommitteeList = [].obs;

  CommitteeListApi() async {
    http.Response response = await http.post(
        Uri.parse('${BaseURL}api/Common_Controller/committees'),
        body: {});

    var decodedResponse = json.decode(response.body);
    CommitteeList = decodedResponse['committees'];
  }
}
