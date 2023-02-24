


import 'package:bloc/bloc.dart';

import '../../novel_provider.dart';
import 'new_event.dart';
import 'new_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc(NovelProvider provider) : super(NewStateInit()) {

    on<NovelEventGetNewNovels>((event, emit) async {
      try {
        final novel = await provider.getNewNovels();
        emit(NovelStateGetNewNovels(novels: novel, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetNewNovels(novels: [], exception: e));
      }
    });
    
  }}


