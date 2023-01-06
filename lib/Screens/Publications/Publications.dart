import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Controller/PublicationController.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_AppBar.dart';
import 'package:tssia_replica/Generic/Common/Common_BottomBar.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Drawer.dart';
import 'package:tssia_replica/Generic/Custom/Custom_Loader.dart';
import 'package:tssia_replica/Screens/WebView/WebView.dart';

class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  var publicationcontroller = Get.put(PublicationController());
  var tapcolor;

  @override
  void initState() {
    tapcolor = 'Publication';
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
            width: 100.h,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Publication()],
              ),
            ),
          )),
          CommonBottomBar(TapColor: tapcolor)
        ],
      )),
    );
  }

  Publication() {
    return FutureBuilder(
      future: publicationcontroller.PublicationListApi(),
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
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.5.h),
          margin: EdgeInsets.only(bottom: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                label: 'Publications',
                size: 13.sp,
                colorT: Colors.black,
                fontw8: FontWeight.w500,
              ),
              SizedBox(
                height: 2.h,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.7,
                ),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: publicationcontroller.publicationList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(1.2.h),
                    decoration: BoxDecoration(
                        color: Color(0xffFFFBE3),
                        border:
                            Border.all(width: 0.5, color: Color(0xffe4e4e4)),
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(0, 4))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 17.h,
                          width: 17.h,
                          margin: EdgeInsets.only(bottom: 1.2.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.5, color: Color(0xffe4e4e4)),
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(publicationcontroller
                                      .publicationList[index]['image']))),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(WebviewScreen(
                              url: publicationcontroller.publicationList[index]
                                  ['redirect_url'],
                              label: '',
                            ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.2.h, horizontal: 2.5.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5, color: Color(0xffe4e4e4)),
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xffEB9000)),
                            child: Text(
                              'Read',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
