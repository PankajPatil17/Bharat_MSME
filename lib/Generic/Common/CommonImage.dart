import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonImage extends StatelessWidget {
  CommonImage({required this.url, this.height, this.width, this.type});
  final String url;
  final height;
  final width;
  final type;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        child: url.contains('.svg') == true
            ? SvgPicture.network(
                url,
                fit: BoxFit.fill,
                // color: Colors.white,
              )
            : url.contains('assets/') == true && url.contains('http') == false
                ? Image.asset(
                    url,
                    fit: BoxFit.fill,
                  )
                : Image.network(
                    url,
                    fit: BoxFit.fill,
                  ));
  }
}
