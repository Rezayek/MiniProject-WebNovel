
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/novel_widgets/novel_image.dart';
import 'package:web_novel_app/widgets/novel_widgets/rating_text.dart';


import '../../../../../services/novel_services/models/novel_model.dart';
import '../../../../novel_data_widgets/novel_infos_container/novel_containers/novel_dialog.dart';

class NovelSimpleInfos extends StatelessWidget {
  final NovelModel novel;
  const NovelSimpleInfos({Key? key, required this.novel, }) : super(key: key);

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
        height: 20.h,
        width: 26.w,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NovelImage(url: novel.url, height: 16.h, width: 24.w, opacity: 0.3,),
            Text(novel.name, style: const TextStyle(color: white, fontSize: 17, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis ,),
            RatingText(rating: novel.rating, color: white,)
          ],
        ),
      ),
    );
  }
}
