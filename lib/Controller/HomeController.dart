import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tssia_replica/Controller/SigupController.dart';
import 'package:tssia_replica/Generic/Custom/variables.dart';

class HomeController extends GetxController {
  List HomeImages = [].obs;
  List HomeModules = [].obs;
  List Services = [].obs;
  List GalleryImage = [].obs;
  List notification = [].obs;
  var partnerLink;
  List latestupdatelist = [].obs;
  var HomeBannerAndSupportSection;
  var SignController = Get.put(signupcontroller());

  HomePageApi() async {
    http.Response response = await http
        .post(Uri.parse('${BaseURL}api/Common_Controller/home'), body: {});

    var decodedResponse = json.decode(response.body);
    HomeImages = decodedResponse['slider'];
    HomeModules = decodedResponse['tiles'];
    Services = decodedResponse['our_services'];
    GalleryImage = decodedResponse['gallery'];
  }

  Future HomeBannerSupportSection() async {
    http.Response response = await http.get(
      Uri.parse('${MSMEURL}api/home-support-section'),
    );
    var decodedResponse = json.decode(response.body);
    HomeBannerAndSupportSection = decodedResponse['data'];
    partnerLink = decodedResponse['data']['partner']['url'];
  }

  Future NotificationList() async {
    final response = await http.post(
      Uri.parse('${BaseURL}api/Common_Controller/notification'),
      body: {
        "user_role_id": 3.toString(),
        "user_id": SignController.CurrentuserID.toString(),
      },
    );
    var decodedResponse = json.decode(response.body);
    notification = decodedResponse['notification_deatils'];
  }

  List HomeSixModulesImage = [
    'assets/images/Members.svg',
    'assets/images/Committees.svg',
    'assets/images/Help-Other-Join.svg',
    'assets/images/Events.svg',
    'assets/images/Circulars.svg',
    'assets/images/Discussion-Forum.svg',
  ];

  List HomeSixModulesColor = [
    0xffFFF5E2,
    0xffdE6FFEA,
    0xffE1F4FF,
    0xffE1F4FF,
    0xffFFF5E2,
    0xfdE6FFEA,
  ];

  List HomeSixModulesName = [
    'Members',
    'Committees',
    'Help Other Join',
    'Events',
    'Circulars',
    'Discussion Forum',
  ];

  List ServicesModulesName = [
    'Finance',
    'Compliance',
    'Subsidies',
    'HealthCare',
  ];

  List ServicesModulesImage = [
    'assets/images/Finance.svg',
    'assets/images/Compliance.svg',
    'assets/images/Subsidies.svg',
    'assets/images/healthcare.svg',
  ];

  List ServicesModulesColor = [
    0xff0CB8B6,
    0xffF3AE33,
    0xffE6492D,
    0xff769ED8,
  ];

  Future LatestUpdateApi() async {
    http.Response response = await http.get(
      Uri.parse('${MSMEURL}api/home-support-section'),
    );
    var decodedResponse = json.decode(response.body);
    latestupdatelist = decodedResponse['data']['latest_updates'];
  }
}
