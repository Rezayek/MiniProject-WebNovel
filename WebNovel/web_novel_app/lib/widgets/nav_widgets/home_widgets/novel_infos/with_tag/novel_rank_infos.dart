import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/widgets/novel_widgets/novel_image.dart';
import 'package:web_novel_app/widgets/novel_widgets/rating_text.dart';
import 'package:web_novel_app/widgets/novel_widgets/tags_builder.dart';

import '../../../../novel_data_widgets/novel_infos_container/novel_containers/novel_dialog.dart';

class NovelRankInfos extends StatelessWidget {
  final NovelModel novel;
  const NovelRankInfos({Key? key, required this.novel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        await novelDialog(
            context: context,
            novel: novel,
            optionBuilder: () => {"confirm": true});
      },
      child: Container(
        height: 15.h,
        width: 90.w,
        margin: EdgeInsets.only(
            left: 2.w,
            right: 5.w,
            bottom: 5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 19.h,
              width: 35.w,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      child: NovelImage(
                          url: novel.url,
                          height: 18.h,
                          width: 25.w,
                          opacity: 0.3)),
                  Positioned(
                      top: 1.h,
                      left: 25.w,
                      child: Container(
                        height: 4.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                            color: black.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(65)),
                        child: Center(
                          child: Text(
                            novel.currentRank.toString(),
                            style: const TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 1.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    novel.name,
                    style: const TextStyle(
                        color: black, fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 2.h,
                        bottom: 2.h),
                    child: TagsBuilder(
                        tags: novel.tags,
                        width: 50.w,
                        height: 5.h),
                  ),
                  RatingText(rating: novel.rating, color: black),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
