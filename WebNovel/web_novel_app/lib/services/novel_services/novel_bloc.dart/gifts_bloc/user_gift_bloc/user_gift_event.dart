import 'package:flutter/foundation.dart';

@immutable
abstract class UserGiftEvent {
  const UserGiftEvent();
}

class UserGiftEventSendGift implements UserGiftEvent {
  final String novelId;
  UserGiftEventSendGift({required this.novelId});
}

class UserGiftEventGetGifts implements UserGiftEvent {
  final String novelId;
  UserGiftEventGetGifts({required this.novelId});
}
