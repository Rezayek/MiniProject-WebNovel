import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../widgets/nav_widgets/home_widgets/home_widgets_animations/novel_tag_animation.dart';
import '../../../../widgets/nav_widgets/home_widgets/novel_infos/with_tag/novel_rank_infos_list.dart';
import '../../novel_bloc.dart/rank_blocs/reader_rank_bloc/reader_rank_bloc.dart';
import '../../novel_bloc.dart/rank_blocs/reader_rank_bloc/reader_rank_event.dart';
import '../../novel_bloc.dart/rank_blocs/reader_rank_bloc/reader_rank_state.dart';
import '../../novels_exceptions.dart';


class ReaderRankController extends StatefulWidget {
  const ReaderRankController({Key? key}) : super(key: key);

  @override
  State<ReaderRankController> createState() => _ReaderRankControllerState();
}

class _ReaderRankControllerState extends State<ReaderRankController> {
  @override
  void initState() {
    context.read<ReaderRankBloc>().add(NovelEventGetReadersNovels());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReaderRankBloc, ReaderRankState>(
      builder: (context, state) {
        if (state is NovelStateGetReadersNovels) {
          if (state.exception is NovelExceptionCantGetNovels) {
            return Container();
          } else if (state.exception is NovelExceptionGeneric) {
            return Container();
          } else {
            return NovelRankInfosList(novels: state.novels, height: 30.h, isHoizontal: true,);
          }
        } else {
          return NovelTagAnimation(height: 30.h, isHoizontal: true,);
        }
      },
    );
  }
}
