import 'package:flutter/foundation.dart';

@immutable
abstract class ReaderRankEvent {
  const ReaderRankEvent();
}

class NovelEventGetReadersNovels implements ReaderRankEvent {}