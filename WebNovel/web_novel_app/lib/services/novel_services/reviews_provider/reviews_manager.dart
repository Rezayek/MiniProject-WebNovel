import 'dart:async';


import 'package:web_novel_app/services/novel_services/models/review_model.dart';
import 'package:web_novel_app/services/novel_services/reviews_provider/reviews_provider.dart';

import '../../../constants/review_const.dart';
import '../../../utilities/singletons/user_singleton.dart';
import 'dart:developer' as debug;



class ReviewsManager implements ReviewsProvider {
  List<Map<String, dynamic>> _reviews =[] ;
  late final StreamController<List<Map<String, dynamic>>> _reviewsStream;

  //----------------------------------------------------------------
  // late List<UserData> _users = [] ;
  // late final StreamController<List<UserData>> _usersStream;
  //----------------------------------------------------------------

  static final _shared = ReviewsManager._sharedInstance();
  ReviewsManager._sharedInstance() {
    _reviewsStream =
        StreamController<List<Map<String, dynamic>>>.broadcast(onListen: () {
      _reviewsStream.sink.add(_reviews);
    });

    //----------------------------------------------------------------
    // _usersStream = StreamController<List<UserData>>.broadcast(onListen: () {
    //   _usersStream.sink.add(_users);
    // });
    //----------------------------------------------------------------
  }
  factory ReviewsManager() => _shared;

  Map<String, dynamic> rev = {
    "reviews": [
      {
        "reviewId": "4",
        "userName": "user 4",
        "url": "",
        "postDate": "2 months ago",
        "rating": 4,
        "content":
            "content content content content content content content content content content content content content content content content content content",
        "likes": "2",
        "dislikes": "3",
        "replies": 2,
        "reply": [
          {
            "reviewId": "5",
            "userName": "user 5",
            "url": "",
            "postDate": "2 months ago",
            "rating": 4,
            "content":
                "content content content content content content content content content content content content content content content content content content",
            "likes": "2",
            "dislikes": "3",
            "replies": 1,
            "reply": [
              {
                "reviewId": "6",
                "userName": "user 6",
                "url": "",
                "postDate": "2 months ago",
                "rating": 4,
                "content":
                    "content content content content content content content content content content content content content content content content content content",
                "likes": "2",
                "dislikes": "3",
                "replies": 1,
                "reply": [
                  {
                    "reviewId": "14",
                    "userName": "user 14",
                    "url": "",
                    "postDate": "2 months ago",
                    "rating": 4,
                    "content":
                        "content content content content content content content content content content content content content content content content content content",
                    "likes": "2",
                    "dislikes": "3",
                    "replies": 0,
                    "reply": []
                  }
                ]
              },
              {
                "reviewId": "13",
                "userName": "user 13",
                "url": "",
                "postDate": "1 months ago",
                "rating": 4,
                "content":
                    "content content content content content content content content content content content content content content content content content content",
                "likes": "2",
                "dislikes": "3",
                "replies": 0,
                "reply": []
              }
            ]
          },
          {
            "reviewId": "7",
            "userName": "user 7",
            "url": "",
            "postDate": "2 months ago",
            "rating": 4,
            "content":
                "content content content content content content content content content content content content content content content content content content",
            "likes": "2",
            "dislikes": "3",
            "replies": 0,
            "reply": []
          }
        ]
      },
      {
        "reviewId": "8",
        "userName": "user 8",
        "url": "",
        "postDate": "2 months ago",
        "rating": 4,
        "content": "content content content",
        "likes": "2",
        "dislikes": "3",
        "replies": 0,
        "reply": []
      },
      {
        "reviewId": "9",
        "userName": "user 9",
        "url": "",
        "postDate": "2 months ago",
        "rating": 4,
        "content":
            "content content content content content  content content content content",
        "likes": "2",
        "dislikes": "3",
        "replies": 1,
        "reply": [
          {
            "reviewId": "10",
            "userName": "user 10",
            "url": "",
            "postDate": "2 months ago",
            "rating": 4,
            "content":
                " content content content content content content content content content content content content content content content content content content",
            "likes": "2",
            "dislikes": "3",
            "replies": 1,
            "reply": [
              {
                "reviewId": "11",
                "userName": "user 11",
                "url": "",
                "postDate": "2 months ago",
                "rating": 4,
                "content":
                    "content content content content content content content content content content content content content content content content content content",
                "likes": "2",
                "dislikes": "3",
                "replies": 1,
                "reply": [
                  {
                    "reviewId": "12",
                    "userName": "user 12",
                    "url": "",
                    "postDate": "5 months ago",
                    "rating": 5,
                    "content":
                        " content content content content content content content content content content content content content content content content content content",
                    "likes": "2",
                    "dislikes": "3",
                    "replies": 1,
                    "reply": [
                      {
                        "reviewId": "13",
                        "userName": "user 13",
                        "url": "",
                        "postDate": "5 months ago",
                        "rating": 5,
                        "content":
                            " content content content content content content content content content content content content content content content content content content",
                        "likes": "2",
                        "dislikes": "3",
                        "replies": 0,
                        "reply": []
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  };

  @override
  Stream<List<Map<String, dynamic>>> reviewsStream(String novelId) {
    cacheReviews(novelId);
    return _reviewsStream.stream;
  }

  @override
  Future<void> cacheReviews(String novelId) async {
    _reviews = await getReviews(novelId);
    _reviewsStream.add(_reviews);
  }

  //----------------------------------------------------------------
  // @override
  // Stream<List<UserData>> usersStream() {
  //   cacheUser();
  //   return _usersStream.stream;
  // }

  // @override
  // Future<void> cacheUser() async {
    
  //   _users = await getUser();
  //   _usersStream.add(_users);
  // }

  // @override
  // Future<List<UserData>> getUser() async {
    
  //   final userId = UserSingleton().currentUser.userId;
  //   final user = await FirebaseFirestore.instance.collection('Users')
  //         .where(
  //           'user_id',
  //           isEqualTo: userId,
  //         )
  //         .get()
  //         .then(
  //           (value) =>
  //               value.docs.map((doc) => UserData.fromSnapshot(doc)).toList(),
  //         );
  //   return user;
  // }

  //----------------------------------------------------------------

  @override
  Future<List<Map<String, dynamic>>> getReviews(String novelId) async {
    // ignore: unused_local_variable
    final userId = UserSingleton().currentUser.userId;
    List<Map<String, dynamic>> reviewsList = [];

    for (var review in rev["reviews"]) {
      Map<String, dynamic> reviewContainer = {};

      var reviewModel = ReviewModel.fromSnapshot({
        "reviewId": review["reviewId"],
        "userName": review["userName"],
        "url": review["url"],
        "postDate": review["postDate"],
        "rating": review["rating"],
        "content": review["content"],
        "likes": review["likes"],
        "dislikes": review["dislikes"],
        "replies": review["replies"],
      });
      reviewContainer.addAll({reviewField: reviewModel, reviewReplyField: []});
      if (review["replies"] > 0) {
        reviewContainer[reviewReplyField] =
            parseReplies(review[reviewReplyField]);
      }
      reviewsList.add(reviewContainer);
    }
    await Future.delayed(const Duration(seconds: 5));

    return reviewsList;
  }

  List<Map<String, dynamic>> parseReplies(List<dynamic> replies) {
    List<Map<String, dynamic>> replyList = [];

    for (var reply in replies) {
      Map<String, dynamic> reviewContainer = {};

      var reviewModel = ReviewModel.fromSnapshot({
        "reviewId": reply["reviewId"],
        "userName": reply["userName"],
        "url": reply["url"],
        "postDate": reply["postDate"],
        "rating": reply["rating"],
        "content": reply["content"],
        "likes": reply["likes"],
        "dislikes": reply["dislikes"],
        "replies": reply["replies"],
      });
      reviewContainer.addAll({reviewField: reviewModel, reviewReplyField: []});
      if (reply["replies"] > 0) {
        reviewContainer[reviewReplyField] =
            parseReplies(reply[reviewReplyField]);
      }

      replyList.add(reviewContainer);
    }

    return replyList;
  }

  @override
  Future<void> addReply(String content, String replytoUserId) async {
    debug.log("add reply");
  }

  @override
  Future<void> addReview(String novelId, String content, int rating) async {
    debug.log("add review");
  }
}
