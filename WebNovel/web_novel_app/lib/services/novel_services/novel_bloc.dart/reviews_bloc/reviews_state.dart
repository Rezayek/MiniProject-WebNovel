import 'package:flutter/foundation.dart';

@immutable
abstract class ReviewsState {
  const ReviewsState();
}

class ReviewStateInit implements ReviewsState {}

class ReviewsStateGetReviews implements ReviewsState {
  final List<Map<String, dynamic>> reviews;
  final Exception? exception;
  ReviewsStateGetReviews({required this.reviews, required this.exception});
}


