import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';
import 'package:web_novel_app/utilities/singletons/chapters_singleton.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/novel_chapters/novel_chapter_container.dart';

import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_bloc.dart';
import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_event.dart';
import '../../../../utilities/singletons/user_singleton.dart';
import 'chapter_unLock_dialog.dart';

class NovelChaptersList extends StatefulWidget {
  final double height;
  final double width;
  final String novelId;
  final List<ChapterModel> chapters;
  const NovelChaptersList(
      {super.key,
      required this.height,
      required this.width,
      required this.chapters,
      required this.novelId});

  @override
  State<NovelChaptersList> createState() => _NovelChaptersListState();
}

class _NovelChaptersListState extends State<NovelChaptersList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.height * 0.01),
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 1.5,
                offset: const Offset(1, 1),
                color: black.withOpacity(0.7)),
            BoxShadow(
                blurRadius: 1.5,
                offset: const Offset(-1, -1),
                color: black.withOpacity(0.7))
          ]),
      child: ListView.builder(
        itemCount: widget.chapters.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => NovelChapterContainer(
          chapterModel: widget.chapters[index],
          index: index + ChaptersSingleton.currentIndex * 100,
          height: widget.height * 0.205,
          width: widget.width * 0.95,
          onTap: (isTapped) async {
            if (isTapped) {
              if (UserSingleton().currentUser.coins < 15) {
                final snackBar = SnackBar(
                  content: const Text('Not Enough Coins'),
                  duration: const Duration(milliseconds: 1500),
                  action: SnackBarAction(
                    label: 'Okay',
                    onPressed: () {
                      // Some code to undo the change.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                final result = await unlockChapterDialog(
                    context: context,
                    chapterTitle: widget.chapters[index].chapterTitle,
                    optionBuilder: () => {"confirm": true});
                if (result == null) return;
                if (result == true) unlockTrigger(widget.novelId, widget.chapters[index].chapterId, index);
              }
            }
          },
        ),
      ),
    );
  }

  void unlockTrigger(String novelId, String chapterId, int index) => context.read<NovelChaptersBloc>().add(
    NovelChapterEventLockChapter(
        novelId: novelId,
        chapterId: chapterId,
        index: index));
}
