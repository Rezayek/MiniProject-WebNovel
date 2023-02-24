import 'package:flutter/material.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/user_gift.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/user_label.dart';

class LatestGiftLine extends StatelessWidget {
  final double height;
  final double width;
  final GiftsModel gift;
  final int index;
  const LatestGiftLine(
      {super.key,
      required this.height,
      required this.width,
      required this.gift, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: black,
        width: 0.0,
        style: BorderStyle.solid,
      ))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.8,
            width: width * 0.1,
            child: Center(child: Text((index+1).toString(), style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: black),)),
          ),
          UserLabel(height: height * 0.8, width: width * 0.3, userName: gift.userName, url: gift.userUrl, onTap: (isTapped){} ,),
          UserGift(height: height * 0.8, width: width * 0.3, giftName: gift.giftName, url: gift.giftImg)
        ],
      ),
    );
  }
}
