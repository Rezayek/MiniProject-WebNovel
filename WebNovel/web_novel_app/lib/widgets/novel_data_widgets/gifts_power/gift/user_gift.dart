import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class UserGift extends StatelessWidget {
  final double height;
  final double width;
  final String giftName;
  final String url;
  const UserGift({super.key, required this.height, required this.width, required this.giftName, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: height * 0.8,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(blurRadius: 1, offset: const Offset(1, 1), color: black.withOpacity(0.7))],
              image: url.isNotEmpty? DecorationImage(image: NetworkImage(url),fit: BoxFit.fill): const DecorationImage(image: AssetImage("assets/logo_app.png"),fit: BoxFit.fill)  
            ),
          ),
          SizedBox(
            height: height * 0.7,
            width: width * 0.55,
            child: Center(child: Text(giftName, style: const TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,)))
        ],
      ),
    );
  }
}
