import 'package:flutter/material.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_stack/backgound_color.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_stack/background_img.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_stack/novel_data.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_stack/novel_img.dart';

class NovelStack extends StatelessWidget {
  final double height;
  final double width;
  final String novelName;
  final String novelAuthor;
  final String novelTranslator;
  final String novelRank;
  final String url;
  const NovelStack({super.key, required this.height, required this.width, required this.novelName, required this.novelAuthor, required this.novelTranslator, required this.novelRank, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          BackGroundImg(height: height, width: width, url: url),
          BackGroundColor(height: height, width: width),
          NovelImg(height: height * 0.58, width: width * 0.4, url: url),
          Positioned(
            top: height * 0.6,
            left: width * 0.02,
            child: NovelData(height: height * 0.4, width: width, novelName: novelName, novelAuthor: novelAuthor, novelTranslator: novelTranslator, novelRank: novelRank))
        ],
      ),
    );
  }
}