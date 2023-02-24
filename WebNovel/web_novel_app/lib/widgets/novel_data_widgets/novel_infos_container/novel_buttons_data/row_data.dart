import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

class RowData extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double fontSize;
  final double leftMargin;
  final IconData? icon;
  final bool needsIcon;
  final Color? iconColor;
  final Color textColor;
  const RowData({
    super.key,
    required this.width,
    required this.height,
    required this.fontSize,
    required this.leftMargin,
    this.icon,
    required this.needsIcon,
    required this.text, this.iconColor, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: needsIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: width * 0.2,
                  color: iconColor,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      color: black),
                )
              ],
            )
          : Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
            ),
    );
  }
}
