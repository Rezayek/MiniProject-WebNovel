import 'package:flutter/material.dart';


import '../../../../constants/colors.dart';

class TotaleCrytals extends StatelessWidget {
  final double height;
  final double width;
  final String crytals;
  const TotaleCrytals({super.key, required this.height, required this.width, required this.crytals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.diamond_outlined, color: lightPurple, size: width * 0.3,),
          Text(crytals, style: const TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}