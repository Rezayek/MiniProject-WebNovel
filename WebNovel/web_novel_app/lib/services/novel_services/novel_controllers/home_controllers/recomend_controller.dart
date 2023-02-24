import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/novel_simple_animation.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/recomendation/reconmendation_container.dart';

import '../../novel_bloc.dart/recomend_bloc/recomend_bloc.dart';
import '../../novel_bloc.dart/recomend_bloc/recomend_event.dart';
import '../../novel_bloc.dart/recomend_bloc/recomend_state.dart';
import '../../novels_exceptions.dart';

class RecomendController extends StatefulWidget {
  const RecomendController({Key? key}) : super(key: key);

  @override
  State<RecomendController> createState() => _RecomendControllerState();
}

class _RecomendControllerState extends State<RecomendController> {
  @override
  void initState() {
    context.read<RecomendBloc>().add(NovelEventGetRecomendedNovels());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecomendBloc, RecomendState>(
      builder: (context, state) {
        if (state is NovelStateGetRecomendedNovels) {
          if (state.exception is NovelExceptionCantGetNovels) {
            return Container();
          } else if (state.exception is NovelExceptionGeneric) {
            return Container();
          } else {
            return RecomendationContainer(novels: state.novels);
          }
        } else {
          return const NovelSimpleAnimation();
        }
      },
    );
  }
}