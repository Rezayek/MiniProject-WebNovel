import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapter_comment_text.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapter_comment_upper.dart';

class ChapterCommentsContainer extends StatefulWidget {
  const ChapterCommentsContainer({super.key});

  @override
  State<ChapterCommentsContainer> createState() =>
      _ChapterCommentsContainerState();
}

class _ChapterCommentsContainerState extends State<ChapterCommentsContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical, itemCount: 20, itemBuilder: (context, index) => generateComments(index),);
  }

  Widget generateComments(int index) {
    if (index % 2 == 0) {
      return const ChapterCommentUpper(userImgUrl: "", userName: "userName");
    } else {
      return ChapterCommentText(text: lorem(paragraphs: 1, words: Random().nextInt(20) + 5));
    }
  }
}
