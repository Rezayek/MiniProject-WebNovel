import 'package:flutter/foundation.dart';

@immutable
abstract class ChapterEvent {
  const ChapterEvent();
}

class ChapterEventGetChapter implements ChapterEvent {
  final int chapterId;
  const ChapterEventGetChapter({required this.chapterId});
}
