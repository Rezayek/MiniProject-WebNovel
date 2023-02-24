import 'package:flutter/foundation.dart';

import '../../../constants/novel_power.dart';
@immutable
class PowerModel {
  final String userId;
  final String userName;
  final String userImgUrl;
  final int givenPower;

  const PowerModel(
      {required this.userId,
      required this.userName,
      required this.userImgUrl,
      required this.givenPower});

  factory PowerModel.fromSnapshot(Map<String, dynamic> snapshot) => PowerModel(
      userId: snapshot[userIdPower],
      userName: snapshot[userNamePower],
      userImgUrl: snapshot[userImgPower],
      givenPower: snapshot[userGivenPower]);
}
