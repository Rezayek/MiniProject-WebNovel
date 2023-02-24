import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../widgets/novel_widgets/navigation_list_controller_widget/navigators/filter_navigator.dart';
import '../../novel_bloc.dart/index_bloc/index_bloc.dart';
import '../../novel_bloc.dart/index_bloc/novel_state.dart';

class IndexController extends StatefulWidget {
  final BuildContext context;
  const IndexController({super.key, required this.context});

  @override
  State<IndexController> createState() => _IndexControllerState();
}

class _IndexControllerState extends State<IndexController> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
      builder: (context, state) {
        if(state is IndexStateInit){
          return FilterNavigator(
            height: 7.h,
            width: 50.w,
            currentIndex: 1,
            context: widget.context,
          );
        }
        if (state is IndexStateGetNovel) {
          return FilterNavigator(
            height: 7.h,
            width: 50.w,
            currentIndex: state.currentIndex,
            context: widget.context,
          );
        } else {
          return SizedBox(
            height: 7.h,
            width: 50.w,
          );
        }
      },
    );
  }
}
