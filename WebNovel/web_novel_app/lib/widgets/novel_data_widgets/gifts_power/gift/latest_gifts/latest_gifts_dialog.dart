import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';

import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/latest_gifts/latest_gifts_list.dart';


import '../../../../../constants/colors.dart';



typedef DialogOptions<T> = Map<String, T?> Function();

Future<T?> latestGiftsDialog<T>({
  required BuildContext context,
  required List<GiftsModel> gifts
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
              "Latest Gifts",
              style: TextStyle(
                  color: black, fontSize: 20, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: LatestGiftsList(height: 40.h, width: 80.w, gifts: gifts),
      );
    },
  );
}