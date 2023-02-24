import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class NovelImg extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  const NovelImg({super.key, required this.height, required this.width, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.05),
      height: height - (height * 0.05),
      width: width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(25),
        image: url.isNotEmpty? DecorationImage(image: NetworkImage(url), fit: BoxFit.fill):const DecorationImage(image: AssetImage("assets/novel_default.jpg"), fit: BoxFit.fill),
        boxShadow: [BoxShadow(blurRadius: 1, offset: const Offset(1, 1),  color: black.withOpacity(0.8), spreadRadius: 1.5)]     
      ),
    );
  }
}