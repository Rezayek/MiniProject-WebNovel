import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/label/label.dart';
import 'package:web_novel_app/widgets/novel_widgets/tag_container.dart';

class NovelTagsContainer extends StatelessWidget {
  final double width;
  final List<String> tags;
  const NovelTagsContainer(
      {super.key,
      required this.width,
      required this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tags.length * 2.5.h + 8.h,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title: "Tags", gradiantColors: [lightBlue.withOpacity(0.5), white.withOpacity(0)], margin: [1.h, 1.h, 2.w], expanded: 5.w),
          Wrap(
            children: novelTags()
            ,
          ),
        ],
      ),
    );
  }

  List<Widget> novelTags() =>
      List.generate(tags.length, (index) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: TagContainer(tag: tags[index]),
      ));
}
