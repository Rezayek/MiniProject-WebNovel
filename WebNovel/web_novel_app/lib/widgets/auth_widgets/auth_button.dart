// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

import 'default_border.dart';

class AuthButton extends StatelessWidget {
  String buttonText;
  AuthButton({Key? key, required this.buttonText}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      width: 35.w,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
        DefaultBorder(
            borderRadius: 25,
            height: 7.7.h,
            width: 33.w),
        Container(
          height: 7.3.h,
          width: 31.w,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(25)
          ),
          child: Center(child: Text(buttonText, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
        )
      ]),
    );
  }
}
