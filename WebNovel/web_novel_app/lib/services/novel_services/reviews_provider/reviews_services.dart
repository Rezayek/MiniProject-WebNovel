
import 'package:web_novel_app/services/novel_services/reviews_provider/reviews_manager.dart';
import 'package:web_novel_app/services/novel_services/reviews_provider/reviews_provider.dart';

class ReviewsServices implements ReviewsProvider {
  final ReviewsProvider provider;
  static final _shared = ReviewsServices._sharedInstance(ReviewsManager());
  ReviewsServices._sharedInstance(this.provider);
  factory ReviewsServices() => _shared;
  @override
  Future<void> addReply(String content, String replytoUserId) => provider.addReply(content, replytoUserId);

  @override
  Future<void> addReview(String novelId, String content, int rating) => provider.addReview(novelId, content, rating);


  @override
  Future<void> cacheReviews(String novelId) {
    throw UnimplementedError();
  }


  @override
  Future<List<Map<String, dynamic>>> getReviews(String novelId) {
    throw UnimplementedError();
  }


  @override
  Stream<List<Map<String, dynamic>>> reviewsStream(String novelId) => provider.reviewsStream(novelId);

  //----------------------------------------------------------------
  // @override
  // Future<void> cacheUser() {
  //   // TODO: implement cacheUser
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<UserData>> getUser() {
  //   // TODO: implement getUser
  //   throw UnimplementedError();
  // }

  // @override
  // Stream<List<UserData>> usersStream() => provider.usersStream();

  //----------------------------------------------------------------
}
