import 'package:flutter/foundation.dart';

@immutable
abstract class NovelChaptersEvent {
  const NovelChaptersEvent();
}

class NovelChapterEventGetNovelChapters implements NovelChaptersEvent {
  final String novelId;

  NovelChapterEventGetNovelChapters({required this.novelId});
}

class NovelChapterEventLockChapter implements NovelChaptersEvent {
  final String novelId;
  final String chapterId;
  final int index;

  NovelChapterEventLockChapter({required this.novelId, required this.chapterId, required this.index, });
}

class NovelChapterEventNextList implements NovelChaptersEvent {
  final int index;

  NovelChapterEventNextList({required this.index});
}
