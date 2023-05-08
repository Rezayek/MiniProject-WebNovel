import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/services/novel_services/models/novel_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_buttons_data/novel_general_container.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_other_widgets/novels_description.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_stack/novel_stack.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_other_widgets/novel_tags_container.dart';

import '../../../../constants/colors.dart';

import '../../../other_widgets/default_button.dart';

typedef DialogOptions<T> = Map<String, T?> Function();

Future<T?> novelDialog<T>({
  required BuildContext context,
  required NovelModel novel,
  required DialogOptions optionBuilder,
}) {
  final option = optionBuilder();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: white,
        title: Container(
          height: 5.h,
          decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [lightBlue, lightPurple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text(
                    novel.name,
                    style: const TextStyle(
                        color: black, fontSize: 20, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close,
                    size: 35,
                    color: black,
                  ),
                )
              ],
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: SizedBox(
          height: 45.h,
          width: 85.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 80.h + novel.tags.length * 2.5.h + novel.description.length  * 0.6.h,
              width: 85.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NovelStack(
                      height: 40.h,
                      width: 80.w,
                      novelName: novel.name,
                      novelAuthor: novel.author[0],
                      novelTranslator: novel.translator[0],
                      novelRank: novel.currentRank.toString(),
                      url: novel.url),
                  NovelGeneralContainer(
                      height: 30.h,
                      width: 80.w,
                      novel: novel),
                  NovelTagsContainer(
                      width: 80.w,
                      tags: novel.tags),
                  NovelDescription(
                      width: 80.w,
                      description: novel.description)
                ],
              ),
            ),
          ),
        ),
        actionsPadding: const EdgeInsets.all(5),
        actions: [
          SizedBox(
            width: 100.w,
            height: 8.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      if (option["confirm"] != null) {
                        Navigator.of(context).pop(option["confirm"]);
                        Navigator.of(context).pushNamed("/novel", arguments: novel); 
                        // Navigator.push(context, MaterialPageRoute(builder: (_) => NovelView(novel: novel)));
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: DefaultButton(
                        height: 10.h,
                        width: 30.w,
                        margins: [
                          1.h,
                          0,
                          1.h,
                          0
                        ],
                        text: "More",
                        colors: const [lightBlue, darkPurple]))
              ],
            ),
          )
        ],
      );
    },
  );
}
