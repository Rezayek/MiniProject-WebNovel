import 'package:flutter/foundation.dart';

@immutable
class CommentModel {
  final int commentModelId;
  final String userName;
  final String userImgUrl;
  final String userComment;

  const CommentModel(
      {required this.commentModelId,
      required this.userName,
      required this.userImgUrl,
      required this.userComment});

  factory CommentModel.fromSnapshot(Map<String, dynamic> snapshot) =>
      CommentModel(
          commentModelId: snapshot["commentModelId"],
          userName: snapshot["userName"],
          userComment: snapshot["userComment"],
          userImgUrl: snapshot["userImgUrl"]);
}
