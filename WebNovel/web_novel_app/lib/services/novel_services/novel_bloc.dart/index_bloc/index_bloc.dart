
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/utilities/singletons/filter_list_singleton.dart';

import '../filter_bloc/filter_bloc.dart';
import '../filter_bloc/filter_event.dart';
import 'novel_event.dart';
import 'novel_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexStateInit()) {
    on<IndexEventGetNovels>(
      (event, emit) {
        var indexMax = FilterListSingleton().maxIndex();
        event.context
            .read<FilterBloc>()
            .add(FilterEventGetFilteredNovels(index: event.index <= indexMax? event.index : indexMax));
        emit(IndexStateGetNovel(currentIndex: event.index + 1 >= indexMax ? indexMax : event.index + 1));
      },
    );
  }
}
