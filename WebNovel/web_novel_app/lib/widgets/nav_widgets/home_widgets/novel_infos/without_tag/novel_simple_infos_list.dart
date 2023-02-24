import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';


import 'novel_simple_infos.dart';

class NovelSimpleInfosList extends StatelessWidget {
  final List<NovelModel> novels;
  const NovelSimpleInfosList({Key? key, required this.novels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h, ),
      height: 30.h,
      width: 100.w ,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return NovelSimpleInfos(novel: novels[index],);
        },
      ),
    );
  }
}
