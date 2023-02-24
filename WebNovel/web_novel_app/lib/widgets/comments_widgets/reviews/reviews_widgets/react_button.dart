import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ReactButton extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final bool isUp;
  final bool isActive;
  const ReactButton(
      {super.key,
      required this.height,
      required this.width,
      required this.size,
      required this.isUp, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: isUp?Icon(Icons.thumb_up_alt, color: isActive? green: black, size: size,):Icon(Icons.thumb_down_alt, color: isActive? red: black, size: size,),
    );
  }
}
