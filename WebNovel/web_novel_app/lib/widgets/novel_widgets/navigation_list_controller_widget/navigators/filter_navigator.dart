import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/widgets/novel_widgets/navigation_list_controller_widget/navigation_list_controller_widget.dart';

import '../../../../services/novel_services/novel_bloc.dart/index_bloc/index_bloc.dart';
import '../../../../services/novel_services/novel_bloc.dart/index_bloc/novel_event.dart';

class FilterNavigator extends StatelessWidget {
  final double height;
  final double width;
  final int currentIndex;
  final BuildContext context;
  const FilterNavigator(
      {super.key,
      required this.height,
      required this.width,
      required this.currentIndex,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return NavigationListControllerWidget(
        height: height,
        width: width,
        currentIndex: currentIndex,
        context: context,
        nextFunc: (isTapped){
          context.read<IndexBloc>().add(IndexEventGetNovels(index: currentIndex , context: context));
        },
        backFunc: (isTapped){context.read<IndexBloc>().add(IndexEventGetNovels(index: currentIndex - 2 <= 0? 0: currentIndex - 2,context: context));
        });
  }
}
