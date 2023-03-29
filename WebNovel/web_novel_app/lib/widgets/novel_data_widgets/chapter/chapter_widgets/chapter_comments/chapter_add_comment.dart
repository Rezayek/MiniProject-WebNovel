import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterAddComment extends StatefulWidget {
  final Function(bool isTapped, String comment) addComment;
  const ChapterAddComment({super.key, required this.addComment});

  @override
  State<ChapterAddComment> createState() => _ChapterAddCommentState();
}

class _ChapterAddCommentState extends State<ChapterAddComment> {
  late final TextEditingController _controller ;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  } 
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 350,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              enableSuggestions: true,
              controller: _controller,
              autocorrect: true,
              maxLength: 150,
              keyboardType: TextInputType.text,
            ),
          ),
          IconButton(onPressed: () => widget.addComment(true, _controller.text), icon:const Icon(Icons.send, size: 25, color: lightPurple,), )
        ],
      ),
    );
  }
}
