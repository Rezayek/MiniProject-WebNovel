import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/novel_tag_animation.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/novel_infos/with_tag/novel_rank_infos_list.dart';

import '../../novel_bloc.dart/rank_blocs/power_rank_bloc/power_rank_bloc.dart';
import '../../novel_bloc.dart/rank_blocs/power_rank_bloc/power_rank_events.dart';
import '../../novel_bloc.dart/rank_blocs/power_rank_bloc/power_rank_state.dart';
import '../../novels_exceptions.dart';

class PowerRankController extends StatefulWidget {
  const PowerRankController({Key? key}) : super(key: key);

  @override
  State<PowerRankController> createState() => _PowerRankControllerState();
}

class _PowerRankControllerState extends State<PowerRankController> {
  @override
  void initState() {
    context.read<PowerRankBloc>().add(NovelEventGetPowerNovels());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PowerRankBloc, PowerRankState>(
      builder: (context, state) {
        if (state is NovelStateGetPowerNovels) {
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
