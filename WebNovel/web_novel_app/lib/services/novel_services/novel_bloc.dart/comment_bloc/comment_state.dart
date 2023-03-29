import 'package:flutter/foundation.dart';
import 'package:web_novel_app/services/novel_services/models/comment_model.dart';

@immutable
abstract class CommentState {
  const CommentState();
}

class CommentStateInit implements CommentState {}

class CommentStateLoadingComment implements CommentState{

}

class CommentStateGetComment implements CommentState {
  final List<CommentModel> comments;
  final Exception? exception;
  CommentStateGetComment({required this.comments, required this.exception});
}