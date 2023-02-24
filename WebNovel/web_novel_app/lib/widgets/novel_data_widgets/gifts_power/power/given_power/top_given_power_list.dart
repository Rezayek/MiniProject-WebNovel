import 'package:flutter/material.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/given_power/top_given_power_line.dart';

import '../../../../../services/novel_services/models/power_model.dart';

class LatestGivenPowerList extends StatelessWidget {
  final double height;
  final double width;
  final List<PowerModel> power;
  const LatestGivenPowerList(
      {super.key,
      required this.height,
      required this.width,
      required this.power});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView.builder(
        itemCount: power.length,
        itemBuilder: (context, index) => TopGivenPowerLine(
            height: height * 0.17,
            width: width,
            power: power[index],
            index: index),
      ),
    );
  }
}
