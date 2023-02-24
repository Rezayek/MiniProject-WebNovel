import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_bloc.dart';
import 'package:web_novel_app/utilities/singletons/chapters_singleton.dart';

import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_event.dart';
import '../navigation_list_controller_widget.dart';


class ChaptersNavigator extends StatelessWidget {
  final double height;
  final double width;
  final int currentIndex;
  final BuildContext context;
  const ChaptersNavigator(
      {super.key,
      required this.height,
      required this.width,
      required this.currentIndex,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return NavigationListControllerWidget(
        height: height,
        width: width,
        currentIndex: currentIndex + 1,
        context: context,
        nextFunc: (isTapped) {
          context.read<NovelChaptersBloc>().add(NovelChapterEventNextList(
              index: (ChaptersSingleton().chapters.length / 100).ceil() <= currentIndex + 1
                  ? currentIndex
                  : currentIndex + 1));
        },
        backFunc: (isTapped) {
          context.read<NovelChaptersBloc>().add(NovelChapterEventNextList(
              index: currentIndex -1 < 0 ? 0 : currentIndex - 1));
        });
  }
}
