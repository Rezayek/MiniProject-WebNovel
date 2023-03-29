import 'package:bloc/bloc.dart';

import '../../novel_provider.dart';
import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc(NovelProvider provider) : super(CommentStateInit()) {
    on<CommentEventGetTextComment>(
      (event, emit) async {
        try {
          emit(CommentStateLoadingComment());
          final comments = await provider.getTextComments(event.textId);
          emit(CommentStateGetComment(comments: comments, exception: null));
        } on Exception catch (e) {
          emit(CommentStateGetComment(comments: [], exception: e));
        }
      },
    );

    on<CommentEventGetChapterComment>(
      (event, emit) async {
        try {
          emit(CommentStateLoadingComment());
          final comments = await provider.getTextComments(event.chapterId);
          emit(CommentStateGetComment(comments: comments, exception: null));
        } on Exception catch (e) {
          emit(CommentStateGetComment(comments: [], exception: e));
        }
      },
    );

    on<CommentEventAddChapterComment>(
      (event, emit) async {
        try {
          await provider.addChapterComments(event.chapterId, event.comment );
        } on Exception catch (e) {
          emit(CommentStateGetComment(comments: [], exception: e));
        }
      },
    );

    on<CommentEventAddTextComment>(
      (event, emit) async {
        try {
          await provider.addChapterComments(event.textId, event.comment );
        } on Exception catch (e) {
          emit(CommentStateGetComment(comments: [], exception: e));
        }
      },
    );
  }
}
