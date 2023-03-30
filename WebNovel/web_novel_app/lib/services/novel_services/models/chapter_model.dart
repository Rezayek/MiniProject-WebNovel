import 'package:flutter/material.dart';

import '../../../constants/chapter.dart';
@immutable
class ChapterModel {
  final int chapterId;
  final String chapterTitle;
  final String chapterRelease;
  final bool isLocked;

  const ChapterModel(
      {required this.chapterId,
      required this.chapterTitle,
      required this.chapterRelease,
      required this.isLocked});

  factory ChapterModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      ChapterModel(
          chapterId: snapshot[chapterIdConst],
          chapterTitle: snapshot[chapterTitleConst],
          chapterRelease: snapshot[chapterReleaseConst],
          isLocked: snapshot[isLockedConst]);
}
