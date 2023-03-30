import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class ChapterCommentText extends StatelessWidget {
  final String text;
  const ChapterCommentText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:8.0, bottom: 15, left: 5, right: 5),
      padding: const EdgeInsets.all(5),
      decoration:BoxDecoration(
      color: white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [BoxShadow(color: black, blurRadius: 1)],
    ),
      child: Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,),
            ),
    );
  }
}
