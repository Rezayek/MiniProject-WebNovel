import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/novel_controller/chapters_controller.dart/chapters_controller.dart';


import '../../../../constants/colors.dart';
import '../../../nav_widgets/home_widgets/label/label.dart';

class NovelChaptersHolder extends StatefulWidget {
  final String novelId;
  const NovelChaptersHolder({super.key, required this.novelId});

  @override
  State<NovelChaptersHolder> createState() => _NovelChaptersHolderState();
}

class _NovelChaptersHolderState extends State<NovelChaptersHolder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
              title: "Chapters",
              gradiantColors: [
                lightBlue.withOpacity(0.5),
                white.withOpacity(0)
              ],
              margin: [
                1.h,
                1.h,
                2.w
              ],
              expanded: 5.w),
          Center(child: ChaptersController(novelId: widget.novelId,)),
          
        ],
      ),
    );
  }
}
