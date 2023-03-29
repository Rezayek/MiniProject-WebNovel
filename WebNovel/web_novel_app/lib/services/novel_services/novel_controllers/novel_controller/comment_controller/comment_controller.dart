import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapter_comment_animation.dart';

import '../../../../../widgets/novel_data_widgets/chapter/chapter_widgets/chapter_comments/chapters_comment_container.dart';
import '../../../novel_bloc.dart/comment_bloc/comment_bloc.dart';
import '../../../novel_bloc.dart/comment_bloc/comment_event.dart';
import '../../../novel_bloc.dart/comment_bloc/comment_state.dart';

class CommentController extends StatefulWidget {
  final bool isTextComment;
  final int id;
  const CommentController({super.key, required this.isTextComment, required this.id});

  @override
  State<CommentController> createState() => _CommentControllerState();
}

class _CommentControllerState extends State<CommentController> {
  @override
  void initState() {
    if (widget.isTextComment) {
      context.read<CommentBloc>().add(CommentEventGetTextComment(textId: widget.id));
    } else {
      context
          .read<CommentBloc>()
          .add(CommentEventGetChapterComment(chapterId: widget.id));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentStateLoadingComment) {
          return const ChapterCommentAnimation();
        } else if (state is CommentStateGetComment) {
          return const ChapterCommentsContainer();
        }
        return Container();
      },
    );
  }
}
