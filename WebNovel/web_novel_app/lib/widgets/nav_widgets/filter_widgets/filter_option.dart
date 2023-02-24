import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

import '../../../constants/enums.dart';
import '../../../utilities/singletons/filter_list_singleton.dart';

class FilterOption extends StatefulWidget {
  final String option;
  final bool isFirst;
  final FilterMenu filterMenu;
  const FilterOption({super.key, required this.option, required this.isFirst, required this.filterMenu});

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  bool _isChecked = false;
  FilterListSingleton filter = FilterListSingleton();
  @override
  void initState() {
    setState(() {
      if (filter.isInTheList(widget.filterMenu ,widget.option)) {
        _isChecked = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (!widget.isFirst) {
              if (_isChecked) {
                _isChecked = false;
                FilterListSingleton().removeFilterValue(widget.filterMenu, widget.option);
              } else {
                _isChecked = true;
                FilterListSingleton().addFilterValue(widget.filterMenu, widget.option);
              }
            }
          });
        },
        child: SizedBox(
          height: 5.h,
          width: 37.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5.h,
                width: 20.w,
                child: Text(
                  widget.option,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: black,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              !widget.isFirst
                  ? Container(
                      height: 4.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                                color: black.withOpacity(0.5))
                          ]),
                      child: Checkbox(
                        shape: const CircleBorder(),
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              if (!widget.isFirst) {
                                if (value) {
                                  _isChecked = value;
                                  FilterListSingleton()
                                      .addFilterValue(widget.filterMenu, widget.option);
                                } else {
                                  _isChecked = value;
                                  FilterListSingleton()
                                      .removeFilterValue(widget.filterMenu, widget.option);
                                }
                              }
                            }
                          });
                        },
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
