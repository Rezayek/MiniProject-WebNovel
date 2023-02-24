import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TextIndex extends StatefulWidget {
  final double height;
  final double width;
  final List<double> margins;
  final int currentIndex;
  const TextIndex(
      {super.key,
      required this.height,
      required this.width,
      required this.margins,
      required this.currentIndex});

  @override
  State<TextIndex> createState() => _TextIndexState();
}

class _TextIndexState extends State<TextIndex> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.only(
          top: widget.margins[0],
          left: widget.margins[1],
          bottom: widget.margins[2],
          right: widget.margins[3]),
      decoration: BoxDecoration(
        color: white, 
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
        BoxShadow(blurRadius: 2.5, color: black, offset: Offset(1, 1))
      ]),
      child: Center(
        child: Text(widget.currentIndex.toString(), style: const TextStyle(color: black, fontSize: 30, fontWeight: FontWeight.w500), overflow:TextOverflow.ellipsis,),
      ),
    );
  }
}
