import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class HistoryOption extends StatelessWidget {
  final String optionName;
  final Function(bool) removeOption;
  final Function(bool) optionTapped;
  const HistoryOption(
      {super.key, required this.optionName, required this.removeOption, required this.optionTapped});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: 95.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 7.w,color: black,),
          GestureDetector(
            onTap: ()=> optionTapped(true),
            child: Container(
              margin: EdgeInsets.only(left: 2.w, top: 0.5.h),
              height: 5.h,
              width: 63.w,
              child: Text(
                optionName,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          GestureDetector(
              onTap: () => removeOption(true),
              child: Icon(
                Icons.delete,
                size: 7.w,
                color: black,
              ))
        ],
      ),
    );
  }
}
