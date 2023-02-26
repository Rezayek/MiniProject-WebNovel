import 'dart:math';

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/enums.dart';
import 'package:web_novel_app/services/novel_services/models/review_model.dart';

import 'package:web_novel_app/utilities/singletons/media_query_singleton.dart';

import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/bottom_react.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/review_info_row.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/reviews_generator/reviews_container.dart';

import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_review_content.dart';


class NovelReviewContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool hasReplies;
  final bool isReply;
  final ReviewModel review;
  final List<dynamic> reply;
  final String novelId;
  const NovelReviewContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.hasReplies,
      required this.isReply,
      required this.review,
      required this.reply, required this.novelId});

  @override
  State<NovelReviewContainer> createState() => _NovelReviewContainerState();
}

class _NovelReviewContainerState extends State<NovelReviewContainer> {
  late bool _loadReplies;

  @override
  void initState() {
    _loadReplies = false;
    super.initState();
  }

  //test value
  int index = Random().nextInt(100);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuerySingleton()
            .generateTextHeight(widget.review.content, 15.5, widget.width) +
        widget.height * 0.5;
    setState(() {
      height = !_loadReplies ? height : height + 50.h;
    });
    return SizedBox(
      height: height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewInfoRow(
            height: widget.height * 0.24,
            width: widget.width,
            userName: widget.review.userName,
            userImg: widget.review.userImgUrl,
            released: widget.review.postDate,
            rating: widget.review.rating,
            isReply: widget.isReply,
          ),
          UserReviewContent(
              height: MediaQuerySingleton().generateTextHeight(
                  widget.review.content, 15.5, widget.width),
              width: widget.width,
              content: widget.review.content),
          BottomReact(
            height: widget.height * 0.2,
            width: widget.width,
            reactState: ReactState.none,
            hasReplies: widget.hasReplies,
            reviewId: widget.review.reviewId,
            userName: widget.review.userName,
            loadReplies: (loadReplies) {
              if (loadReplies) {
                setState(() {
                  _loadReplies = true;
                });
              } else {
                setState(() {
                  _loadReplies = false;
                });
              }
            },
          ),
          _loadReplies
              ? ReviewsContainer(
                  height: height,
                  width: widget.width,
                  isReply: true,
                  reviews: widget.reply, novelId: widget.novelId,)
              : const SizedBox(),
        ],
      ),
    );
  }
}
