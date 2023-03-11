import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class PublicationController extends GetxController {
  List publicationList = [].obs;

  PublicationListApi() async {
    http.Response response = await http.post(
        Uri.parse('${MSMEURL}api/Universal_search/publications'),
        body: {});

    var decodedResponse = json.decode(response.body);
    publicationList = decodedResponse['publication'];
  }
}
