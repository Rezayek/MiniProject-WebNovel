import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_novel_app/constants/colors.dart';

class NovelRankContainer extends StatelessWidget {
  final double height;
  final double width;
  final String rank;
  const NovelRankContainer({super.key, required this.height, required this.width, required this.rank});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(FontAwesomeIcons.rankingStar, color: lightPurple, size: width * 0.35,),
          Text(int.parse(rank) > 200? "+200": rank, style: const TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
