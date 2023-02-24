import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';

import 'novel_column_data.dart';
import 'novel_info_container.dart';
import 'row_data.dart';

class NovelColumnRight extends StatelessWidget {
  final double height;
  final double width;
  final String views;
  final String status;
  const NovelColumnRight({super.key, required this.height, required this.width, required this.views, required this.status});

  @override
  Widget build(BuildContext context) {
    return NovelColumnData(height: height, width: width, widgets: [
      NovelInfoContainer(height: height * 0.26, width: width * 0.95, widgets: [
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            icon: Icons.bookmark_add,
            needsIcon: true,
            text: "BookMark", 
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
            icon: Icons.remove_red_eye_outlined,
            needsIcon: true,
            text: views, 
            textColor: black,),
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            needsIcon: false,
            text: "Views", 
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
            needsIcon: false,
            text: status, 
            textColor: status == "Ongoing"? green: status == "Completed"?green: red ,),
        RowData(
            width: width * 0.95,
            height: height * 0.13,
            fontSize: 18,
            leftMargin: 0,
            needsIcon: false,
            text: "Status", 
            textColor: black,),
      ], backgroundColor: const [
        white,
        white
      ]),
    ]);
  }
}
