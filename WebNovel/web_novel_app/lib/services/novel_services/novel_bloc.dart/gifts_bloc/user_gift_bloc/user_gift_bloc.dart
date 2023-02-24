import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_state.dart';

import '../../../novel_provider.dart';


class UserGiftBloc extends Bloc<UserGiftEvent, UserGiftState> {
  UserGiftBloc(NovelProvider provider) : super(UserGiftStateInit()) {
    on<UserGiftEventGetGifts>(
      (event, emit) async {
        try {
          
          final gifts = await provider.getUserGifts();
          if (gifts.isNotEmpty) {
            emit(UserGiftStateGetGifts(gifts: gifts, exception: null));
          } else {
            emit(UserGiftStateGetGifts(gifts: [], exception: null));
          }
        } on Exception catch (e) {
          emit(UserGiftStateGetGifts(gifts: [], exception: e));
        }
      },
    );

    on<UserGiftEventSendGift>(
      (event, emit) async {
        try {
          final gifts = await provider.sendUserGifts(event.novelId);

          if (gifts.isNotEmpty) {
            emit(UserGiftStateGetGifts(gifts: gifts, exception: null));
          } else {
            emit(UserGiftStateGetGifts(gifts: [], exception: null));
          }
        } on Exception catch (e) {
          emit(UserGiftStateGetGifts(gifts: [], exception: e));
        }
      },
    );
  }
}
