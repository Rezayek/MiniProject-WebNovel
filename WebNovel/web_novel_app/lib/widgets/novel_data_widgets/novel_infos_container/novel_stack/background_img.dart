import 'package:flutter/material.dart';

class BackGroundImg extends StatelessWidget {
  final double height;
  final double width;
  final String url;
  const BackGroundImg({super.key, required this.height, required this.width, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: url.isNotEmpty? DecorationImage(image: NetworkImage(url), fit: BoxFit.fill):const DecorationImage(image: AssetImage("assets/novel_default.jpg"), fit: BoxFit.fill)
      ),
    );
  }
}
