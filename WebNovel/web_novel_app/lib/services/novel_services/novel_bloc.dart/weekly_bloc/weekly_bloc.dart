import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/weekly_bloc/weekly_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/weekly_bloc/weelky_state.dart';

import '../../novel_provider.dart';

class WeeklyBloc extends Bloc<WeeklyEvent, WeeklyState> {
  WeeklyBloc(NovelProvider provider) : super(WeeklyStateInit()) {
    on<NovelEventGetWeeklyNovels>((event, emit) async {
      try {
        final novel = await provider.getWeeklyNovels();
        emit(NovelStateGetWeeklyNovels(novels: novel, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetWeeklyNovels(novels: [], exception: e));
      }
    });
  }
}
