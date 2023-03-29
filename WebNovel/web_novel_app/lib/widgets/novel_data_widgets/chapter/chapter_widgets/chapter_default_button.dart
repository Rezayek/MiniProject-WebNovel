import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterDefaultButton extends StatelessWidget {
  final bool iconisRight;
  final bool textisLeft;
  final IconData icon;
  final String text;
  final double width;
  const ChapterDefaultButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.width,
      required this.iconisRight,
      required this.textisLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [lightBlue, lightPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          boxShadow: const [BoxShadow(blurRadius: 2, color: black)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textisLeft ? textWiget(text) : iconWiget(icon),
          iconisRight ? iconWiget(icon) : textWiget(text),
        ],
      ),
    );
  }

  Widget textWiget(String text) => Text(
        text,
        style:
            const TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w500),
      );
  Widget iconWiget(IconData icon) => Icon(
        icon,
        size: 22,
        color: black,
      );
}
