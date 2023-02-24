import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/novel_infos/without_tag/novel_simple_infos_list.dart';

import '../../../../constants/colors.dart';
import '../../../../services/novel_services/models/novel_model.dart';
import '../label/label.dart';

class TagRecomendation extends StatelessWidget {
  final String tag;
  final List<NovelModel> novels;
  const TagRecomendation({Key? key, required this.tag, required this.novels}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left:5.w),
            child: Label(title: tag, gradiantColors: [lightPurple, lightBlue.withOpacity(0.5), lightBlue.withOpacity(0.1)], margin: [0.5.h, 0, 3.w], expanded: 0,),
          ),
          NovelSimpleInfosList(novels: novels)
        ],
      ),
    );
  }
}
