import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/power_bloc/power_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/power_bloc/power_state.dart';

import '../../novel_provider.dart';
import 'dart:developer' as debug;

class PowerBloc extends Bloc<PowerEvent, PowerState> {
  PowerBloc(NovelProvider provider) : super(PowerStateInit()) {
    on<PowerEventGetPower>(
      (event, emit) async {
        try {
          debug.log("Power called");
          emit(PowerStateLoading());
          final power = await provider.getPowers(event.novelId);
          if (power.isNotEmpty) {
            emit(PowerStateGetPower(power: power, exception: null));
          }
        } on Exception catch (e) {
          emit(PowerStateGetPower(power: {}, exception: e));
        }
      },
    );

    on<PowerEventSendPower>(
      (event, emit) async {
        try {
          final power = await provider.sendPower(event.novelId);
          if (power.isNotEmpty) {
            emit(PowerStateGetPower(power: power, exception: null));
          }
        } on Exception catch (e) {
          emit(PowerStateGetPower(power: {}, exception: e));
        }
      },
    );
  }
}
