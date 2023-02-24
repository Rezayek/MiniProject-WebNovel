import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class NovelImage extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final double opacity;
  const NovelImage(
      {Key? key, required this.url, required this.height, required this.width, required this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: black.withOpacity(opacity),
              offset: const Offset(1.5, 1.5),
              spreadRadius: 2)
        ],
        image: url.isNotEmpty
            ? DecorationImage(image: NetworkImage(url), fit: BoxFit.fill)
            : const DecorationImage(
                image: AssetImage("assets/novel_default.jpg"),
                fit: BoxFit.fill),
      ),
    );
  }
}
