import 'package:flutter/material.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_rating.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_review_info.dart';

class ReviewInfoRow extends StatelessWidget {
  final double height;
  final double width;
  final String userName;
  final String userImg;
  final String released;
  final int rating;
  final bool isReply;
  const ReviewInfoRow(
      {super.key,
      required this.height,
      required this.width,
      required this.userName,
      required this.userImg,
      required this.released,
      required this.rating, required this.isReply});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserReviewInfo(
              height: height,
              width: width * 0.75,
              userName: userName,
              userImg: userImg,
              released: released),
          !isReply?UserRating(height: height, width: width * 0.2, rating: rating): const SizedBox()
        ],
      ),
    );
  }
}
