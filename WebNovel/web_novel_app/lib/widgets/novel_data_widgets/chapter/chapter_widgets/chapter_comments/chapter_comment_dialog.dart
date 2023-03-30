import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../../constants/colors.dart';
import '../../../../../services/novel_services/novel_bloc.dart/comment_bloc/comment_bloc.dart';
import '../../../../../services/novel_services/novel_controllers/novel_controller/comment_controller/comment_controller.dart';
import '../../../../../services/novel_services/novel_services.dart';

Future<T?> chapterCommentDialog<T>({
  required BuildContext context,
  required bool isTextComment, 
  required int id,
}) {
  return showDialog(
      context: context,
      builder: (contextDialog) {
        return BlocProvider(
          create: (contextDialog) => CommentBloc(NovelServices()),
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
            content: SizedBox(
              height: 60.h,
              width: 80.w,
              child: CommentController(isTextComment: isTextComment, id: id,)),
          ),
        );
      });
}
