import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_novel_app/constants/colors.dart';

class TotalGifts extends StatelessWidget {
  final double height;
  final double width;
  final String gifts;
  const TotalGifts({super.key, required this.height, required this.width, required this.gifts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(gifts, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: black), overflow: TextOverflow.ellipsis,),
          Icon(FontAwesomeIcons.gift, color: lightPurple, size: width * 0.4,)
        ],
      ),
    );
  }
}