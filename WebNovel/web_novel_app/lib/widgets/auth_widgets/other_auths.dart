import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/auth_widgets/default_border.dart';

class OtherAuths extends StatelessWidget {
  const OtherAuths({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      width: 75.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DefaultBorder(
              borderRadius: 15,
              height: 8.h,
              width: 75.w),
          Container(
            height: 7.8.h,
            width: 73.w,
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 2.w,
                      left: 2.w,),
                  child: const Text("Sign with:",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 2.w),
                  child: InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.google,
                        color: black,
                        size: 30,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: 2.w),
                  child: InkWell(
                      onTap: () {},
                      child: const FaIcon(
                        FontAwesomeIcons.facebook,
                        color: black,
                        size: 30,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
