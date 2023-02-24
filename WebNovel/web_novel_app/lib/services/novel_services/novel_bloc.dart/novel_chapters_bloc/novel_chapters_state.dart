import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';

@immutable
abstract class NovelChaptersState {
  const NovelChaptersState();
}

class NovelChaptersStateInit implements NovelChaptersState {}

class NovelChaptersStateLoading implements NovelChaptersState {}

class NovelChaptersStateGetChapters implements NovelChaptersState {
  final List<ChapterModel> chapters;
  final int index;
  final bool isUnlocking;
  final Exception? exception;

  NovelChaptersStateGetChapters( 
      {required this.chapters, required this.index, required this.isUnlocking, required this.exception});
}
