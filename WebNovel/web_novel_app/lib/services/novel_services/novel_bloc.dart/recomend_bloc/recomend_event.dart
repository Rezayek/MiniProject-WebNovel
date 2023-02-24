import 'package:flutter/foundation.dart';

@immutable
abstract class RecomendEvent {
  const RecomendEvent();
}

class NovelEventGetRecomendedNovels implements RecomendEvent {}