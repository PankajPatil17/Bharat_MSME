import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tssia_replica/Generic/Common/CommonText.dart';
import 'package:tssia_replica/Generic/Common/Common_Color.dart';

class CommonSequences extends StatefulWidget {
  final number;

  const CommonSequences({super.key, required this.number});

  @override
  State<CommonSequences> createState() => _CommonSequencesState();
}

class _CommonSequencesState extends State<CommonSequences> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Sequence(
            BorderColor: int.parse('${widget.number}') >= int.parse('1')
                ? Colors.red
                : Colors.transparent,
            NumberColor: int.parse('${widget.number}') >= int.parse('1')
                ? Colors.red
                : Colors.grey.shade500,
            BoxNumber: 1,
            BoxColor: PWhite),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 2.8.h),
            height: 2.5,
            color: int.parse('${widget.number}') >= int.parse('1')
                ? Colors.red
                : Colors.grey.shade400,
          ),
        ),
        Sequence(
            BorderColor: int.parse('${widget.number}') >= int.parse('2')
                ? Colors.red
                : Colors.transparent,
            NumberColor: int.parse('${widget.number}') >= int.parse('2')
                ? Colors.red
                : Colors.grey.shade500,
            BoxNumber: 2,
            BoxColor: PWhite),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 2.8.h),
            height: 2.5,
            color: int.parse('${widget.number}') >= int.parse('2')
                ? Colors.red
                : Colors.grey.shade400,
          ),
        ),
        Sequence(
            BorderColor: int.parse('${widget.number}') >= int.parse('3')
                ? Colors.red
                : Colors.transparent,
            NumberColor: int.parse('${widget.number}') >= int.parse('3')
                ? Colors.red
                : Colors.grey.shade500,
            BoxNumber: 3,
            BoxColor: PWhite),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 2.8.h),
            height: 2.5,
            color: int.parse('${widget.number}') >= int.parse('3')
                ? Colors.red
                : Colors.grey.shade400,
          ),
        ),
        Sequence(
            BorderColor: int.parse('${widget.number}') >= int.parse('4')
                ? Colors.red
                : Colors.transparent,
            NumberColor: int.parse('${widget.number}') >= int.parse('4')
                ? Colors.red
                : Colors.grey.shade500,
            BoxNumber: 4,
            BoxColor: PWhite),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 2.8.h),
            height: 2.5,
            color: int.parse('${widget.number}') >= int.parse('4')
                ? Colors.red
                : Colors.grey.shade400,
          ),
        ),
        Sequence(
            BorderColor: int.parse('${widget.number}') >= int.parse('5')
                ? Colors.red
                : Colors.transparent,
            NumberColor: int.parse('${widget.number}') >= int.parse('5')
                ? Colors.red
                : Colors.grey.shade500,
            BoxNumber: 5,
            BoxColor: PWhite),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 2.8.h),
            height: 2.5,
            color: int.parse('${widget.number}') >= int.parse('5')
                ? Colors.red
                : Colors.grey.shade400,
          ),
        ),
        Sequence(
            BorderColor: int.parse('${widget.number}') >= int.parse('6')
                ? Colors.red
                : Colors.transparent,
            NumberColor: int.parse('${widget.number}') >= int.parse('6')
                ? Colors.red
                : Colors.grey.shade500,
            BoxNumber: 6,
            BoxColor: PWhite),
      ],
    );
  }

  Sequence({BoxColor, BorderColor, BoxNumber, NumberColor}) {
    return Container(
      padding: EdgeInsets.all(1.5.h),
      margin: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
          boxShadow: Mainboxshadow,
          shape: BoxShape.circle,
          color: BoxColor,
          border: Border.all(width: 1.0, color: BorderColor)),
      child: Center(
          child: CommonText(
        label: BoxNumber.toString(),
        fontw8: FontWeight.w500,
        size: 10.sp,
        colorT: NumberColor,
        maxline: 1,
      )),
    );
  }
}
