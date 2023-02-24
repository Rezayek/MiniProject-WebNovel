

import 'package:bloc/bloc.dart';
import 'package:web_novel_app/utilities/singletons/filter_list_singleton.dart';

import '../../novel_provider.dart';
import 'filter_event.dart';
import 'filter_state.dart';


class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterListSingleton list = FilterListSingleton();
  FilterBloc(NovelProvider provider) : super(FilterStateInit()) {
    on<FilterEventGetNovels>((event, emit) async {
      try {
        emit(FilterWaiting());
        final novels = await provider.getNovels();
        list.setNovels(novels);

        emit(FilterStateGetNovels(novels: list.getList(1), exception: null));
      } on Exception catch (e) {
        emit(FilterStateGetNovels(novels: [], exception: e));
      }
    });

    on<FilterEventGetFilteredNovels>(
      (event, emit) {
        try {
          list.filterNovels();
          final novels = list.getList(event.index);
          emit(FilterStateGetFilteredNovels(
            novels: novels,
            exception: null,
          ));
        } on Exception catch (e) {
          emit(FilterStateGetFilteredNovels(
            novels: [],
            exception: e,
          ));
        }
      },
    );

  }
}
