import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tssia_replica/Controller/Our_ServicesController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';

class EcooPage extends StatefulWidget {
  const EcooPage({super.key});

  @override
  State<EcooPage> createState() => _EcooPageState();
}

class _EcooPageState extends State<EcooPage> {
  var ourservicescontroller = Get.put(OurServicesController());
  var TapColor;

  @override
  void initState() {
    ourservicescontroller.EcoBookingApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PWhite,
      drawer: CustomDrawer(),
      appBar: PreferredSize(
          child: SafeArea(child: CommonAppBar()),
          preferredSize: Size(100.h, 20.h)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(1.5.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BannerImages(),
                    htmlData(),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          ourservicescontroller.EcoBookingRequest();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 2.h),
                          height: 6.h,
                          width: 25.h,
                          decoration: BoxDecoration(
                              color: Color(0xffF89902),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  width: 0.5, color: Color(0xffe4e4e4))),
                          child: CommonText(
                            colorT: PWhite,
                            fontw8: FontWeight.w400,
                            label: 'Enquire Now',
                            size: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            CommonBottomBar(TapColor: TapColor)
          ],
        ),
      ),
    );
  }

  BannerImages() {
    return FutureBuilder(
      future: ourservicescontroller.EcoBookingApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 24.h,
            width: 100.w,
            child: CustomLoader(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
          );
        }
        return Container(
          margin: EdgeInsets.only(bottom: 1.5.h),
          height: 24.h,
          width: 70.h,
          child: CarouselSlider.builder(
            itemCount: ourservicescontroller.ecobookingimages.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: 100.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: Mainboxshadow,
                    border: Border.all(width: 0.5, color: Color(0xffe4e4e4))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    ourservicescontroller.ecobookingimages[index]['image'],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              enlargeCenterPage: true,
              autoPlay: ourservicescontroller.ecobookingimages.length == 1
                  ? false
                  : true,
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
              disableCenter: false,
              aspectRatio: 10 / 5,
              initialPage: 0,
              autoPlayInterval: Duration(seconds: 2),
            ),
          ),
        );
      },
    );
  }

  htmlData() {
    return FutureBuilder(
      future: ourservicescontroller.EcoBookingApi(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: 24.h,
            width: 100.w,
            child: CustomLoader(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HtmlWidget(
              '''
                                 ${ourservicescontroller.ecoBookinghtml}
                                ''',
              customStylesBuilder: (element) {
                if (element.classes.contains('foo')) {
                  return {'color': 'red'};
                }
                return null;
              },
              enableCaching: true,
              onErrorBuilder: (context, element, error) =>
                  Text('$element error: $error'),
              onLoadingBuilder: (context, element, loadingProgress) =>
                  CircularProgressIndicator(),
              renderMode: RenderMode.column,
              textStyle: TextStyle(
                fontFamily: 'Lato',
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            HtmlWidget(
              '''
                                 ${ourservicescontroller.ecobookingadditionalhtml}
                                ''',
              customStylesBuilder: (element) {
                if (element.classes.contains('foo')) {
                  return {'color': 'red'};
                }
                return null;
              },
              enableCaching: true,
              onErrorBuilder: (context, element, error) =>
                  Text('$element error: $error'),
              onLoadingBuilder: (context, element, loadingProgress) =>
                  CircularProgressIndicator(),
              renderMode: RenderMode.column,
              textStyle: TextStyle(
                fontFamily: 'Lato',
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}
