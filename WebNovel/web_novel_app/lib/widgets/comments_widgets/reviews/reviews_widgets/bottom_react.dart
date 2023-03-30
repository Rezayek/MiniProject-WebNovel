import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/reviews_bloc/reviews_event.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/write_review_dialog.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/react_button.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/enums.dart';

import '../../../../services/novel_services/novel_bloc.dart/reviews_bloc/reviews_bloc.dart';

class BottomReact extends StatefulWidget {
  final double width;
  final ReactState reactState;
  final bool hasReplies;
  final String reviewId;
  final String userName;
  final Function(bool loadReplies) loadReplies;
  const BottomReact(
      {super.key,
      required this.width,
      required this.reactState,
      required this.hasReplies,
      required this.reviewId,
      required this.userName,
      required this.loadReplies});

  @override
  State<BottomReact> createState() => _BottomReact();
}

class _BottomReact extends State<BottomReact> {
  late ReactState react;
  late bool _openReplies;
  @override
  void initState() {
    react = widget.reactState;
    _openReplies = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = widget.width - widget.width * 0.05;
    const double height = 50;
    return Container(
      margin: EdgeInsets.only(right: widget.width * 0.05),
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.hasReplies
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      if (!_openReplies) {
                        _openReplies = true;
                        widget.loadReplies(true);
                      } else {
                        _openReplies = false;
                        widget.loadReplies(false);
                      }
                    });
                  },
                  child: SizedBox(
                    height: height,
                    width: width * 0.2,
                    child: Center(
                      child: Text(
                        !_openReplies ? "Replies" : "Close",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: !_openReplies ? black : lightPurple),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          GestureDetector(
            onTap: () async {
              final result = await writeReviewDialog(
                  context: context,
                  title: "Reply to ${widget.userName}",
                  isReview: false);
              if (result == null) return;
              launchContext(result[0]);
            },
            child: SizedBox(
              height: height,
              width: width * 0.2,
              child: const Center(
                child: Text(
                  "Reply",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600, color: black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  switch (react) {
                    case ReactState.none:
                      react = ReactState.like;
                      break;
                    case ReactState.like:
                      react = ReactState.none;
                      break;
                    case ReactState.dislike:
                      react = ReactState.like;
                      break;
                  }
                });
              },
              child: ReactButton(
                  height: height,
                  width: width * 0.15,
                  size: width * 0.1,
                  isUp: true,
                  isActive: react == ReactState.like ? true : false)),
          GestureDetector(
              onTap: () {
                setState(() {
                  switch (react) {
                    case ReactState.none:
                      react = ReactState.dislike;
                      break;
                    case ReactState.like:
                      react = ReactState.dislike;
                      break;
                    case ReactState.dislike:
                      react = ReactState.none;
                      break;
                  }
                });
              },
              child: ReactButton(
                  height: height,
                  width: width * 0.15,
                  size: width * 0.1,
                  isUp: false,
                  isActive: react == ReactState.dislike ? true : false)),
        ],
      ),
    );
  }

  void launchContext(String content) => context.read<ReviewsBloc>().add(
      ReviewsEventAddReply(content: content, otherReplyId: widget.reviewId));
}
