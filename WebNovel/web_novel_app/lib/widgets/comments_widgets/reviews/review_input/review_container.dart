import 'package:flutter/material.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/rating_button.dart';
import 'package:web_novel_app/widgets/comments_widgets/reviews/review_input/review_input.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/send_button.dart';

class ReviewContainer extends StatefulWidget {
  final double height;
  final double width;
  final bool isReview;
  const ReviewContainer(
      {super.key,
      required this.height,
      required this.width,
      required this.isReview});

  @override
  State<ReviewContainer> createState() => _ReviewContainerState();
}

class _ReviewContainerState extends State<ReviewContainer> {
  String currentRating = "1";
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ReviewInput(
                  height: widget.height * 0.7,
                  width: widget.width * 0.9,
                  textController: textController)),
          SizedBox(
            height: widget.height * 0.2,
            width: widget.width,
            child: Row(
              mainAxisAlignment: widget.isReview? MainAxisAlignment.spaceEvenly: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isReview
                    ? RatingButton(
                        height: widget.height * 0.15,
                        width: widget.width * 0.35,
                        onChange: (rating) {
                          setState(() {
                            currentRating = rating;
                          });
                        },
                      )
                    : const SizedBox(),
                SendButton(
                    height: widget.height * 0.15,
                    width: widget.width * 0.25,
                    text: "Post",
                    onTap: (isTapped) {
                      if (!isTapped) return;
                      if(widget.isReview) Navigator.of(context).pop([currentRating, textController.text]);
                      if(!widget.isReview) Navigator.of(context).pop([textController.text]);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
