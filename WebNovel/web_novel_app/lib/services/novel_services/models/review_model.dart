import 'package:flutter/foundation.dart';

import '../../../constants/review_const.dart';

@immutable
class ReviewModel {
  final String reviewId;
  final String userName;
  final String userImgUrl;
  final String postDate;
  final int rating;
  final String content;
  final String likes;
  final String dislikes;
  final int repliesNumber;

  const ReviewModel(
      {required this.reviewId,
      required this.userName,
      required this.userImgUrl,
      required this.postDate,
      required this.rating,
      required this.content,
      required this.likes,
      required this.dislikes,
      required this.repliesNumber});

  factory ReviewModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      ReviewModel(
          reviewId: snapshot[reviewIdConst],
          userName: snapshot[reviewUserName],
          userImgUrl: snapshot[reviewUserImg],
          postDate: snapshot[reviewPostDate],
          rating: snapshot[reviewRating],
          content: snapshot[reviewContent],
          likes: snapshot[reviewLikes],
          dislikes: snapshot[reviewDislike],
          repliesNumber: snapshot[reviewReplies]
          );
}
