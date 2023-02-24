import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import 'default_border.dart';

class DialogButton extends StatelessWidget {
  final String buttonText;
  const DialogButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 24.w,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
        DefaultBorder(
            borderRadius: 25,
            height: 5.5.h,
            width: 23.w),
        Container(
          height: 5.2.h,
          width: 21.w,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(child: Text(buttonText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        )
      ]),
    );
  }
}