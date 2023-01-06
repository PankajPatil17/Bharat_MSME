import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';
import 'package:tssia_replica/Screens/HomePage.dart';

class OurServicesController extends GetxController {
  List hallbookingimages = [].obs;
  var HallBookinghtml;
  List visabookingimages = [].obs;
  var visaBookinghtml;
  List ecobookingimages = [].obs;
  var ecoBookinghtml;
  var ecobookingadditionalhtml;
  List bloodbookingimages = [].obs;
  var bloodBookinghtml;

  var SignController = Get.put(signupcontroller());

  Future HallBookingApi() async {
    http.Response response = await http.get(
      Uri.parse('${BaseURL}api/Common_Controller/hall_booking_page'),
    );
    var decodedResponse = json.decode(response.body);
    hallbookingimages = decodedResponse['images'];
    HallBookinghtml = decodedResponse['html'];
  }

  Future HallBookingRequest() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/member_enquiry'),
      body: {
        "role_id": '2',
        "user_id": SignController.CurrentuserID.toString(),
        "enq_menu": 'enq_hallbk',
        "contact_desc": ''
      },
    );
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (response.statusCode == 200) {
      Get.to(HomePage());
      Get.snackbar('Success', 'Enquiry Request added Successfully');
    }
  }

  Future VisaBookingApi() async {
    http.Response response = await http.get(
      Uri.parse('${BaseURL}api/Common_Controller/visa_recom_page'),
    );
    var decodedResponse = json.decode(response.body);
    visabookingimages = decodedResponse['images'];
    visaBookinghtml = decodedResponse['html'];
  }

  Future VisaBookingRequest() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/member_enquiry'),
      body: {
        "role_id": '2',
        "user_id": SignController.CurrentuserID.toString(),
        "enq_menu": 'enq_visarl',
        "contact_desc": ''
      },
    );
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (response.statusCode == 200) {
      Get.to(HomePage());
      Get.snackbar('Success', 'Enquiry Request added Successfully');
    }
  }

  Future EcoBookingApi() async {
    http.Response response = await http.get(
      Uri.parse('${BaseURL}api/Common_Controller/ecoo_page'),
    );
    var decodedResponse = json.decode(response.body);
    ecobookingimages = decodedResponse['images'];
    ecoBookinghtml = decodedResponse['html'];
    ecobookingadditionalhtml = decodedResponse['ecoo_page_additinal_html'];
  }

  Future EcoBookingRequest() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/member_enquiry'),
      body: {
        "role_id": '2',
        "user_id": SignController.CurrentuserID.toString(),
        "enq_menu": 'enq_ecoo',
        "contact_desc": ''
      },
    );
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (response.statusCode == 200) {
      Get.to(HomePage());
      Get.snackbar('Success', 'Enquiry Request added Successfully');
    }
  }

  Future BloodBookingApi() async {
    http.Response response = await http.get(
      Uri.parse('${BaseURL}api/Common_Controller/blood_bank_page'),
    );
    var decodedResponse = json.decode(response.body);
    bloodbookingimages = decodedResponse['images'];
    bloodBookinghtml = decodedResponse['html'];
  }

  Future BloodBookingRequest() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/member_enquiry'),
      body: {
        "role_id": '2',
        "user_id": SignController.CurrentuserID.toString(),
        "enq_menu": 'enq_bloodbank',
        "contact_desc": ''
      },
    );
    var decodedResponse = json.decode(response.body);
    print(decodedResponse);
    if (response.statusCode == 200) {
      Get.to(HomePage());
      Get.snackbar('Success', 'Enquiry Request added Successfully');
    }
  }
}
