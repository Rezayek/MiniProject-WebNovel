import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

@immutable
abstract class WeeklyState {
  const WeeklyState();
}

class WeeklyStateInit implements WeeklyState {}

class NovelStateGetWeeklyNovels implements WeeklyState {
  final List<NovelModel> novels;
  final Exception? exception;
  NovelStateGetWeeklyNovels({required this.novels, required this.exception});
}