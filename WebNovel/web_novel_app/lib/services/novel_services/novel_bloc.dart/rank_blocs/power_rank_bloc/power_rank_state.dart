import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class PowerRankState {
  const PowerRankState();
}

class PowerRankStateInit implements PowerRankState {}

class NovelStateGetPowerNovels implements PowerRankState {
  final List<NovelModel> novels;
  final Exception? exception;
  NovelStateGetPowerNovels({required this.novels, required this.exception});
}