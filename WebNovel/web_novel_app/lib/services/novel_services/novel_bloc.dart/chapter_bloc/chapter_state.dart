import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_general_model.dart';

@immutable
abstract class ChapterState {
  const ChapterState();
}

class ChapterStateInit implements ChapterState {}

class ChapterStateLoadingChapter implements ChapterState{

}

class ChapterStateGetChapter implements ChapterState {
  final ChapterGeneralModel? chapterData;
  final Exception? exception;
  ChapterStateGetChapter({required this.chapterData, required this.exception});
}