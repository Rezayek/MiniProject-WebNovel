import 'package:flutter/foundation.dart';

@immutable
abstract class WeeklyEvent {
  const WeeklyEvent();
}
class NovelEventGetWeeklyNovels implements WeeklyEvent {}