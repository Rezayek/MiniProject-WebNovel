import 'package:flutter/foundation.dart';

@immutable
abstract class PowerRankEvent {
  const PowerRankEvent();
}



class NovelEventGetNovels implements PowerRankEvent {
  final int index;

  NovelEventGetNovels({required this.index});
}

class NovelEventGetPowerNovels implements PowerRankEvent {}
