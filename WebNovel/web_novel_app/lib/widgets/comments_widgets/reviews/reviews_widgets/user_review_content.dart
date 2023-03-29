import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class UserReviewContent extends StatelessWidget {
  final double width;
  final String content;
  const UserReviewContent({super.key, required this.content, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
      padding: EdgeInsets.all(width * 0.01),
      child: Text(
        content,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: black),
      ),
    );
  }
}
