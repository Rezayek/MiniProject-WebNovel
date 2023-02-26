import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/gifts_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/latest_gifts/latest_gifts_dialog.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/send_gift_widget/send_gift_dialog.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/total_gifts.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/user_gift.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift_power_container.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/send_button.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/user_label.dart';



class GiftsContainer extends StatelessWidget {
  final List<GiftsModel> gifts;
  final String novelId;
  const GiftsContainer({super.key, required this.gifts, required this.novelId});

  @override
  Widget build(BuildContext context) {
    final width = 95.w;
    final height = 8.h;
    return Center(
        child: GiftPowerContainer(
            width: width,
            height: height,
            children: gifts.isNotEmpty
                ? [
                    UserLabel(
                      height: height * 0.75,
                      width: width * 0.28,
                      userName: gifts[0].userName,
                      url: gifts[0].userUrl,
                      onTap: (isTapped) async {
                        await latestGiftsDialog(context: context, gifts: gifts);
                      },
                    ),
                    UserGift(
                        height: height * 0.75,
                        width: width * 0.28,
                        giftName: gifts[0].giftName,
                        url: gifts[0].giftImg),
                    TotalGifts(
                        height: height * 0.75,
                        width: width * 0.15,
                        gifts: gifts.length.toString()),
                    SendButton(
                        height: height * 0.75,
                        width: width * 0.2,
                        text: "Gift",
                        onTap: (isTapped) async {
                          await userGiftDialog(context: context, novelId: novelId);
                        })
                  ]
                : []),
      );
  }
}
