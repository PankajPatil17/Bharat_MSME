import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Generic/Custom/variables.dart';

class EventsController extends GetxController {
  List EventsList = [].obs;
  List UpcomingList = [].obs;
  List eventdetail = [].obs;
  var razorpaykey;

  EventsListApi() async {
    http.Response response = await http
        .post(Uri.parse('${BaseURL}api/Common_Controller/events'), body: {});

    var decodedResponse = json.decode(response.body);
    EventsList = decodedResponse['all_events'];
    UpcomingList = decodedResponse['upcomiong_events'];
  }

  EventsDetailsApi({id}) async {
    http.Response response = await http.post(
        Uri.parse('${BaseURL}api/Common_Controller/events'),
        body: {"id": id.toString()});

    var decodedResponse = json.decode(response.body);
    eventdetail = decodedResponse['all_events'];
    razorpaykey = decodedResponse['razorpay_key']['key'];
  }
}
