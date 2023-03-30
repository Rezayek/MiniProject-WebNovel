

import 'package:flutter/material.dart';


import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/constants/enums.dart';
import 'package:web_novel_app/constants/review_const.dart';
import 'package:web_novel_app/services/novel_services/models/review_model.dart';


import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/bottom_react.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/review_info_row.dart';


import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_review_content.dart';

class NovelReviewContainer extends StatefulWidget {

  final double width;
  final bool hasReplies;
  final bool isReply;
  final ReviewModel review;
  final List<dynamic> reply;
  final String novelId;
  const NovelReviewContainer(
      {super.key,
      required this.width,
      required this.hasReplies,
      required this.isReply,
      required this.review,
      required this.reply,
      required this.novelId});

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

  @override
  Widget build(BuildContext context) {
  
    return Container(
      width: widget.width,
      margin: EdgeInsets.all(widget.width * 0.02),
      decoration: const BoxDecoration(
        color: white,
        boxShadow: [BoxShadow(offset: Offset(-0.5, -0.5))],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewInfoRow(
            width: widget.width,
            userName: widget.review.userName,
            userImg: widget.review.userImgUrl,
            released: widget.review.postDate,
            rating: widget.review.rating,
            isReply: widget.isReply,
          ),
          SizedBox(
            width: widget.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: widget.width * 0.90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserReviewContent(content: widget.review.content, width: widget.width * 0.95,),
                      BottomReact(
                        width: widget.width * 0.95,
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
                          ? SizedBox(
                              width: widget.width * 0.85,
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
    final width = widget.width - (widget.width * 0.1);
    List<Widget> replies = [];
    for (var reply in widget.reply) {
      var review = reply[reviewField] as ReviewModel;
      var replyChild = reply[reviewReplyField] as List<dynamic>;
      replies.add(NovelReviewContainer(
        width: width,
        hasReplies: review.repliesNumber == 0 ? false : true,
        isReply: true,
        review: review,
        reply: replyChild,
        novelId: widget.novelId,
      ));
    }
    return replies;
  }



}
