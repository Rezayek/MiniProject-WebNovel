import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_controllers/novel_controller/gifts_controller/users_gifts_controller/users_gifts_controller.dart';

import '../../../../constants/colors.dart';
import '../../../nav_widgets/home_widgets/label/label.dart';


class GiftsHolder extends StatefulWidget {
  final String novelId;
  const GiftsHolder({super.key, required this.novelId});

  @override
  State<GiftsHolder> createState() => _GiftsHolderState();
}

class _GiftsHolderState extends State<GiftsHolder> {
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
              title: "Gifts",
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
          UsersGiftsController(
            novelId: widget.novelId,
          ),
        ],
      ),
    );
  }
}
