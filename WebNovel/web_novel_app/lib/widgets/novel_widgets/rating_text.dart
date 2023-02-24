import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';



class RatingText extends StatelessWidget {
  final double rating;
  final Color color;
  const RatingText({Key? key, required this.rating, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      width: 24.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Rating",
              style: TextStyle(
                  color: color, fontSize: 15, fontWeight: FontWeight.w400)),
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          ),
          Text(rating.toString(),
              style: TextStyle(
                  color: color, fontSize: 15, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
