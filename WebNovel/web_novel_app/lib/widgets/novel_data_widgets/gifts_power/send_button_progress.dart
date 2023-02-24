import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class SendButtonProgress extends StatefulWidget {
  final double height;
  final double width;

  const SendButtonProgress({super.key, required this.height, required this.width});

  @override
  State<SendButtonProgress> createState() => _SendButtonProgressState();
}

class _SendButtonProgressState extends State<SendButtonProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
        gradient:  const LinearGradient(colors: [lightPurple, lightBlue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: const Center(child: CircularProgressIndicator(color: white,),),
    );
  }
}