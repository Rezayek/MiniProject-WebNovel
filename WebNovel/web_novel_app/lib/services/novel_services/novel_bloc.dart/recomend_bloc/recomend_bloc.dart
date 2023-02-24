import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/recomend_bloc/recomend_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/recomend_bloc/recomend_state.dart';

import '../../novel_provider.dart';

class RecomendBloc extends Bloc<RecomendEvent, RecomendState> {
  RecomendBloc(NovelProvider provider) : super(RecomendStateInit()) {

    on<NovelEventGetRecomendedNovels>((event, emit) async {
      try {
        final novel = await provider.getRecomendedNovels();
        emit(NovelStateGetRecomendedNovels(novels: novel, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetRecomendedNovels(novels: {}, exception: e));
      }
    });


  }

  
}
