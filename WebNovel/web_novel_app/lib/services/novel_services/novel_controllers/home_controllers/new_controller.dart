import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/home_widgets_animations/container_animation.dart';
import 'package:web_novel_app/widgets/nav_widgets/home_widgets/new_novels/new_novels_container.dart';

import '../../novel_bloc.dart/new_bloc/new_bloc.dart';
import '../../novel_bloc.dart/new_bloc/new_event.dart';
import '../../novel_bloc.dart/new_bloc/new_state.dart';
import '../../novels_exceptions.dart';

class NewController extends StatefulWidget {
  const NewController({Key? key}) : super(key: key);

  @override
  State<NewController> createState() => _NewControllerState();
}

class _NewControllerState extends State<NewController> {
  @override
  void initState() {
    context.read<NewBloc>().add(NovelEventGetNewNovels());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewBloc, NewState>(
      builder: (context, state) {
        if (state is NovelStateGetNewNovels) {
          if (state.exception is NovelExceptionCantGetNovels) {
            return Container();
          } else if (state.exception is NovelExceptionGeneric) {
            return Container();
          } else {
            return NewNovelsContainer(novels: state.novels);
          }
        } else {
          return ContainerAnimation(hieght: 45.h, width: 97.w, margins: [0, 5.h]);
        }
      },
    );
  }
}