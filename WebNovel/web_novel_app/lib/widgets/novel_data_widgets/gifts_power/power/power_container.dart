import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/power_model.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/power_bloc/power_event.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift_power_Container.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/given_power/top_given_power_dialog.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/novel_rank_container.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/total_crytals.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/send_button.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/send_button_progress.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/user_label.dart';

import '../../../../constants/novel_power.dart';
import '../../../../services/novel_services/novel_bloc.dart/power_bloc/power_bloc.dart';
import '../../../../services/novel_services/novel_bloc.dart/power_bloc/power_state.dart';


class PowerContainer extends StatefulWidget {
  final String novelId;
  final Map<String, dynamic> novelPower;
  const PowerContainer(
      {super.key, required this.novelId, required this.novelPower});

  @override
  State<PowerContainer> createState() => _PowerContainerState();
}

class _PowerContainerState extends State<PowerContainer> {
  bool _isSending = false;

  @override
  Widget build(BuildContext context) {
    final width = 95.w;
    final height = 8.h;
    final usersPower = widget.novelPower[novelGivenPowers] as List<PowerModel>;
    final userDailyPower = widget.novelPower[userPower] as int;
    final novelGivenPower = widget.novelPower[novelPowers] as int;
    final novelRank = widget.novelPower[novelPowerRank] as int;

    

    return BlocListener<PowerBloc, PowerState>(
      listener: (context, state) {
        if(state is PowerStateGetPower){
          setState(() {
            _isSending = false;
          });
        }
      },
      child: Center(
          child: GiftPowerContainer(width: width, height: height, children: [
            NovelRankContainer(
                height: height, width: width * 0.15, rank: novelRank.toString()),
            UserLabel(
                height: height * 0.8,
                width: width * 0.3,
                userName: usersPower.isNotEmpty ? usersPower[0].userName : "None",
                url: usersPower.isNotEmpty ? usersPower[0].userImgUrl : "",
                onTap: (tapped) async {
                  await givenPowerDialog(context: context, power: usersPower);
                }),
            TotaleCrytals(
                height: height,
                width: width * 0.2,
                crytals: novelGivenPower.toString()),
            !_isSending
                ? SendButton(
                    height: height * 0.8,
                    width: width * 0.28,
                    text: "Send (${userDailyPower.toString()})",
                    onTap: (tapped) {
                      setState(() {
                        _isSending = true;
                      });
                      context
                          .read<PowerBloc>()
                          .add(PowerEventSendPower(novelId: widget.novelId));
                    })
                : SendButtonProgress(height: height * 0.8, width: width * 0.28)
          ]),
        ),
    );
  }
}
