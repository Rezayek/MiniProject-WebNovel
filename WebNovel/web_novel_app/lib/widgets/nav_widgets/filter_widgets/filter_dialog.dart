import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/enums.dart';
import 'package:web_novel_app/widgets/nav_widgets/filter_widgets/filter_sub_button.dart';
import 'package:web_novel_app/widgets/other_widgets/default_button.dart';

import '../../../constants/colors.dart';
import '../../../constants/tags.dart';

typedef DialogOptions<T> = Map<String, T?> Function();

Future<T?> filterDialog<T>({
  required BuildContext context,
  required String title,
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: 1.w,
                      left: 25.w),
                  child: const Icon(Icons.filter_alt_outlined,
                      color: black, size: 35),
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: black, fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.w),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.close,
                      size: 35,
                      color: black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 5),
        content: SizedBox(
          height: 18.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilterSubButton(
                      label: genreTag[0], options: genreTag, filterMenu: FilterMenu.genre,),
                  FilterSubButton(
                      label: origineTag[0],
                      options: origineTag, filterMenu: FilterMenu.origine,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilterSubButton(
                      label: ageTag[0], options: ageTag, filterMenu: FilterMenu.age,),
                  FilterSubButton(
                      label: stateTag[0], options: stateTag, filterMenu: FilterMenu.status,),
                ],
              ),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.all(5),
        actions: [
          SizedBox(
            width: 90.w,
            height: 8.h,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      if (option["Confirm"] != null) {
                        Navigator.of(context).pop(option["Confirm"]);
                      } else {
                        Navigator.of(context).pop();
                      }
                    },
                    child: DefaultButton(
                        height: 10.h,
                        width: MediaQuery.of(context).size.width * 0.3,
                        margins: [
                          1.h,
                          0,
                          1.h,
                          0
                        ],
                        text: "Confirm",
                        colors: const [lightBlue, darkPurple]))
              ],
            ),
          )
        ],
      );
    },
  );
}
