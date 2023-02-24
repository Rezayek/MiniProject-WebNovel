import 'package:flutter/material.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/total_crytals.dart';

import '../../../../../constants/colors.dart';
import '../../../../../services/novel_services/models/power_model.dart';
import '../../user_label.dart';

class TopGivenPowerLine extends StatelessWidget {
  final PowerModel power;
  final double height;
  final double width;
  final int index;
  const TopGivenPowerLine({super.key, required this.power, required this.height, required this.width, required this.index});

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
          UserLabel(height: height * 0.8, width: width * 0.3, userName: power.userName, url: power.userImgUrl, onTap: (isTapped){} ,),
          TotaleCrytals(height: height * 0.8, width: width * 0.3, crytals: power.givenPower.toString())
        ],
      ),
    );
  }
}
