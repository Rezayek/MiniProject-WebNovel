import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class ReadNowButton extends StatelessWidget {
  final String id;
  const ReadNowButton({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      width: 30.w,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(35),
          gradient: const LinearGradient(
              colors: [lightPurple, black],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: const Center(
        child:  Text(
          "Read Now",
          style:
              TextStyle(color: white, fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
    );
  }
}
