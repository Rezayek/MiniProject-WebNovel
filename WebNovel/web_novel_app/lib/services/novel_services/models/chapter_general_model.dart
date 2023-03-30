import 'package:flutter/material.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_content_model.dart';

@immutable
class ChapterGeneralModel {
  final int chapterId;
  final int preChapterId;
  final int nextChapterId;
  final bool isNextLocked;
  final String chapterTitle;
  final String chapterAudio;
  final String novelImg;
  final List<ChapterContentModel> content;
  const ChapterGeneralModel(
      {required this.chapterId,
      required this.preChapterId,
      required this.nextChapterId,
      required this.isNextLocked,
      required this.chapterTitle,
      required this.chapterAudio,
      required this.novelImg,
      required this.content});

  factory ChapterGeneralModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      ChapterGeneralModel(
        chapterId: snapshot["chapterId"],
        chapterTitle: snapshot["chapterTitle"],
        preChapterId: snapshot["preChapterId"],
        nextChapterId: snapshot["nextChapterId"],
        isNextLocked: snapshot[" isNextLocked"],
        chapterAudio: snapshot["chapterAudio,"],
        novelImg: snapshot["novelImg"],
        content: [
          snapshot["content"]
              .foreach((item) => ChapterContentModel.fromSnapshot(item))
        ],
      );
}
