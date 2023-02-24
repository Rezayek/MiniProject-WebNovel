import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/constants/colors.dart';


class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 35.w,
      margin: EdgeInsets.only(top: 0.9.h, bottom: 0.9.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [lightBlue, lightPurple.withOpacity(0.2),], begin: Alignment.centerLeft, end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.filter_alt_outlined, size: 10.w, color: black,),
          const Text("Filter", style: TextStyle(color: black, fontSize: 25, fontWeight: FontWeight.w600),)
        ],
      ),
    
    );
  }
}