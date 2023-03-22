

abstract class ReviewsProvider {
  Stream<List<Map<String, dynamic>>> reviewsStream(String novelId);

  Future<void> cacheReviews(String novelId);

  Future<List<Map<String, dynamic>>> getReviews(String novelId);
  Future<void> addReview(String novelId, String content, int rating);
  Future<void> addReply(String content, String replytoUserId);

  // Stream<List<UserData>> usersStream();

  // Future<void> cacheUser();

  // Future<List<UserData>> getUser() ;
}
