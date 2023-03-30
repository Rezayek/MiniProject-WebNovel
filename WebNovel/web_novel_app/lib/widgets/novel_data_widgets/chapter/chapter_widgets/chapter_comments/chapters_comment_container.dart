
import 'package:flutter/material.dart';

import 'package:web_novel_app/services/novel_services/models/comment_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapter_comment_text.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapter_comment_upper.dart';

class ChapterCommentsContainer extends StatefulWidget {
  final List<CommentModel> comments;
  const ChapterCommentsContainer({super.key, required this.comments});

  @override
  State<ChapterCommentsContainer> createState() =>
      _ChapterCommentsContainerState();
}

class _ChapterCommentsContainerState extends State<ChapterCommentsContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.comments.length * 2,
      itemBuilder: (context, index) => generateComments(index),
    );
  }

  Widget generateComments(int index) {
    if (index % 2 == 0) {
      return  ChapterCommentUpper(userImgUrl: widget.comments[(index / 2).round()].userImgUrl, userName: widget.comments[(index / 2).round()].userName);
    } else {
      return ChapterCommentText(
          text: widget.comments[(index / 2).round()].userComment);
    }
  }
}
