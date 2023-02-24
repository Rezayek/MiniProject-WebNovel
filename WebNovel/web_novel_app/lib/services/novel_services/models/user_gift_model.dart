import 'package:flutter/foundation.dart';

@immutable
class UserGiftModel {
  final String giftId;
  final String giftName;
  final String giftUrl;

  const UserGiftModel(
      {required this.giftId, required this.giftName, required this.giftUrl});

  factory UserGiftModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      UserGiftModel(giftId: snapshot["giftId"], giftName: snapshot["giftName"], giftUrl: snapshot["giftUrl"]);
}
