import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterCommentUpper extends StatelessWidget {
  final String userImgUrl;
  final String userName;
  const ChapterCommentUpper({super.key, required this.userImgUrl, required this.userName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
              image: userImgUrl.isEmpty? const DecorationImage(image: AssetImage("assets/avatar.png")): DecorationImage(image: NetworkImage(userImgUrl)),
              boxShadow:const  [BoxShadow(blurRadius: 2, color: black)],
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          Text(userName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
