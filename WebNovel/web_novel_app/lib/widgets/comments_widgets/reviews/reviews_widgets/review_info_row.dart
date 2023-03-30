import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_rating.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_review_info.dart';

class ReviewInfoRow extends StatelessWidget {
  final double width;
  final String userName;
  final String userImg;
  final String released;
  final int rating;
  final bool isReply;
  const ReviewInfoRow(
      {super.key,
      required this.width,
      required this.userName,
      required this.userImg,
      required this.released,
      required this.rating, required this.isReply});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: !isReply?MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserReviewInfo(
              height: 75,
              width: width * 0.7,
              userName: userName,
              userImg: userImg,
              released: released),
          !isReply?UserRating(height: 75, width: width * 0.2, rating: rating): const SizedBox()
        ],
      ),
    );
  }
}
