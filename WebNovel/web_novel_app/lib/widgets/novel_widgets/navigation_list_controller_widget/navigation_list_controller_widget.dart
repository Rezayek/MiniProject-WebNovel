import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/novel_widgets/navigation_list_controller_widget/list_nav_button.dart';
import 'package:web_novel_app/widgets/novel_widgets/navigation_list_controller_widget/text_index.dart';


class NavigationListControllerWidget extends StatefulWidget {
  final double height;
  final double width;
  final int currentIndex;
  final BuildContext context;
  final Function(bool) nextFunc;
  final Function(bool) backFunc;
  const NavigationListControllerWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.currentIndex,
      required this.context,
      required this.nextFunc,
      required this.backFunc});

  @override
  State<NavigationListControllerWidget> createState() =>
      _NavigationListControllerWidgetState();
}

class _NavigationListControllerWidgetState
    extends State<NavigationListControllerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.only(
          top: 1.h,
          bottom: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListNavButton(
              isForward: false,
              event: (isTapped) {
                if (isTapped) {
                  widget.backFunc(isTapped);
                }
              },
              height: widget.height,
              width: (widget.width / 7) * 1.5,
              margins: [
                1.h,
                1.h,
                1.h,
                1.h
              ],
              iconSize: 9.w,),
          TextIndex(
            height: widget.height,
            width: (widget.width / 7) * 2,
            margins: [
              1.h,
              1.h,
              1.h,
              1.h
            ],
            currentIndex: widget.currentIndex,
          ),
          ListNavButton(
              isForward: true,
              event: (isTapped) {
                if (isTapped) {
                  widget.nextFunc(isTapped);
                }
              },
              height: widget.height,
              width: (widget.width / 7) * 1.5,
              margins: [
                1.h,
                1.h,
                1.h,
                1.h
              ],
              iconSize: 9.w,),
        ],
      ),
    );
  }
}
