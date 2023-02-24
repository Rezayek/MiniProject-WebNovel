import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ReviewInput extends StatefulWidget {
  final double height;
  final double width;
  final TextEditingController textController;
  const ReviewInput({super.key, required this.height, required this.width, required this.textController});

  @override
  State<ReviewInput> createState() => _ReviewInputState();
}

class _ReviewInputState extends State<ReviewInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(blurRadius: 1, offset: const Offset(1, 1), color: black.withOpacity(0.5))]
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextField(
          maxLines: null, 
          minLines: null, 
          autocorrect: true,
          controller: widget.textController,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Write here...",

          )
        ),
      ),
    );
  }
}
