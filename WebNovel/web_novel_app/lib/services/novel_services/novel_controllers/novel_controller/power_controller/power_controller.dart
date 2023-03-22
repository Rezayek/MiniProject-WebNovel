import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/power_bloc/power_state.dart';
import 'package:web_novel_app/services/novel_services/novels_exceptions.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/power/power_container.dart';

import '../../../../../widgets/novel_data_widgets/gifts_power/gift_power_container_animation.dart';
import '../../../novel_bloc.dart/power_bloc/power_bloc.dart';
import '../../../novel_bloc.dart/power_bloc/power_event.dart';

class PowerController extends StatefulWidget {
  final String novelId;
  const PowerController({super.key, required this.novelId});

  @override
  State<PowerController> createState() => _PowerControllerState();
}

class _PowerControllerState extends State<PowerController> {

  @override
  void initState() {
    context.read<PowerBloc>().add(PowerEventGetPower(novelId: widget.novelId));
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PowerBloc, PowerState>(
      builder: (context, state) {
        if (state is PowerStateLoading) {
          return const GiftPowerContainerAnimation();
        } else if (state is PowerStateGetPower) {
          if (state.exception is NovelExceptionCantGetPower) {
            return Container();
          } else {
            return PowerContainer(
                novelId: widget.novelId, novelPower: state.power);
          }
        } else{
          return const GiftPowerContainerAnimation();
        }
      },
    );
  }
}
