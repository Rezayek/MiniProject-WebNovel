import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';


import '../../../../../constants/review_const.dart';
import '../../../../../services/novel_services/models/review_model.dart';


import '../novel_review_container.dart';



class ReviewsContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool isReply;
  final String novelId;
  final List<dynamic> reviews;
  const ReviewsContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.isReply,
      required this.reviews,
      required this.novelId});

  @override
  State<ReviewsContainer> createState() => _ReviewsContainerState();
}

class _ReviewsContainerState extends State<ReviewsContainer> {
  List<dynamic> reviews = [];
  List<dynamic> _generalReviews = [];
  bool notifie = false;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (notifie) {
        _generalReviews = reviews;
      } else {
        _generalReviews = widget.reviews;
      }
    });

    return Container(
      padding: EdgeInsets.all(widget.height * 0.01),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: white,
          borderRadius: widget.isReply
              ? BorderRadius.circular(15)
              : BorderRadius.circular(0),
          boxShadow: widget.isReply
              ? [
                  BoxShadow(
                      blurRadius: 1,
                      offset: const Offset(1, 1),
                      color: black.withOpacity(0.6)),
                  BoxShadow(
                      blurRadius: 1,
                      offset: const Offset(-1, -1),
                      color: black.withOpacity(0.6))
                ]
              : []),
      child: ListView.builder(
          itemCount: _generalReviews.isNotEmpty
              ? _generalReviews.length < 10
                  ? _generalReviews.length
                  : 10
              : 0,
          itemBuilder: (context, index) {
            ReviewModel review =
                _generalReviews[index][reviewField] as ReviewModel;
            return NovelReviewContainer(
              height: 32.h,
              width: widget.width,
              hasReplies: review.repliesNumber == 0 ? false : true,
              isReply: widget.isReply,
              review: review,
              reply: _generalReviews[index][reviewReplyField],
              novelId: widget.novelId, changeHeight: (double newHeight) {},
            );
          }),
    );
  }


}
