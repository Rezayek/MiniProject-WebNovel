import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/novel_model.dart';

import 'package:web_novel_app/widgets/novel_data_widgets/novel_infos_container/novel_containers/novel_dialog.dart';
import 'package:web_novel_app/widgets/novel_widgets/novel_image.dart';



class CarouselItem extends StatelessWidget {
  final NovelModel novel;

  const CarouselItem({Key? key, required this.novel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await novelDialog(
            context: context,
            novel: novel,
            optionBuilder: () => {"confirm": true});
        
        
      },
      child: Center(
        child: SizedBox(
          height: 30.h,
          width: 92.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NovelImage(
                  url: novel.url,
                  height: 25.h,
                  width: 33.w,
                  opacity: 0.5),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  height: 25.h,
                  width: 55.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(novel.name,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: black),
                          overflow: TextOverflow.ellipsis),
                      SizedBox(
                        height: 19.h,
                        width: 55.w,
                        child: Text(
                          novel.description,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: white),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 8,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
