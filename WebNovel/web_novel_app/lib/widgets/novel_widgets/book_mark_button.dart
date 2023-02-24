import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class BookMarkButton extends StatelessWidget {
  final String id;
  const BookMarkButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.w,
      width: 15.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(colors: [lightBlue, lightPurple], begin: Alignment.topLeft, end: Alignment.topRight)
      ),
      child: Center(child: Icon(Icons.bookmark_add, color: white, size: 12.w,)),
    );
  }
}