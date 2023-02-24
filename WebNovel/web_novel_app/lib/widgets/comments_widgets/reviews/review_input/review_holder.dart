import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/write_review_dialog.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/reviews_widgets/reviews_generator/reviews_container.dart';

import 'package:web_novel_app/widgets/other_widgets/default_button.dart';

import '../../../../constants/colors.dart';
import '../../../nav_widgets/home_widgets/label/label.dart';
import 'dart:developer' as debug;

import '../reviews_widgets/novel_review_container.dart';

class ReviewHolder extends StatefulWidget {
  const ReviewHolder({super.key});

  @override
  State<ReviewHolder> createState() => _ReviewHolderState();
}

class _ReviewHolderState extends State<ReviewHolder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            title: "Reviews",
            gradiantColors: [lightBlue.withOpacity(0.5), white.withOpacity(0)],
            margin: [
              1.h,
              1.h,
              2.w
            ],
            expanded: 5.w,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                final result = await writeReviewDialog(context: context, isReview: true, title: "Write a review");
                if (result == null) return;
                debug.log(result.toString());
              },
              child: DefaultButton(
                  height: 8.h,
                  width: 70.w,
                  margins: const [0, 0, 0, 0],
                  text: "Write a review",
                  colors: const [lightBlue, lightPurple]),
            ),
          ),
          ReviewsContainer(height: 70.h, width: 100.w, isReply: false,),
        ],
      ),
    );
  }
}
