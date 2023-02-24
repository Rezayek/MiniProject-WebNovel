import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/user_gift_model.dart';

@immutable
abstract class UserGiftState {
  const UserGiftState();
}

class UserGiftStateInit implements UserGiftState {}

class UserGiftStateGetGifts implements UserGiftState {
  final List<UserGiftModel> gifts;
  final Exception? exception;
  UserGiftStateGetGifts({required this.gifts, required this.exception});
}