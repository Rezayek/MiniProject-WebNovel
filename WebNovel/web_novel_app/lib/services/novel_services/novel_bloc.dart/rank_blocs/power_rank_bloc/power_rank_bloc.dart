import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/rank_blocs/power_rank_bloc/power_rank_events.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/rank_blocs/power_rank_bloc/power_rank_state.dart';

import '../../../novel_provider.dart';

class PowerRankBloc extends Bloc<PowerRankEvent, PowerRankState> {
  PowerRankBloc(NovelProvider provider) : super(PowerRankStateInit()) {
    on<NovelEventGetPowerNovels>((event, emit) async {
      try {
        final novel = await provider.getPowerNovels();
        emit(NovelStateGetPowerNovels(novels: novel, exception: null));
      } on Exception catch (e) {
        emit(NovelStateGetPowerNovels(novels: [], exception: e));
      }
    });
  }
}
