import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class GiftPowerContainer extends StatelessWidget {
  final double width;
  final double height;
  final List<Widget> children;
  const GiftPowerContainer({super.key, required this.width, required this.height, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h,),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(offset: Offset(1, 1), blurRadius: 1)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
