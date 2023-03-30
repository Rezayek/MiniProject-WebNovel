import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/chapter_bloc/chapter_event.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_container.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_container_animation.dart';

import '../../../novel_bloc.dart/chapter_bloc/chapter_bloc.dart';
import '../../../novel_bloc.dart/chapter_bloc/chapter_state.dart';

class ChapterContentController extends StatefulWidget {
  final int chapterId;
  const ChapterContentController({super.key, required this.chapterId});

  @override
  State<ChapterContentController> createState() =>
      _ChapterContentControllerState();
}

class _ChapterContentControllerState extends State<ChapterContentController> {
  @override
  void initState() {
    context.read<ChapterBloc>().add(ChapterEventGetChapter(chapterId: widget.chapterId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterBloc, ChapterState>(
      builder: (context, state) {
        if (state is ChapterStateLoadingChapter) {
          return const ChapterContainerAnimation();
        } else if (state is ChapterStateGetChapter) {
          return ChapterContainer(content: state.chapterData);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
