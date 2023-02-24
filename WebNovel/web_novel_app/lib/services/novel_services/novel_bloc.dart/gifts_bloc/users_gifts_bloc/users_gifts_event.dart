import 'package:flutter/foundation.dart';

@immutable
abstract class UsersGiftsEvent {
  const UsersGiftsEvent();
}

class UsersGiftsEventGetGifts implements UsersGiftsEvent {
  final String novelId;
  UsersGiftsEventGetGifts({required this.novelId});
}


