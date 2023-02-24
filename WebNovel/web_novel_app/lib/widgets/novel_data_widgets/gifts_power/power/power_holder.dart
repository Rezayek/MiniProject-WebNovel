import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/novel_controller/power_controller/power_controller.dart';


import '../../../../constants/colors.dart';
import '../../../nav_widgets/home_widgets/label/label.dart';

class PowerHolder extends StatefulWidget {
  final String novelId;
  const PowerHolder({super.key, required this.novelId});

  @override
  State<PowerHolder> createState() => _PowerHolderState();
}

class _PowerHolderState extends State<PowerHolder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23.h,
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
              title: "Power",
              gradiantColors: [
                lightBlue.withOpacity(0.5),
                white.withOpacity(0)
              ],
              margin: [
                1.h,
                1.h,
                2.w
              ],
              expanded: 5.w),
           PowerController(novelId: widget.novelId),
        ],
      ),
    );
  }
}