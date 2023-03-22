import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/reviews_bloc/reviews_event.dart';
import '../../../../../widgets/comments_widgets/reviews/reviews_widgets/reviews_generator/reviews_container.dart';
import '../../../novel_bloc.dart/reviews_bloc/reviews_bloc.dart';
import '../../../novel_bloc.dart/reviews_bloc/reviews_state.dart';
import '../../../novels_exceptions.dart';

class ReviewsController extends StatefulWidget {
  final String novelId;
  const ReviewsController({super.key, required this.novelId});

  @override
  State<ReviewsController> createState() => _ReviewsControllerState();
}

class _ReviewsControllerState extends State<ReviewsController> {
  @override
  void initState() {
    context
        .read<ReviewsBloc>()
        .add(ReviewsEventGetReviews(novelId: widget.novelId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewsBloc, ReviewsState>(
      builder: (context, state) {
        if (state is ReviewsStateGetReviews) {

          if (state.exception is NovelExceptionCantGetReviews) {
            return Container();
          }
          if (state.reviews.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ReviewsContainer(
            height: 65.h,
            width: 100.w,
            isReply: false,
            reviews: state.reviews,
            novelId: widget.novelId,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
