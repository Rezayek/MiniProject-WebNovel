import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class ResponsiveText extends StatefulWidget {
  final String? content;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final bool isText;
  final int? commentsTotal;
  final Function(bool isTapped)? openComments;
  const ResponsiveText({
    super.key,
    required this.content,
    required this.fontSize,
    required this.fontWeight,
    required this.textColor,
    required this.isText,
    required this.commentsTotal,
    this.openComments,
  });

  @override
  State<ResponsiveText> createState() => _ResponsiveTextState();
}

class _ResponsiveTextState extends State<ResponsiveText> {
  bool isVisible = false;

  void _toggleVisibilityTrue() {
    if (!widget.isText) return;
    if (isVisible) return;
    setState(() {
      isVisible = true;
    });
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isVisible = false;
      });
    });
  }

  void _toggleVisibilityFalse() {
    if (!widget.isText) return;
    setState(() {
      isVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h, left: 5.w),
      child: Stack(alignment: Alignment.center, children: [
        GestureDetector(
          onTap: () => _toggleVisibilityFalse(),
          onDoubleTap: () => _toggleVisibilityTrue(),
          child: Text(
            widget.content ?? "",
            style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.textColor),
          ),
        ),
        commentButton(),
      ]),
    );
  }

  Widget commentButton() => Visibility(
        visible: isVisible,
        child: GestureDetector(
          onTap: () => widget.openComments!(true),
          child: Container(
            height: 50,
            width: 35.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                    colors: [lightBlue, lightPurple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                boxShadow: const [BoxShadow(blurRadius: 2, color: black)]),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "2",
                  style: TextStyle(
                      color: black, fontSize: 28, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                Icon(
                  Icons.reviews,
                  size: 40,
                  color: black,
                ),
              ],
            ),
          ),
        ),
      );
}
