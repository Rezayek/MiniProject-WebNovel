import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_default_button.dart';

class ButtonsBar extends StatelessWidget {
  final Function(bool istapped) nextFunc;
  final Function(bool istapped) backFunc;
  final Function(bool istapped) commentFunc;
  const ButtonsBar(
      {super.key,
      required this.nextFunc,
      required this.backFunc,
      required this.commentFunc});

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,

      children: [
        GestureDetector(
            onTap: () => backFunc(true),
            child: ChapterDefaultButton(
                icon: Icons.arrow_back_ios_outlined,
                text: "Back",
                width: 22.w,
                iconisRight: false,
                textisLeft: false)),
        GestureDetector(
            onTap: () => commentFunc(true),
            child: ChapterDefaultButton(
                icon: Icons.comment,
                text: "Comments",
                width: 40.w,
                iconisRight: true,
                textisLeft: true)),
        GestureDetector(
            onTap: () => nextFunc(true),
            child: ChapterDefaultButton(
                icon: Icons.arrow_forward_ios_outlined,
                text: "Next",
                width: 22.w,
                iconisRight: true,
                textisLeft: true)),
      ],
    );
  }
}
