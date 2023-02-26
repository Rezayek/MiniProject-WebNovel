import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

class UserReviewContent extends StatelessWidget {
  final double height;
  final double width;
  final String content;
  const UserReviewContent(
      {super.key,
      required this.height,
      required this.width,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
      padding: EdgeInsets.all(width * 0.01),
      height: height,
      width: width - width * 0.1,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.75,
                offset: const Offset(1, 1),
                color: black.withOpacity(0.5)),
            BoxShadow(
                blurRadius: 0.75,
                offset: const Offset(-1, -1),
                color: black.withOpacity(0.5)),
          ]),
      child: Text(
        content,
        style: const TextStyle(
        fontSize: 15, fontWeight: FontWeight.w400, color: black),
      ),
    );
  }
}
