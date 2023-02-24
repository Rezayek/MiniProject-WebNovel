import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

import 'novel_column_data.dart';
import 'novel_info_container.dart';
import 'row_data.dart';


class NovelColumnLeft extends StatelessWidget {
  final double height;
  final double width;
  final String chapterNumbers;
  final String rating;
  const NovelColumnLeft({super.key, required this.height, required this.width, required this.chapterNumbers, required this.rating});

  @override
  Widget build(BuildContext context) {
    return NovelColumnData(height: height, width: width, widgets: [
      NovelInfoContainer(height: height * 0.26, width: width * 0.95, widgets: [
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: null,
            needsIcon: false,
            text: "Read", 
            textColor: black,),
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: null,
            needsIcon: false,
            text: "Chapter1", 
            textColor: black,),
      ], backgroundColor: const [
        lightBlue,
        lightPurple
      ], action: (isTapped) {
        
      },),
      NovelInfoContainer(height: height * 0.26, width: width * 0.95, widgets: [
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: Icons.menu_book_rounded,
            needsIcon: true,
            iconColor: black,
            text: chapterNumbers, 
            textColor: black,),
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: null,
            needsIcon: false,
            text: "Chapters", 
            textColor: black,),
      ], backgroundColor: const [
        white,
        white
      ]),
      NovelInfoContainer(height: height * 0.26, width: width * 0.95, widgets: [
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: Icons.star,
            needsIcon: true,
            iconColor: const Color.fromARGB(255, 255, 179, 0),
            text: rating, 
            textColor: black,),
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: null,
            needsIcon: false,
            text: "Rating", 
            textColor: black,),
      ], backgroundColor: const [
        white,
        white
      ]),
    ]);
  }
}
