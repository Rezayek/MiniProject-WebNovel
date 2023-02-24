import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class TagContainer extends StatelessWidget {
  final String tag;
  const TagContainer({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = tag.length * 9.5;
    return Container(
      margin: const EdgeInsets.only(right: 2, left: 2),
      height: 3.h,
      width: size +  1.w,
      decoration: BoxDecoration(
        color: lightPurple.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text("#$tag", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: white),)),
    );
  }
}
