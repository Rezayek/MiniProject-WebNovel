import 'package:flutter/foundation.dart';

@immutable
abstract class CommentEvent {
  const CommentEvent();
}

class CommentEventGetTextComment implements CommentEvent {
  final int textId;
  const CommentEventGetTextComment({required this.textId});
}

class CommentEventGetChapterComment implements CommentEvent {
  final int chapterId;
  const CommentEventGetChapterComment({required this.chapterId});
}

class CommentEventAddChapterComment implements CommentEvent {
  final int chapterId;
  final String comment;
  const CommentEventAddChapterComment({required this.chapterId, required this.comment, });
}

class CommentEventAddTextComment implements CommentEvent {
  final int textId;
  final String comment;
  const CommentEventAddTextComment({required this.textId, required this.comment, });
}
