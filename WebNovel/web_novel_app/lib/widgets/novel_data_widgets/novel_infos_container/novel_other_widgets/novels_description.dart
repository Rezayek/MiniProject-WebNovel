import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/label/label.dart';

import '../../../../constants/colors.dart';

class NovelDescription extends StatelessWidget {
  final double width;
  final String description;
  const NovelDescription({super.key, required this.width, required this.description, });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10.h + (description.length * 100.h) * 0.0015,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title: "Summary", gradiantColors: [lightBlue.withOpacity(0.5), white.withOpacity(0)] , margin: [1.h, 1.h, 2.w], expanded: 5.w),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(description, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: black),),
          )
        ],
      ),
    );
  }
}