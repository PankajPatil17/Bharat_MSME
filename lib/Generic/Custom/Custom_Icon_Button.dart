// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  double diameter;
  Color? color;
  Color? iconColor;
  void Function()? onTap;
  IconData icon;
  double? iconSize;
  CustomIconButton({
    this.diameter = 30.0,
    this.color,
    this.iconColor,
    this.onTap,
    required this.icon,
    this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color ?? Color(0xfff7f7f7),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: iconSize ?? 20.0,
          color: iconColor ?? Colors.black,
        ),
      ),
    );
  }
}
