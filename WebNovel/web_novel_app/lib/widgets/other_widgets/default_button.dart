import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class DefaultButton extends StatelessWidget {
  final double height;
  final double width;
  final List<double> margins;
  final String text;
  final List<Color> colors;
  const DefaultButton({super.key, required this.height, required this.width, required this.margins, required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(top: margins[0], left: margins[1], bottom: margins[2], right: margins[3]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        )
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: black),)),
    );
  }
}
