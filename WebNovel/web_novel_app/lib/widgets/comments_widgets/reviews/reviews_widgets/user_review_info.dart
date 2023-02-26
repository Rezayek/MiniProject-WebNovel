import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class UserReviewInfo extends StatelessWidget {
  final double height;
  final double width;
  final String userName;
  final String userImg;
  final String released;
  const UserReviewInfo({super.key, required this.height, required this.width, required this.userName, required this.userImg, required this.released});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.14,
            height: width * 0.14,
            decoration: BoxDecoration(
              image: userImg.isNotEmpty? DecorationImage(image: NetworkImage(userImg), fit: BoxFit.fill):const DecorationImage(image: AssetImage("assets/avatar.png"), fit: BoxFit.fill)
            ),
          ),
          SizedBox(
            height: height * 0.9,
            width: width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: black), overflow: TextOverflow.ellipsis,),
                Text(released, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: black), overflow: TextOverflow.ellipsis, ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
