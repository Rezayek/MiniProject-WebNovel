import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class RecomendState {
  const RecomendState();
}

class RecomendStateInit implements RecomendState {}


class NovelStateGetRecomendedNovels implements RecomendState {
  final Map<String,List<NovelModel>> novels;
  final Exception? exception;
  NovelStateGetRecomendedNovels({required this.novels, required this.exception});
}