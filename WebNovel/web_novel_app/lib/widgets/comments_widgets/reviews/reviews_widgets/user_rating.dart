import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class UserRating extends StatelessWidget {
  final double height;
  final double width;
  final int rating;
  const UserRating({super.key, required this.height, required this.width, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(rating.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: black),),
          Icon(Icons.star, color: const Color.fromARGB(255, 255, 196, 0), size: width * 0.3,)
        ],
      ),
    );
  }
}
