import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_general_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_default_button.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/responsive_text.dart';

import '../../../../constants/colors.dart';
import '../../../../services/novel_services/novel_bloc.dart/chapter_bloc/chapter_bloc.dart';
import '../../../../services/novel_services/novel_bloc.dart/chapter_bloc/chapter_event.dart';
import 'buttons_bar.dart';
import 'chapter_comments/chapter_comment_dialog.dart';

class ChapterContainer extends StatelessWidget {
  final ChapterGeneralModel? content;
  const ChapterContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: content!.content.isEmpty
          ? emptyChapter(context)
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: content!.content.length + 2,
              itemBuilder: (context, index) {
                return buildWidget(index, context);
              },
            ),
    );
  }

  Widget emptyChapter(BuildContext context) => SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            Container(
              height: 25.h,
              width: 35.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Chibi.png"),
                      fit: BoxFit.cover)),
            ),
            const Text(
              "No Chapter",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            GestureDetector(
                onTap: () => context
                    .read<ChapterBloc>()
                    .add(ChapterEventGetChapter(chapterId: content!.chapterId)),
                child: ChapterDefaultButton(
                    icon: Icons.replay,
                    text: "Reload",
                    width: 30.w,
                    iconisRight: true,
                    textisLeft: true))
          ],
        ),
      );

  Widget buildWidget(index, BuildContext context) {
    if (index == 0) {
      return ResponsiveText(
        content: content!.chapterTitle,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        textColor: black,
        isText: false,
        commentsTotal: null,
        openComments: null,
      );
    } else if (index == content!.content.length + 1) {
      return ButtonsBar(
        backFunc: (bool istapped) {
          if (istapped) {
          } else {
            return;
          }
        },
        commentFunc: (bool istapped)async {
          if (istapped) {
            await chapterCommentDialog(context: context, isTextComment: false, id: content!.chapterId);
          } else {
            return;
          }
        },
        nextFunc: (bool istapped) {
          if (istapped) {
            if (content!.isNextLocked) {
              context
                  .read<ChapterBloc>()
                  .add(ChapterEventGetChapter(chapterId: content!.chapterId));
            }
          } else {
            return;
          }
        },
      );
    } else {
      return ResponsiveText(
        content: content!.content[index - 1].content,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        textColor: black,
        isText: true,
        commentsTotal: content!.content[index - 1].totalComments,
        openComments: (isTapped) async {
          await chapterCommentDialog(context: context, isTextComment: true, id: content!.content[index - 1].textId);
        },
      );
    }
  }
}
