import 'package:flutter/material.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/latest_gifts/latest_gift_line.dart';

class LatestGiftsList extends StatelessWidget {
  final double height;
  final double width;
  final List<GiftsModel> gifts;
  const LatestGiftsList({super.key, required this.height, required this.width, required this.gifts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(itemCount: gifts.length ,itemBuilder: (context, index) => LatestGiftLine(height: height * 0.17 , width: width, gift: gifts[index], index: index),),
    );
  }
}
