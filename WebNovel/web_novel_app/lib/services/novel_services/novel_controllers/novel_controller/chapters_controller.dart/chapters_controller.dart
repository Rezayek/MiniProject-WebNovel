import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_state.dart';
import 'package:web_novel_app/utilities/singletons/chapters_singleton.dart';

import '../../../../../widgets/novel_data_widgets/chapter/novel_chapters/chapter_list_animation.dart';
import '../../../../../widgets/novel_data_widgets/chapter/novel_chapters/novel_chapters_list.dart';
import '../../../../../widgets/novel_widgets/navigation_list_controller_widget/navigators/chapters_navigator.dart';
import '../../../novels_exceptions.dart';

class ChaptersController extends StatefulWidget {
  final String novelId;
  const ChaptersController({super.key, required this.novelId});

  @override
  State<ChaptersController> createState() => _ChaptersControllerState();
}

class _ChaptersControllerState extends State<ChaptersController> {
  @override
  void initState() {
    context
        .read<NovelChaptersBloc>()
        .add(NovelChapterEventGetNovelChapters(novelId: widget.novelId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NovelChaptersBloc, NovelChaptersState>(
      builder: (context, state) {
        if (state is NovelChaptersStateLoading) {
          return ChapterListAnimation(
            height: 40.h,
            width: 95.w,
          );
        } else if (state is NovelChaptersStateGetChapters) {
          if (state.exception is NovelExceptionCantGetChapters) {
            return Container();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NovelChaptersList(
                  chapters: state.chapters,
                  height: 40.h,
                  width: 95.w, 
                  novelId: widget.novelId,
                ),
                Center(child: ChaptersNavigator(
                  height: 7.h, 
                  width: 50.w, 
                  currentIndex: ChaptersSingleton.currentIndex, 
                  context: context),)
              ],
            );
          }
        } else {
          return ChapterListAnimation(
            height: 40.h,
            width: 95.w,
          );
        }
      },
    );
  }
}
