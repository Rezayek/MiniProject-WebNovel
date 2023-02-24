import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/widgets/novel_widgets/book_mark_button.dart';
import 'package:web_novel_app/widgets/novel_widgets/novel_image.dart';
import 'package:web_novel_app/widgets/novel_widgets/rating_text.dart';
import 'package:web_novel_app/widgets/novel_widgets/read_now_button.dart';
import 'package:web_novel_app/widgets/novel_widgets/tags_builder.dart';


import '../../../novel_data_widgets/novel_infos_container/novel_containers/novel_dialog.dart';

class NewNovelContainer extends StatefulWidget {
  final NovelModel novel;
  final double height;
  final double width;
  const NewNovelContainer({Key? key, required this.novel, required this.height, required this.width}) : super(key: key);

  @override
  State<NewNovelContainer> createState() => _NewNovelContainerState();
}

class _NewNovelContainerState extends State<NewNovelContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        await novelDialog(
            context: context,
            novel: widget.novel,
            optionBuilder: () => {"confirm": true});
      },
      child: Container(
        margin: EdgeInsets.only(left: 1.w),
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NovelImage(url: widget.novel.url, height: (widget.height / 2) *1.4, width: widget.width / 3, opacity: 0.3),
            Padding(
              padding: EdgeInsets.only(left: 3.w),
              child: SizedBox(
                height: widget.height,
                width: (widget.width / 3) * 1.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.novel.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: black),),
                    TagsBuilder(tags: widget.novel.tags, width: widget.width, height: widget.height / 6),
                    RatingText(rating: widget.novel.rating, color: black,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ReadNowButton(id: widget.novel.id),
                        SizedBox(width: 1.w,),
                        BookMarkButton(id: widget.novel.id),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
