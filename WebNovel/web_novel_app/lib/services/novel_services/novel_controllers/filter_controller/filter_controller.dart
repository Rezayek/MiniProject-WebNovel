import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/nav_widgets/home_widgets/home_widgets_animations/novel_tag_animation.dart';
import '../../../../widgets/nav_widgets/home_widgets/novel_infos/with_tag/novel_rank_infos_list.dart';
import '../../novel_bloc.dart/filter_bloc/filter_bloc.dart';
import '../../novel_bloc.dart/filter_bloc/filter_event.dart';
import '../../novel_bloc.dart/filter_bloc/filter_state.dart';
import '../../novels_exceptions.dart';


class FilterController extends StatefulWidget {
  const FilterController({Key? key}) : super(key: key);

  @override
  State<FilterController> createState() => _ReaderRankControllerState();
}

class _ReaderRankControllerState extends State<FilterController> {
  @override
  void initState() {
    context.read<FilterBloc>().add(FilterEventGetNovels());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {

        if (state is FilterStateGetNovels) {
          if (state.exception is NovelExceptionCantGetNovels) {
            return Container();
          } else if (state.exception is NovelExceptionGeneric) {
            return Container();
          } else {
            return NovelRankInfosList(
              novels: state.novels,
              height: 75.h,
              isHoizontal: false,
            );
          }
        } else if (state is FilterWaiting) {
          return NovelTagAnimation(
            height: 75.h,
            isHoizontal: false,
          );
        } else if (state is FilterStateGetFilteredNovels) {
          if (state.novels.isNotEmpty) {
            return NovelRankInfosList(
              novels: state.novels,
              height: 75.h,
              isHoizontal: false,
            );
          } else {
            return SizedBox(
                height: 30.h,
                child: const Center(
                  child: Text(
                    "No novel is Founded",
                    style: TextStyle(
                        color: black,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ));
          }
        } else {
         
          return NovelTagAnimation(
            height: 75.h,
            isHoizontal: false,
          );
        }
      },
    );
  }
}
