import 'package:flutter/foundation.dart';

import '../../../constants/novel_gifts.dart';
@immutable
class GiftsModel {
  final String userName;
  final String userUrl;
  final String giftImg;
  final String giftName;

  const GiftsModel(
      {required this.userName,
      required this.userUrl,
      required this.giftImg,
      required this.giftName});


  factory GiftsModel.fromSnapshot(Map<String, dynamic> snapshot) => GiftsModel(
      userName: snapshot[userNameGift],
      userUrl: snapshot[userImgGift],
      giftImg: snapshot[giftImgGift],
      giftName: snapshot[giftNameGift]);
}
