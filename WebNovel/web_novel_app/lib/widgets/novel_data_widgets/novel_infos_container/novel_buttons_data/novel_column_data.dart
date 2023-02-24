import 'package:flutter/material.dart';

class NovelColumnData extends StatelessWidget {
  final double height;
  final double width;
  final List<Widget> widgets;
  const NovelColumnData({super.key, required this.height, required this.width, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets,
      ),
    );
  }
}
