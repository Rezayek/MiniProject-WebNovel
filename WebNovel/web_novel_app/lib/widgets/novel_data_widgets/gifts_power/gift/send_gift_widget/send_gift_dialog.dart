import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';


import '../../../../../constants/colors.dart';
import '../../../../../services/novel_services/novel_bloc.dart/gifts_bloc/user_gift_bloc/user_gift_bloc.dart';

import '../../../../../services/novel_services/novel_controllers/novel_controller/gifts_controller/user_gift_controller/user_gift_controller.dart';
import '../../../../../services/novel_services/novel_services.dart';



typedef DialogOptions<T> = Map<String, T?> Function();

Future<T?> userGiftDialog<T>({
  required BuildContext context,
  required String novelId
}) {

  
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        titlePadding: const EdgeInsets.all(0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        backgroundColor: white,
        title: Container(
          height: 5.h,
          decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [lightBlue, lightPurple],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: const Center(
            child: Text(
              "Gifts",
              style: TextStyle(
                  color: black, fontSize: 20, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.only(top: 5),
        content: BlocProvider<UserGiftBloc>(
          create: (context) => UserGiftBloc(NovelServices()),
          child: UserGiftContoller(novelId: novelId,),
        ),
      );
    },
  );
}