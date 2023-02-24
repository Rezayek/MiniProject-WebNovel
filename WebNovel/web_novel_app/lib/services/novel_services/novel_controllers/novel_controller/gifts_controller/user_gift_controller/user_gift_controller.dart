import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_bloc.dart';
import '../../../../../../widgets/novel_data_widgets/gifts_power/gift/send_gift_widget/send_gift_list.dart';
import '../../../../novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_event.dart';
import '../../../../novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_state.dart';
import '../../../../novels_exceptions.dart';

class UserGiftContoller extends StatefulWidget {
  final String novelId;
  const UserGiftContoller({super.key, required this.novelId});

  @override
  State<UserGiftContoller> createState() => _UserGiftContollerState();
}

class _UserGiftContollerState extends State<UserGiftContoller> {
  @override
  void initState() {
    context.read<UserGiftBloc>().add(UserGiftEventGetGifts(novelId: widget.novelId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGiftBloc, UserGiftState>(
      builder: (context, state) {
        if (state is UserGiftStateGetGifts) {
          if (state.exception is NovelExceptionCantGetGifts) {
            return Container();
          } else {
            return SendGiftList(
              height: 40.h,
              width: 100.w,
              gifts: state.gifts,
              novelId: widget.novelId,
            );
          }
        } else {
          return SizedBox(
            height: 40.h,
            width: 100.w,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
