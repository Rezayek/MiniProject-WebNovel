import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class ReaderRankState {
  const ReaderRankState();
}

class ReaderRankStateInit implements ReaderRankState {}

class NovelStateGetReadersNovels implements ReaderRankState {
  final List<NovelModel> novels;
  final Exception? exception;
  NovelStateGetReadersNovels({required this.novels, required this.exception});
}