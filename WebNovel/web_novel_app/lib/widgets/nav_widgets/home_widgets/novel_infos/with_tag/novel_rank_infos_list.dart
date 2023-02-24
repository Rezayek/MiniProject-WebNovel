import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/novel_infos/with_tag/novel_rank_infos.dart';

import '../../../../../services/novel_services/models/novel_model.dart';

class NovelRankInfosList extends StatefulWidget {
  final List<NovelModel> novels;
  final bool isHoizontal;
  final double height;
  const NovelRankInfosList(
      {Key? key, required this.novels, required this.isHoizontal, required this.height})
      : super(key: key);

  @override
  State<NovelRankInfosList> createState() => _NovelRankInfosListState();
}

class _NovelRankInfosListState extends State<NovelRankInfosList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 1.5.h,
        bottom: 1.5.h,
      ),
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: widget.isHoizontal ? Axis.horizontal : Axis.vertical,
        itemCount: widget.novels.length,
        itemBuilder: (context, index) {
          return NovelRankInfos(novel: widget.novels[index]);
        },
      ),
    );
  }
}
