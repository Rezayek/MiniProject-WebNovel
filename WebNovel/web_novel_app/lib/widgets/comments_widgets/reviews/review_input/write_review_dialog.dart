import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/review_container.dart';

import '../../../../constants/colors.dart';


Future<T?> writeReviewDialog<T>({
  required BuildContext context,
  required String title,
  required bool isReview

}) {
  
  
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: white,
        title: Container(
          height: 5.h,
          decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [lightBlue, lightPurple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: black, fontSize: 20, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: SingleChildScrollView(child: ReviewContainer(height: 40.h, width: 80.w, isReview: isReview,)),
      );
    },
  );
}