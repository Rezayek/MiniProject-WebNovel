

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/constants/enums.dart';
import 'package:web_novel_app/constants/review_const.dart';
import 'package:web_novel_app/services/novel_services/models/review_model.dart';

import 'package:web_novel_app/utilities/singletons/media_query_singleton.dart';

import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/bottom_react.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/review_info_row.dart';


import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_review_content.dart';

class NovelReviewContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool hasReplies;
  final bool isReply;
  final ReviewModel review;
  final List<dynamic> reply;
  final String novelId;
  final Function(double newHeight) changeHeight;
  const NovelReviewContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.hasReplies,
      required this.isReply,
      required this.review,
      required this.reply,
      required this.novelId,
      required this.changeHeight});

  @override
  State<NovelReviewContainer> createState() => _NovelReviewContainerState();
}

class _NovelReviewContainerState extends State<NovelReviewContainer> {
  late bool _loadReplies;
  double height = 0;
  double childHeight = 0;

  @override
  void initState() {
    _loadReplies = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuerySingleton().generateTextHeight(widget.review.content, 16.5, widget.width, widget.height * 0.5) +widget.height * 0.44;
    return SizedBox(
      height: !_loadReplies ? height : height + maxHeightCalcul() + childHeight,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          SizedBox(
            height: (!_loadReplies
                    ? height
                    : height + maxHeightCalcul() + childHeight) -
                widget.height * 0.24,
            width: widget.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _loadReplies
                    ? Container(
                        height: (!_loadReplies
                                ? height
                                : height + borderHeight() + childHeight) -
                            widget.height * 0.2,
                        width: widget.width * 0.005,
                        decoration: const BoxDecoration(color: black),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: (!_loadReplies
                          ? height
                          : height + maxHeightCalcul() + childHeight) -
                      widget.height * 0.24,
                  width: widget.width * 0.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      UserReviewContent(
                          height: MediaQuerySingleton().generateTextHeight(widget.review.content, 15, widget.width * 0.95, widget.height * 0.5),
                          width: widget.width * 0.95,
                          content: widget.review.content),
                      BottomReact(
                        height: widget.height * 0.2,
                        width: widget.width * 0.95,
                        reactState: ReactState.none,
                        hasReplies: widget.hasReplies,
                        reviewId: widget.review.reviewId,
                        userName: widget.review.userName,
                        loadReplies: (loadReplies) {
                          if (loadReplies) {
                            setState(() {
                              _loadReplies = true;
                              widget.changeHeight(maxHeightCalcul() + childHeight);
                            });
                          } else {
                            setState(() {
                              _loadReplies = false;
                              widget.changeHeight(0);
                            });
                          }
                        },
                      ),
                      _loadReplies
                          ? SizedBox(
                              height: maxHeightCalcul() + childHeight,
                              width: widget.width * 0.9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: generateReplies(),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> generateReplies() {
    final width = widget.width - widget.width * 0.12;
    List<Widget> replies = [];
    for (var reply in widget.reply) {
      var review = reply[reviewField] as ReviewModel;
      var replyChild = reply[reviewReplyField] as List<dynamic>;
      replies.add(NovelReviewContainer(
        height: 32.h,
        width: width,
        hasReplies: review.repliesNumber == 0 ? false : true,
        isReply: true,
        review: review,
        reply: replyChild,
        novelId: widget.novelId,
        changeHeight: (newHeight) {
          setState(() {
            childHeight =  newHeight;
            widget.changeHeight(maxHeightCalcul() + newHeight);
          });
        },
      ));
    }
    return replies;
  }

  double maxHeightCalcul() {
    var newHeight = 0.0;
    for (var reply in widget.reply) {
      var review = reply[reviewField] as ReviewModel;
      newHeight = newHeight + (MediaQuerySingleton().generateTextHeight(review.content, 16.5, widget.width, widget.height * 0.5) + widget.height * 0.5) + widget.height * 0.1;
    }
    return newHeight;
  }

  double borderHeight() {
    var newHeight = 0.0;
    for (int i = 0; i < widget.reply.length - 1; i++) {
      var review = widget.reply[i][reviewField] as ReviewModel;
      newHeight = newHeight + (MediaQuerySingleton().generateTextHeight(review.content, 16.5, widget.width * 0.95, widget.height * 0.5) +widget.height * 0.5) + widget.height * 0.1;
    }
    return newHeight;
  }
}
