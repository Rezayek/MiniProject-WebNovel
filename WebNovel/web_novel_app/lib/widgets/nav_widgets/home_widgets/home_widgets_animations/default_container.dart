import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

class DefaultContainer extends StatelessWidget {
  final double height;
  final double width;
  const DefaultContainer({Key? key, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0.7.h , bottom: 0.7.h ),
      width: width,
      height: height,
      decoration: BoxDecoration(color: black.withOpacity(0.35),
      borderRadius: BorderRadius.circular(15)),
    );
  }
}
