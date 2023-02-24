import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class BackGroundColor extends StatelessWidget {
  final double height;
  final double width;
  const BackGroundColor({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: white.withOpacity(0.7)
      ),
    );
  }
}