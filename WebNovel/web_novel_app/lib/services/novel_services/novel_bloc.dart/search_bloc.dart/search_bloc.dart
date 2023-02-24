import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/search_bloc.dart/search_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/search_bloc.dart/search_state.dart';

import '../../novel_provider.dart';
import '../../search/history_search.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(NovelProvider provider, HistorySearch searchManager)
      : super(NovelStateSearchInit()) {

  

    on<NovelEventGetSearchHistory>((event, emit) async {
      try {
        final results = await searchManager.readData();
        emit(NovelStateGetSearchHistory(options: results, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetSearchHistory(options: [], exception: e));
      }
    });

    on<NovelEventRemoveSearchHistory>((event, emit) async {
      try {
        await searchManager.removeHistory(event.index);
        final results = await searchManager.readData();
        emit(NovelStateGetSearchHistory(options: results, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetSearchHistory(options: [], exception: e));
      }
    });

    on<NovelEventGetSearchResult>((event, emit) async {
      try {
        emit(NovelStateSearchWaiting());
        await searchManager.writeData(event.option);
        final novels = await provider.getSearchNovels(event.option);
        emit(NovelStateGetSearchResult(novels: novels, exception: null, option: event.option));
      } on Exception catch (e) {
        emit(NovelStateGetSearchResult(novels: [], exception: e, option: event.option));
      }
    });
  }
}
