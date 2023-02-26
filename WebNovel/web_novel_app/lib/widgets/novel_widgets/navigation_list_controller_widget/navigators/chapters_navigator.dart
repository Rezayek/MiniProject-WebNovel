import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_bloc.dart';
import 'package:web_novel_app/utilities/singletons/chapters_singleton.dart';

import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_event.dart';
import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_state.dart';
import '../navigation_list_controller_widget.dart';

class ChaptersNavigator extends StatefulWidget {
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
  State<ChaptersNavigator> createState() => _ChaptersNavigatorState();
}

class _ChaptersNavigatorState extends State<ChaptersNavigator> {
  bool _lock = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NovelChaptersBloc, NovelChaptersState>(
      listener: (context, state) {
        if (state is NovelChaptersStateGetChapters) {
          setState(() {
            if (state.isUnlocking == true) {
              _lock = true;
            } else {
              _lock = false;
            }
          });
        }
      },
      child: NavigationListControllerWidget(
          height: widget.height,
          width: widget.width,
          currentIndex: widget.currentIndex + 1,
          context: context,
          nextFunc: (isTapped) {
            if (_lock){
               unLockingMsg();
            }else{
              context.read<NovelChaptersBloc>().add(NovelChapterEventNextList(
                index: (ChaptersSingleton().chapters.length / 100).ceil() <=
                        widget.currentIndex + 1
                    ? widget.currentIndex
                    : widget.currentIndex + 1));
            }
            
          },
          backFunc: (isTapped) {
            if (_lock){
               unLockingMsg();
            } else{
              context.read<NovelChaptersBloc>().add(NovelChapterEventNextList(
                index:
                    widget.currentIndex - 1 < 0 ? 0 : widget.currentIndex - 1));
            }
            
          }),
    );
  }

  void unLockingMsg() {
    final snackBar = SnackBar(
      content: const Text('Unlocking Chapter'),
      duration: const Duration(milliseconds: 1500),
      action: SnackBarAction(
        label: 'Okay',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
