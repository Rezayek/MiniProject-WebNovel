import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

import '../novel_review_container.dart';

class ReviewsContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool isReply;
  const ReviewsContainer(
      {super.key, required this.height, required this.width, required this.isReply});

  @override
  State<ReviewsContainer> createState() => _ReviewsContainerState();
}

class _ReviewsContainerState extends State<ReviewsContainer> {
  @override
  Widget build(BuildContext context) {
    final width = !widget.isReply? widget.width: (widget.width - widget.width *0.2);
    final height = !widget.isReply? widget.height : 50.h;
    return Container(
      padding: EdgeInsets.all(height * 0.01),
      height:  height,
      width: width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: widget.isReply? BorderRadius.circular(15) : BorderRadius.circular(0),
        boxShadow: widget.isReply?[BoxShadow(blurRadius: 1, offset: const Offset(1, 1), color: black.withOpacity(0.6)), BoxShadow(blurRadius: 1, offset: const Offset(-1, -1), color: black.withOpacity(0.6))]:[]
      ),
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => NovelReviewContainer(
                height: 30.h,
                width:  width, hasReplies: index%2 == 0 ? false:true, isReply: widget.isReply,
              )),
    );
  }
}
