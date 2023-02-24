import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/given_power/top_given_power_list.dart';

import '../../../../../constants/colors.dart';
import '../../../../../services/novel_services/models/power_model.dart';

typedef DialogOptions<T> = Map<String, T?> Function();

Future<T?> givenPowerDialog<T>({
  required BuildContext context,
  required List<PowerModel> power
}) {
  
  
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
          child: const Center(
            child: Text(
              "Top Contributers",
              style: TextStyle(
                  color: black, fontSize: 20, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: LatestGivenPowerList(height: 40.h, width: 80.w, power: power),
      );
    },
  );
}