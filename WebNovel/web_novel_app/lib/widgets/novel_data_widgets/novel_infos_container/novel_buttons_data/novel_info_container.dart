import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class NovelInfoContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<Widget> widgets;
  final List<Color> backgroundColor;
  final Function(bool)? action;
  const NovelInfoContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.widgets,
      required this.backgroundColor,
      this.action});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action!(true); 
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: white,
            gradient: LinearGradient(
                colors: backgroundColor,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: [BoxShadow(color: black.withOpacity(0.5), offset: const Offset(0.75, 0.75), spreadRadius: 1, blurRadius: 1)],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widgets,
        ),
      ),
    );
  }
}
