import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/chapter_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/chapter/novel_chapters/chapter_infos.dart';

import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_bloc.dart';

import '../../../../services/novel_services/novel_bloc.dart/novel_chapters_bloc/novel_chapters_state.dart';
import '../../../../services/novel_services/novels_exceptions.dart';
import '../../../../utilities/singletons/chapters_singleton.dart';


class NovelChapterContainer extends StatefulWidget {
  final ChapterModel chapterModel;
  final int index;
  final double height;
  final double width;
  final Function(bool) onTap;
  const NovelChapterContainer(
      {super.key,
      required this.chapterModel,
      required this.index,
      required this.height,
      required this.width,
      required this.onTap});

  @override
  State<NovelChapterContainer> createState() => _NovelChapterContainerState();
}

class _NovelChapterContainerState extends State<NovelChapterContainer> {
  bool _chapterState = false;
  bool _isUnlocking = false;
  ChaptersSingleton chaptersSingleton = ChaptersSingleton();
  @override
  void initState() {
    if (widget.chapterModel.isLocked) {
      _chapterState = false;
    } else {
      _chapterState = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      if(chaptersSingleton.isChapterLocked(widget.index)){
        _chapterState = false;
      }
    });
    return BlocListener<NovelChaptersBloc, NovelChaptersState>(
      listener: (context, state) {
        if (state is NovelChaptersStateGetChapters) {
          if (state.exception is NovelExceptionCantUnLockChapter) {
          } else {
            if (state.index == -1) return;
            if (state.index == widget.index) {
              if (state.isUnlocking == true) {
                setState(() {
                  _isUnlocking = true;
                });
                return;
              }
              if (!chaptersSingleton.isChapterLocked(widget.index)) {
                setState(() {
                  _isUnlocking = false;
                  _chapterState = true;
                });
              }
            }
          }
        }
      },
      child: GestureDetector(
        onTap: () {
          if (_isUnlocking) return;
          if (!_chapterState) {
            widget.onTap(true);
          } else {
            widget.onTap(false);
          }
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: lightBlue.withOpacity(0.8),
            width: 0.0,
          ))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChapterInfos(
                  height: widget.height,
                  width: widget.width * 0.9,
                  index: widget.index,
                  chapterTitle: widget.chapterModel.chapterTitle,
                  releaseDate: widget.chapterModel.chapterRelease),
              !_isUnlocking
                  ? !_chapterState
                      ? Icon(
                          Icons.lock_outline_rounded,
                          size: widget.width * 0.08,
                          color: black,
                        )
                      : const SizedBox()
                  : const CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}
