import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';


@immutable
abstract class UsersGiftsState {
  const UsersGiftsState();
}

class UsersGiftsStateInit implements UsersGiftsState {}

class UsersGiftsStateAnimation implements UsersGiftsState {}

class UsersGiftsStateGetGifts implements UsersGiftsState {
  final List<GiftsModel> gifts;
  final Exception? exception;
  UsersGiftsStateGetGifts ({required this.gifts, required this.exception});
}