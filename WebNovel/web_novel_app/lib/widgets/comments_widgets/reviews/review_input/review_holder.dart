import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/reviews_bloc/reviews_event.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/write_review_dialog.dart';


import 'package:web_novel_app/widgets/other_widgets/default_button.dart';

import '../../../../constants/colors.dart';
import '../../../../services/novel_services/novel_bloc.dart/reviews_bloc/reviews_bloc.dart';
import '../../../../services/novel_services/novel_controllers/novel_controller/reviews_controller/reviews_controller.dart';
import '../../../nav_widgets/home_widgets/label/label.dart';


class ReviewHolder extends StatefulWidget {
  final String novelId;
  const ReviewHolder({super.key, required this.novelId});

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
            margin: [1.h, 1.h, 2.w],
            expanded: 5.w,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                final result = await writeReviewDialog(
                    context: context, isReview: true, title: "Write a review");
                if (result == null) return;
                launchContext(result[0], result[1]);
              },
              child: DefaultButton(
                  height: 8.h,
                  width: 70.w,
                  margins: const [0, 0, 0, 0],
                  text: "Write a review",
                  colors: const [lightBlue, lightPurple]),
            ),
          ),
          ReviewsController(novelId: widget.novelId),
        ],
      ),
    );
  }

  void launchContext(String content, String rating) =>
      context.read<ReviewsBloc>().add(ReviewsEventAddReview(
          content: content, novelId: widget.novelId, rating: rating));
}
