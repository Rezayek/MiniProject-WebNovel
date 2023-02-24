// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/utilities/dialogs/terms_dialog.dart';

import '../../constants/colors.dart';
import '../../views/auth_views/sign_up_view.dart';

class UserTermsLine extends StatefulWidget {
  const UserTermsLine({Key? key}) : super(key: key);

  @override
  State<UserTermsLine> createState() => _UserTermsLineState();
}

class _UserTermsLineState extends State<UserTermsLine> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      width: 80.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(65)),
              child: Checkbox(
                  value: SignUpView.isChecked,
                  shape: const CircleBorder(),
                  onChanged: (value) {
                    setState(() {
                      SignUpView.isChecked = value!;
                    });
                  })),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text("I've read all user Terms.",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
          InkWell(
              onTap: () async {
                SignUpView.isChecked = await termsDialog(context: context);
                setState(() {
                  SignUpView.isChecked;
                });
              },
              child: const Text("Terms",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: lightBlue)))
        ],
      ),
    );
  }
}
