import 'package:bloc/bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_provider.dart';
import 'package:web_novel_app/utilities/singletons/chapters_singleton.dart';


import 'novel_chapters_event.dart';
import 'novel_chapters_state.dart';

class NovelChaptersBloc extends Bloc<NovelChaptersEvent, NovelChaptersState> {
  final ChaptersSingleton _chaptersSingleton = ChaptersSingleton();
  NovelChaptersBloc(NovelProvider provider) : super(NovelChaptersStateInit()) {
    on<NovelChapterEventGetNovelChapters>(
      (event, emit) async {
        try {
          emit(NovelChaptersStateLoading());
          final chapters = await provider.getChapters(event.novelId);
          _chaptersSingleton.setChapters(chapters);
          final chaptersList = _chaptersSingleton.getListOfChapters(0);
          emit(NovelChaptersStateGetChapters(
              chapters: chaptersList, index: -1, exception: null, isUnlocking: false));
        } on Exception catch (e) {
          emit(NovelChaptersStateGetChapters(
              chapters: [], index: -1, exception: e, isUnlocking: false));
        }
      },
    );

    on<NovelChapterEventLockChapter>(
      (event, emit) async {
        try {
          emit(NovelChaptersStateGetChapters(
              chapters: _chaptersSingleton.getListOfChapters(ChaptersSingleton.currentIndex),
              index: event.index,
              exception: null, isUnlocking: true));
          await provider.unLockChapter(event.novelId, event.chapterId, event.index);
          
          emit(NovelChaptersStateGetChapters(
              chapters: _chaptersSingleton.getListOfChapters(ChaptersSingleton.currentIndex),
              index: event.index,
              exception: null, isUnlocking: false));
        } on Exception catch (e) {
          emit(NovelChaptersStateGetChapters(
              chapters: _chaptersSingleton
                  .getListOfChapters(ChaptersSingleton.currentIndex),
              index: event.index,
              exception: e, isUnlocking: false));
        }
      },
    );

    on<NovelChapterEventNextList>(
      (event, emit) {
        try {
          final chaptersList =
              _chaptersSingleton.getListOfChapters(event.index);
          emit(NovelChaptersStateGetChapters(
              chapters: chaptersList, index: -1, exception: null, isUnlocking: false));
        } on Exception catch (e) {
          emit(NovelChaptersStateGetChapters(
              chapters: [], index: -1, exception: e, isUnlocking: false));
        }
      },
    );
  }
}
