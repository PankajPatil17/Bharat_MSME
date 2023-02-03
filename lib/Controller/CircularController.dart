import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class CircularController extends GetxController {
  List CircularList = [].obs;
  List SearchResult = [].obs;
  CircularListApi() async {
    http.Response response = await http.get(
      Uri.parse('${MSMEURL}api/get-circular'),
    );

    var decodedResponse = json.decode(response.body);
    CircularList = decodedResponse['data']['circular'];
  }
}
