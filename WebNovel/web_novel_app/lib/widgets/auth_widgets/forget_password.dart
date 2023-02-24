// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/services/Auth/auth_bloc/auth_events.dart';
import 'package:web_novel_app/utilities/dialogs/error_dialog.dart';

import '../../services/Auth/auth_bloc/auth_bloc.dart';


class ForgetPassword extends StatefulWidget {
  String email;
  ForgetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: 90.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Forget password? ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          InkWell(
              onTap: () async {
                if (widget.email.isNotEmpty) {
                  context
                      .read<AuthBloc>()
                      .add(AuthEventForgotPassword(email: widget.email));
                } else {
                  await errorDialog('Reminder', context,
                      "Please enter your email to reset your password");
                }
              },
              child: const Text("Tap here",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: lightBlue)))
        ],
      ),
    );
  }
}
