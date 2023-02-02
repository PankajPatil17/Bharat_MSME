import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class EventsController extends GetxController {
  List AllEventsList = [].obs;
  List UpcomingList = [].obs;
  List eventdetail = [].obs;
  var razorpaykey;

  Future AllEventsListApi() async {
    http.Response response = await http.get(
      Uri.parse('${MSMEURL}api/get-all-events'),
    );

    var decodedResponse = json.decode(response.body);
    AllEventsList = decodedResponse['data']['all_events'];
  }

  Future UpcomingEventsListApi() async {
    http.Response response = await http.get(
      Uri.parse('${MSMEURL}api/get-upcoming-events'),
    );

    var decodedResponse = json.decode(response.body);
    UpcomingList = decodedResponse['data']['upcoming_events'];
  }
}
