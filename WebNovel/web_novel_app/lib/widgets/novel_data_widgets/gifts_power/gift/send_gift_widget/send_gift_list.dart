import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/services/novel_services/models/user_gift_model.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/gift/send_gift_widget/user_gift_line.dart';
import 'package:web_novel_app/widgets/novel_data_widgets/gifts_power/send_button_progress.dart';

import '../../../../../services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_bloc.dart';
import '../../../../../services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_event.dart';
import '../../../../../services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_state.dart';
import '../../../../../utilities/singletons/gifts_holder_singleton.dart';
import '../../send_button.dart';

class SendGiftList extends StatefulWidget {
  final double height;
  final double width;
  final String novelId;
  final List<UserGiftModel> gifts;
  const SendGiftList(
      {super.key,
      required this.height,
      required this.width,
      required this.gifts,
      required this.novelId});

  @override
  State<SendGiftList> createState() => _SendGiftListState();
}

class _SendGiftListState extends State<SendGiftList> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if (GiftsHolderSingleton().giftsListEmpty()) {
        _isLoading = false;
      } else {
        _isLoading = true;
      }
    });
    return BlocListener<UserGiftBloc, UserGiftState>(
      listener: (context, state) {
        if(state is UserGiftStateGetGifts){
          setState(() {
            _isLoading = false;
          });
        }
      },
      child: SizedBox(
            height: 48.h,
            width: widget.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: widget.height,
                      width: widget.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.gifts.length,
                        itemBuilder: (context, index) => UserGiftLine(
                            height: widget.height * 0.2,
                            width: widget.width * 0.8,
                            gift: widget.gifts[index]),
                      )),
                  SizedBox(
                    width: 100.w,
                    height: 8.h,
                    child: Center(
                      child: !_isLoading
                          ? SendButton(
                              height: 10.h,
                              width: 30.w,
                              text: "Send",
                              onTap: (tapped) {
                                if (tapped) {
                                  if (!GiftsHolderSingleton().giftsListEmpty()) {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    GiftsHolderSingleton().lockGifts();
                                    context.read<UserGiftBloc>().add(
                                        UserGiftEventSendGift(
                                            novelId: widget.novelId));
                                  }
                                }
                              },
                            )
                          : SendButtonProgress(
                              height: 10.h,
                              width: 30.w),
                    ),
                  )
                ])),
    );
  }
}
