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

class ReviewsEventAddReview implements ReviewsEvent {
  final String novelId;
  final String content;
  final String rating;

  ReviewsEventAddReview(
      {required this.novelId, required this.content, required this.rating});
}


class ReviewsEventAddReply implements ReviewsEvent{
  final String content;
  final String otherReplyId;
  ReviewsEventAddReply({required this.content, required this.otherReplyId});
}


class ReviewsEventReact implements ReviewsEvent {
  final String otherReplyId;
  final ReactState state;
  ReviewsEventReact({required this.otherReplyId, required this.state});
}
