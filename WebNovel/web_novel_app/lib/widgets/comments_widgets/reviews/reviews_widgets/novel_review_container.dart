import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/enums.dart';
import 'package:web_novel_app/utilities/singletons/media_query_singleton.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/review_container.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/bottom_react.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/review_info_row.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/reviews_generator/reviews_container.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/user_review_content.dart';

class NovelReviewContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool hasReplies;
  final bool isReply;
  const NovelReviewContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.hasReplies,
      required this.isReply});

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
    double height =
        MediaQuerySingleton().generateTextHeight(comment(index), 15.5, widget.width) +
            widget.height * 0.5;
    setState(() {
      height = !_loadReplies
          ? height
          : height + 50.h;
    });

    return SizedBox(
      height: height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewInfoRow(
            height: widget.height * 0.24,
            width: widget.width,
            userName: "userName",
            userImg: "",
            released: "8 Months",
            rating: 4,
            isReply: widget.isReply,
          ),
          UserReviewContent(
              height: MediaQuerySingleton().generateTextHeight(comment(index), 15.5, widget.width),
              width: widget.width,
              content: comment(index)),
          BottomReact(
            height: widget.height * 0.2,
            width: widget.width,
            reactState: ReactState.none,
            hasReplies: widget.hasReplies,
            reviewId: "reviewId",
            userName: "userName",
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
                  height: height, width: widget.width, isReply: true)
              : const SizedBox(),
        ],
      ),
    );
  }

  String comment(int index) {
    String com = "";
    for (int i = 0; i <= index; i++) {
      com = "$com ${"content"}";
    }
    return com;
  }
}
