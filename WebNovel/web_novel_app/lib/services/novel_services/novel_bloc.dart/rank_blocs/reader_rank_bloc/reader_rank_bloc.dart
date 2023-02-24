import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/rank_blocs/reader_rank_bloc/reader_rank_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/rank_blocs/reader_rank_bloc/reader_rank_state.dart';

import '../../../novel_provider.dart';

class ReaderRankBloc extends Bloc<ReaderRankEvent, ReaderRankState> {
  ReaderRankBloc(NovelProvider provider) : super(ReaderRankStateInit()) {
    on<NovelEventGetReadersNovels>((event, emit) async {
      try {
        final novel = await provider.getReadersNovels();
        emit(NovelStateGetReadersNovels(novels: novel, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetReadersNovels(novels: [], exception: e));
      }
    });
  }
}
