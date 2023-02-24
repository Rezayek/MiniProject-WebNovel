import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class Label extends StatelessWidget {
  final String title;
  final List<Color> gradiantColors;
  final List<double> margin;
  final double expanded;
  const Label(
      {Key? key,
      required this.title,
      required this.gradiantColors,
      required this.margin, required this.expanded})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int titleWidth = title.length * 18;
    return Container(
      margin: EdgeInsets.only(top: margin[0], bottom: margin[1], left: margin[2]),
      height: 10.h,
      width: titleWidth + 10.w + expanded,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            height: 7.h,
            width: titleWidth + 1.5.w + expanded,
            decoration: const BoxDecoration(color: black),
          )),
          Positioned(
            bottom: 3.h,
            right: 3.h,
            child: Container(
              height: 7.h,
              width: titleWidth + 5.w + expanded,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: gradiantColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: white, fontWeight: FontWeight.w600, fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
