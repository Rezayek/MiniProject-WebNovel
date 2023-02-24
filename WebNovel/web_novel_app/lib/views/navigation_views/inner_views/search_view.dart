import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/search_controllers/search_controller.dart';
import 'package:web_novel_app/widgets/nav_widgets/search_widgets/serach_bar.dart';


import '../../../services/novel_services/novel_bloc.dart/search_bloc.dart/search_bloc.dart';
import '../../../services/novel_services/novel_bloc.dart/search_bloc.dart/search_event.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  
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
              SearchBar(
                searchStart: (isTapped, option) {
                  context.read<SearchBloc>().add(NovelEventGetSearchResult(option: option));
                },
              ),
              const SeachContoller(),
            ],
          ),
        ),
    )
    ;
  }
}
