// ignore: file_names
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/colors.dart';

import '../../../other_widgets/default_button.dart';

typedef DialogOptions<T> = Map<String, T?> Function();

Future<T?> unlockChapterDialog<T>({
  required BuildContext context,
  required String chapterTitle,
  required DialogOptions optionBuilder,
}) {
  final option = optionBuilder();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: white,
        title: Container(
          height: 5.h,
          decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [lightBlue, lightPurple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.w),
                  child: const Text(
                    "Unlock chapter",
                    style: TextStyle(
                        color: black, fontSize: 20, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close,
                    size: 35,
                    color: black,
                  ),
                )
              ],
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: SizedBox(
          height: 20.h,
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(1.5.h),
                child: SizedBox(
                  height: 20.h,
                  width: 70.w,
                  child: Center(child: Text("Unlock : \"$chapterTitle\" for 10 Coins?", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: black),))),
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.all(5),
        actions: [
          SizedBox(
            width: 100.w,
            height: 8.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      if (option["confirm"] != null) {
                        Navigator.of(context).pop(option["confirm"]);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: DefaultButton(
                        height: 10.h,
                        width: 30.w,
                        margins: [
                          1.h,
                          0,
                          1.h,
                          0
                        ],
                        text: "UnLock",
                        colors: const [lightBlue, darkPurple]))
              ],
            ),
          )
        ],
      );
    },
  );
}