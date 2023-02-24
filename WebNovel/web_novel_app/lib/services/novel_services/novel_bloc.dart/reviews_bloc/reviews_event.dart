import 'package:flutter/foundation.dart';
import 'package:web_novel_app/constants/enums.dart';

@immutable
abstract class ReviewsEvent {
  const ReviewsEvent();
}

class ReviewsEventGetReviews implements ReviewsEvent {
  final String novelId;
  ReviewsEventGetReviews({required this.novelId});
}

class ReviewsEventGetReplies implements ReviewsEvent {
  final String novelId;
  ReviewsEventGetReplies({required this.novelId});
}

class ReviewEventAddReview implements ReviewsEvent {
  final String novelId;
  final String content;
  final String rating;

  ReviewEventAddReview(
      {required this.novelId, required this.content, required this.rating});
}

class ReviewEventAddReply implements ReviewsEvent {
  final String novelId;
  final String content;
  final String otherReplyId;

  ReviewEventAddReply(
      {required this.novelId,
      required this.content,
      required this.otherReplyId});
}

class ReviewEventReact implements ReviewsEvent {
  final String otherReplyId;
  final ReactState state;
  ReviewEventReact({required this.otherReplyId, required this.state});
}
