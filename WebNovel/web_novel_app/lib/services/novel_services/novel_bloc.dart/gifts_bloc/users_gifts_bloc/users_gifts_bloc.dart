import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/users_gifts_bloc/users_gifts_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/users_gifts_bloc/users_gifts_state.dart';

import '../../../novel_provider.dart';
import 'dart:developer' as debug;
class UsersGiftsBloc extends Bloc<UsersGiftsEvent, UsersGiftsState> {
  UsersGiftsBloc(NovelProvider provider) : super(UsersGiftsStateInit()) {
    on<UsersGiftsEventGetGifts>(
      (event, emit) async {
        emit(UsersGiftsStateAnimation());
        try {
          debug.log("gifts called");
          final gifts = await provider.getNovelGifts(event.novelId);
          if (gifts.isNotEmpty) {
            emit(UsersGiftsStateGetGifts(gifts: gifts, exception: null));
          }else{
            emit(UsersGiftsStateGetGifts(gifts: [], exception: null));
          }
        } on Exception catch(e) {
          emit(UsersGiftsStateGetGifts(gifts: [], exception: e));
        }
      },
    );
  }
}
