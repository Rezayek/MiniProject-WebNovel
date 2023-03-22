import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/users_gifts_bloc/users_gifts_event.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/users_gifts_bloc/users_gifts_state.dart';
import 'package:web_novel_app/services/novel_services/novels_exceptions.dart';



import '../../../../../../widgets/novel_data_widgets/gifts_power/gift/gifts_container.dart';
import '../../../../../../widgets/novel_data_widgets/gifts_power/gift_power_container_animation.dart';

import '../../../../novel_bloc.dart/gifts_bloc/users_gifts_bloc/users_gifts_bloc.dart';

class UsersGiftsController extends StatefulWidget {
  final String novelId;
  const UsersGiftsController({super.key, required this.novelId});

  @override
  State<UsersGiftsController> createState() => _UsersGiftsControllerState();
}

class _UsersGiftsControllerState extends State<UsersGiftsController> {

  //ControllerState currentState = ControllerState.loading;
  //List<GiftsModel> gifts = [];
  @override
  void initState() {
    context.read<UsersGiftsBloc>().add(UsersGiftsEventGetGifts(novelId: widget.novelId));
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersGiftsBloc, UsersGiftsState>(
      builder: (context, state) {
        if (state is UsersGiftsStateAnimation) {
          return const GiftPowerContainerAnimation();
        } else if (state is UsersGiftsStateGetGifts) {
          if (state.exception is NovelExceptionCantGetGifts) {
            return Container();
          } else {
            return GiftsContainer(
              gifts: state.gifts, novelId: widget.novelId,
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
