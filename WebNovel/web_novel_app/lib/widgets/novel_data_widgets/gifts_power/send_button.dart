import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class SendButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final Function(bool) onTap;

  const SendButton({super.key, required this.height, required this.width, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => onTap(true),
      child: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.only(top: 2, bottom: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: white,
          gradient:  const LinearGradient(colors: [lightPurple, lightBlue], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: white),textAlign: TextAlign.center,)),
      ),
    );
  }
}
