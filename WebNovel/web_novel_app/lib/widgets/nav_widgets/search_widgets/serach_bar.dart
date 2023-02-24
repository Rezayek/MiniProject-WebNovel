import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';


import '../../../services/novel_services/novel_bloc.dart/search_bloc.dart/search_bloc.dart';
import '../../../services/novel_services/novel_bloc.dart/search_bloc.dart/search_event.dart';

class SearchBar extends StatefulWidget {
  final Function(bool, String) searchStart;
  static bool isFocused = false;
  const SearchBar({
    super.key,
    required this.searchStart,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController searchText;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    searchText = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    searchText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: 1.h,
            bottom: 1.h),
        height: 7.h,
        width: 90.w,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: black,
                offset: Offset(2, 2),
                blurRadius: 2,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.5.h,
              width: 65.w,
              child: TextField(
                focusNode: focusNode,
                controller: searchText,
                autofocus: SearchBar.isFocused ? true : false,
                onSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  SearchBar.isFocused = false;
                  widget.searchStart(true, searchText.text);
                },
                onTap: () {
                  if (SearchBar.isFocused) {
                    setState(() {
                      FocusScope.of(context).unfocus();
                      SearchBar.isFocused = false;
                    });
                  } else if (!SearchBar.isFocused) {
                    setState(() {
                      SearchBar.isFocused = true;
                      context
                          .read<SearchBloc>()
                          .add(NovelEventGetSearchHistory());
                    });
                  }

                  focusNode.requestFocus();
                },
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      color: black,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
            GestureDetector(
                onTap: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    SearchBar.isFocused = false;
                  });
                  widget.searchStart(true, searchText.text);
                },
                child: Icon(
                  Icons.search,
                  color: black,
                  size: 10.w,
                )),
            WillPopScope(
              child: const Offstage(),
              onWillPop: () async {
                setState(() {
                  FocusScope.of(context).unfocus();
                  SearchBar.isFocused = false;
                });
                return false;
              },
            )
          ],
        ),
      ),
    );
  }
}
