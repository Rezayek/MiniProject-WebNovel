import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class FilterResult extends StatefulWidget {
  final String text;
  const FilterResult({super.key, required this.text});

  @override
  State<FilterResult> createState() => _FilterResultState();
}

class _FilterResultState extends State<FilterResult> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.h,
      child: Text("${widget.text} Results",style: const TextStyle(color: black),),
    );
  }
}
