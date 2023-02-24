import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterInfos extends StatelessWidget {
  final double height;
  final double width;
  final int index;
  final String chapterTitle;
  final String releaseDate;

  const ChapterInfos({super.key, required this.height, required this.width, required this.index, required this.chapterTitle, required this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: height * 0.02),
      height: height,
      width: width - height * 0.02,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.65,
            width: width,
            child: Text("Chapter ${index + 1}: $chapterTitle", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: black), overflow: TextOverflow.ellipsis,maxLines: 2),
          ),
          SizedBox(
            height: height * 0.28,
            width: width,
            child: Text("Released: $releaseDate", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: black), overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}
