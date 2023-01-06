import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

class OrderHistoryController extends GetxController {
  List orderList = [].obs;
  var SignController = Get.put(signupcontroller());

  Future OrderHistoryList() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/order_history'),
      body: {
        "role_id": '2',
        "user_id": SignController.CurrentuserID.toString(),
      },
    );
    var decodedResponse = json.decode(response.body);
    orderList = decodedResponse['order_history'];
  }
}
