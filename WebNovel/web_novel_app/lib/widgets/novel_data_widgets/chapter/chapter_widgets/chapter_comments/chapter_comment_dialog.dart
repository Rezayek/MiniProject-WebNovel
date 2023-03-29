import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_provider.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapter_add_comment.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapters_comment_container.dart';

import '../../../../../constants/colors.dart';
import 'dart:developer' as debug;

import '../../../../../services/novel_services/novel_bloc.dart/comment_bloc/comment_bloc.dart';
import '../../../../../services/novel_services/novel_bloc.dart/comment_bloc/comment_event.dart';
import '../../../../../services/novel_services/novel_controllers/novel_controller/comment_controller/comment_controller.dart';
import '../../../../../services/novel_services/novel_services.dart';

Future<T?> chapterCommentDialog<T>({
  required BuildContext context,
  required bool isTextComment, 
  required int id,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => CommentBloc(NovelServices()),
          child: AlertDialog(
            titlePadding: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: white,
            title: Container(
              height: 65,
              decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [lightBlue, lightPurple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Comments",
                      style: TextStyle(
                          color: black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
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
            contentPadding: const EdgeInsets.only(top: 5),
            content: Container(
              height: 60.h,
              decoration: const BoxDecoration(color: white),
              child: Column(
                children: [
                  Container(
                    height: 50.h,
                    decoration: const BoxDecoration(color: white),
                    child: CommentController(isTextComment:isTextComment, id: id,),
                  ),
                  ChapterAddComment(
                    addComment: (isTapped, comment) {
                      if (isTapped) {
                        debug.log(comment);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      });
}
