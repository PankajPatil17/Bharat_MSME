import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class CircularController extends GetxController {
  List CircularList = [].obs;
  List SearchResult = [].obs;
  CircularListApi() async {
    http.Response response = await http
        .post(Uri.parse('${BaseURL}api/Common_Controller/circular'), body: {});

    var decodedResponse = json.decode(response.body);
    CircularList = decodedResponse['circular_details'];
  }
}
