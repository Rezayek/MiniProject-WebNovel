import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_novel_app/constants/colors.dart';


import '../../../../../services/novel_services/models/user_gift_model.dart';
import '../../../../../services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_bloc.dart';
import '../../../../../services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_state.dart';
import '../../../../../utilities/singletons/gifts_holder_singleton.dart';


class UserGiftLine extends StatefulWidget {
  final double height;
  final double width;
  final UserGiftModel gift;
  const UserGiftLine({
    super.key,
    required this.height,
    required this.width,
    required this.gift,
  });

  @override
  State<UserGiftLine> createState() => _UserGiftLineState();
}

class _UserGiftLineState extends State<UserGiftLine> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserGiftBloc, UserGiftState>(
      listener: (context, state) {
        if (state is UserGiftStateGetGifts) {
          setState(() {
            _isChecked = false;
          });
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: black,
          width: 0.0,
          style: BorderStyle.solid,
        ))),
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: widget.height * 0.8,
              width: widget.width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 1,
                        offset: const Offset(1, 1),
                        color: black.withOpacity(0.7))
                  ],
                  image: widget.gift.giftUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(widget.gift.giftUrl),
                          fit: BoxFit.fill)
                      : const DecorationImage(
                          image: AssetImage("assets/logo_app.png"),
                          fit: BoxFit.fill)),
            ),
            SizedBox(
              height: widget.height * 0.8,
              width: widget.width * 0.45,
              child: Center(
                child: Text(
                  widget.gift.giftName,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500, color: black),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Checkbox(
              value: _isChecked,
              shape: const CircleBorder(),
              onChanged: (value) {
                if (value!) {
                  if (value) {
                    GiftsHolderSingleton().addGift(widget.gift);
                    setState(() {
                      _isChecked = value;
                    });
                  } else {
                    GiftsHolderSingleton().removeGift(widget.gift);
                    setState(() {
                      _isChecked = false;
                    });
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
