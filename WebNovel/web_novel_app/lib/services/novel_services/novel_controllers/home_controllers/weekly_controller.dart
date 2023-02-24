import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/weekly_bloc/weekly_bloc.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/novel_simple_animation.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/novel_infos/without_tag/novel_simple_infos_list.dart';


import '../../novel_bloc.dart/weekly_bloc/weekly_event.dart';
import '../../novel_bloc.dart/weekly_bloc/weelky_state.dart';
import '../../novels_exceptions.dart';

class WeeklyController extends StatefulWidget {
  const WeeklyController({Key? key}) : super(key: key);

  @override
  State<WeeklyController> createState() => _WeeklyControllerState();
}

class _WeeklyControllerState extends State<WeeklyController> {
  @override
  void initState() {
    context.read<WeeklyBloc>().add(NovelEventGetWeeklyNovels());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeeklyBloc, WeeklyState>(
      builder: (context, state) {
        if (state is NovelStateGetWeeklyNovels) {
          if (state.exception is NovelExceptionCantGetNovels) {
            return Container();
          } else if (state.exception is NovelExceptionGeneric) {
            return Container();
          } else {
            return NovelSimpleInfosList(novels: state.novels);
          }
        } else {
          return const NovelSimpleAnimation();
        }
      },
    );
  }
}
