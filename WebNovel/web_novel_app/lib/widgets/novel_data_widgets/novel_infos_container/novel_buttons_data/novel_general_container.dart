import 'package:flutter/material.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

import 'novel_column_left.dart';
import 'novel_column_right.dart';


class NovelGeneralContainer extends StatelessWidget {
  final double height;
  final double width;
  final NovelModel novel;
  const NovelGeneralContainer(
      {super.key, required this.height, required this.width, required this.novel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NovelColumnLeft(
              height: height,
              width: width * 0.4,
              chapterNumbers: novel.chapters.toString(),
              rating: novel.rating.toString()
          ),
          NovelColumnRight(height: height, width: width* 0.4, views: novel.readers.toString(), status: novel.state)
        ],
      ),
    );
  }
}
