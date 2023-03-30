import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';

class ChaptersSingleton {
  static int currentIndex = 0;
  List<ChapterModel> chapters = [];

  static final _shared = ChaptersSingleton._sharedInstance();
  ChaptersSingleton._sharedInstance();
  factory ChaptersSingleton() => _shared;

  void setChapters(List<ChapterModel> chapters) {
    this.chapters = chapters;
  }

  void unLockChapter(int index) {
    if (chapters.isEmpty) return;
    chapters[index] = ChapterModel(
        chapterId: chapters[index].chapterId,
        chapterTitle: chapters[index].chapterTitle,
        chapterRelease: chapters[index].chapterRelease,
        isLocked: false);
  }


  bool isChapterLocked(int index) {
    if (chapters.isEmpty) return false;
    return chapters[index].isLocked;
  }

  List<ChapterModel> getListOfChapters(int index) {
    final List<ChapterModel> chaptersList;
    if (chapters.length > 100) {
      chaptersList = chapters.sublist(
          100 * index,
          100 + (100 * index) > chapters.length
              ? chapters.length
              : 100 + (100 * index));
      if (chaptersList.isNotEmpty) currentIndex = index;
    } else {
      chaptersList = chapters;
    }
    return chaptersList;
  }
}
