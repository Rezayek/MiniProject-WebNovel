import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/nav_widgets/search_widgets/history_option.dart';
import 'package:web_novel_app/widgets/nav_widgets/search_widgets/serach_bar.dart';

class SearchOptionList extends StatefulWidget {
  final List<String> options;
  final Function(bool, int) remove;
  final Function(bool, String) search;


  const SearchOptionList({super.key, required this.options, required this.remove, required this.search,});

  @override
  State<SearchOptionList> createState() => _SearchOptionListState();
}

class _SearchOptionListState extends State<SearchOptionList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          FocusScope.of(context).unfocus();
          SearchBar.isFocused = false;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        height: 60.h,
        width: 80.w,
        child: ListView.builder(
          itemCount: widget.options.length,
          itemBuilder: (context, index) => HistoryOption(optionName: widget.options[index], removeOption: (isTrue) => widget.remove(isTrue, index), optionTapped: (isTrue) => widget.search(isTrue, widget.options[index])),
        ),
      ),
    );
  }
}
