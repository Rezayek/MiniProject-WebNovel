import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';


class ListNavButton extends StatelessWidget {
  final bool isForward;
  final double height;
  final double width;
  final List<double> margins;
  final double iconSize;
  final Function(bool) event;
  const ListNavButton(
      {super.key,
      required this.isForward,
      required this.event,
      required this.height,
      required this.width,
      required this.margins,
      required this.iconSize,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        event(true);
      },
      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.only(
            top: margins[0],
            left: margins[1],
            bottom: margins[2],
            right: margins[3]),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(blurRadius: 2.5, color: black, offset: Offset(1, 1))
            ]),
        child: Center(
          child: Icon(
            isForward
                ? Icons.arrow_forward_ios_outlined
                : Icons.arrow_back_ios_rounded,
            size: iconSize,
            color: black,
          ),
        ),
      ),
    );
  }
}
