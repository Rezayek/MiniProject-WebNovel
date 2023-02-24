import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_novel_app/constants/colors.dart';

class NovelData extends StatelessWidget {
  final double height;
  final double width;
  final String novelName;
  final String novelAuthor;
  final String novelTranslator;
  final String novelRank;
  const NovelData({super.key, required this.height, required this.width, required this.novelName, required this.novelAuthor, required this.novelTranslator, required this.novelRank});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(novelName, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          Text("Author: $novelAuthor", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
          Text("Translator: $novelAuthor", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
          SizedBox(
            height: height * 0.2,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.crown, size: width * 0.05, color: black,),
                Text("  Rank $novelRank", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)

              ],
            ),
          )
        ],
      ),
    );
  }
}
