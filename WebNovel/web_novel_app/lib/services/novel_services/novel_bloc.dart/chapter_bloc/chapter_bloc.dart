import 'package:bloc/bloc.dart';

import '../../novel_provider.dart';
import 'chapter_event.dart';
import 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  ChapterBloc(NovelProvider provider) : super(ChapterStateInit()) {
    on<ChapterEventGetChapter>(
      (event, emit) async {
        try {
          emit(ChapterStateLoadingChapter());
          final content = await provider.getChapterContent(event.chapterId);
          emit(ChapterStateGetChapter(chapterData: content, exception: null));
        } on Exception catch (e) {
          emit(ChapterStateGetChapter(chapterData: null, exception: e));
        }
      },
    );
  }
}
