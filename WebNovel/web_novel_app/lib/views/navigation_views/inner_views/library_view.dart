import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/filter_controller/filter_controller.dart';
import 'package:web_novel_app/utilities/singletons/filter_list_singleton.dart';
import 'package:web_novel_app/widgets/nav_widgets/filter_widgets/filter_button.dart';
import 'package:web_novel_app/widgets/nav_widgets/filter_widgets/filter_dialog.dart';


import '../../../services/novel_services/novel_bloc.dart/filter_bloc/filter_bloc.dart';
import '../../../services/novel_services/novel_bloc.dart/filter_bloc/filter_event.dart';
import '../../../services/novel_services/novel_controllers/filter_controller/index_controller.dart';


class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final isComfirmed = await filterDialog(
                      context: context,
                      title: "Filter",
                      optionBuilder: () => {'Confirm': true},
                    );
                    if(isComfirmed != null){
                      if (isComfirmed) {
                        // ignore: use_build_context_synchronously
                        context
                            .read<FilterBloc>()
                            .add(FilterEventGetFilteredNovels(index: 0));
                      } else {
                        FilterListSingleton().asignNewList(false);
                      }
                    }
                    
                  },
                  child: const FilterButton()
                ),
                IndexController(context: context)
              ],
            ),
            const FilterController(),
            
          ],
        ),
      ),
    );
  }
}
