import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/search_bloc.dart/search_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/search_bloc.dart/search_state.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/novel_tag_animation.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/novel_infos/with_tag/novel_rank_infos_list.dart';
import 'package:web_novel_app/widgets/nav_widgets/search_widgets/search_option_list.dart';

import '../../../../widgets/nav_widgets/search_widgets/serach_bar.dart';
import '../../novel_bloc.dart/search_bloc.dart/search_event.dart';
import '../../novels_exceptions.dart';


class SeachContoller extends StatefulWidget {
  const SeachContoller({super.key});

  @override
  State<SeachContoller> createState() => _SeachContollerState();
}

class _SeachContollerState extends State<SeachContoller> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusScope.of(context).unfocus();
          SearchBar.isFocused = false;
        });
      },
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is NovelStateGetSearchHistory) {
            if (state.exception is NovelExceptionFileIsMessing) {
              return const Center(
                child: Text("Can't get Data...", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              );
            } else {
              return SearchOptionList(
                  options: state.options,
                  remove: (isTapped, index) {
                    if (isTapped) {
                      context
                          .read<SearchBloc>()
                          .add(NovelEventRemoveSearchHistory(index: index));
                    }
                  },
                  search: (isTapped, keyWord) {
                    if (isTapped) {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        SearchBar.isFocused = false;
                      });
                      context
                          .read<SearchBloc>()
                          .add(NovelEventGetSearchResult(option: keyWord));
                    }
                  });
            }
          }
          if (state is NovelStateGetSearchResult) {
            if (state.exception is NovelExceptionCantGetNovels) {
              return const Center(
                child: Text("Can't get Data...", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${state.novels.length} search result(s) for ${state.option}.", style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis),
                  NovelRankInfosList(
                      novels: state.novels,
                      isHoizontal: false,
                      height: 73.h),
                ],
              );
            }
          }
          if (state is NovelStateSearchWaiting) {
            return NovelTagAnimation(
                isHoizontal: false,
                height: 75.h);
          } else {
            return const Center(
              child: Text("...", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
            );
          }
        },
      ),
    );
  }
}
