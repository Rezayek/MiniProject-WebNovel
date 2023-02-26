import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/reviews_bloc/reviews_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/reviews_bloc/reviews_state.dart';

import 'package:web_novel_app/services/novel_services/novels_exceptions.dart';
import 'package:web_novel_app/services/novel_services/reviews_provider/reviews_provider.dart';

import '../../../../constants/review_const.dart';



class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc(ReviewsProvider provider) : super(ReviewStateInit()) {
    on<ReviewsEventGetReviews>(
      (event, emit) async {
        try {
          await emit.forEach(
            provider.reviewsStream(event.novelId),
            onData: (List<Map<String, dynamic>> reviews) => ReviewsStateGetReviews(
              reviews: reviews, exception: null),
          );
        } on Exception {
          emit(ReviewsStateGetReviews(reviews: [], exception: NovelExceptionCantGetReviews()));
        }
      },
    );

    

   
  }

  
}
