import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/nav_widgets/filter_widgets/filter_option.dart';

import '../../../constants/enums.dart';

class FilterSubButton extends StatefulWidget {
  final String label;
  final List<String> options;
  final FilterMenu filterMenu;
  const FilterSubButton(
      {super.key, required this.label, required this.options, required this.filterMenu});

  @override
  State<FilterSubButton> createState() => _FilterSubButtonState();
}

class _FilterSubButtonState extends State<FilterSubButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 33.w,
      padding: EdgeInsets.all(1.h),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 3,
                color: black.withOpacity(0.5),
                offset: const Offset(0, 1.5))
          ]),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          menuMaxHeight: 35.h,
          icon: Icon(
            Icons.arrow_drop_down,
            size: 8.w,
            color: black,
          ),
          isExpanded: true,
          value: widget.label,
          items: widget.options
              .map((option) => DropdownMenuItem(
                  value: option,
                  child: FilterOption(
                    option: option,
                    isFirst: widget.options.first == option ? true : false, filterMenu: widget.filterMenu,
                  )))
              .toList(),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
