// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class DefaultBorder extends StatelessWidget {
  double borderRadius, height, width;
  
  DefaultBorder({Key? key, required this.borderRadius, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: const LinearGradient(
            colors: [semiDarkPurple , darkBlue, lightBlue ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
    );
  }
}
