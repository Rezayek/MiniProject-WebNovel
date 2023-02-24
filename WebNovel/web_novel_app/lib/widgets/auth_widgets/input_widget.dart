import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';
import 'package:web_novel_app/widgets/auth_widgets/default_border.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String inputLabel, hintText;
  final Color textColor;
  final double fontZise, borderRadius;
  final FontWeight fontWeight;
  final TextInputType textType;
  final bool isObscured;
  final List<double> paddingValues;
  const InputWidget({
    Key? key,
    required this.controller,
    required this.inputLabel,
    required this.hintText,
    required this.textColor,
    required this.fontZise,
    required this.borderRadius,
    required this.fontWeight,
    required this.textType,
    required this.isObscured,
    required this.paddingValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 10.h,
        width: 94.w,
        child: Stack(
          children: [
            Positioned(
              top: 1.5.h,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  DefaultBorder(borderRadius: borderRadius, height: 7.5.h, width: 92.w),
                  Container(
                    height: 7.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: paddingValues[0],
                            left: paddingValues[1],
                            right: paddingValues[2],
                            bottom: paddingValues[3]),
                        child: TextFormField(
                          controller: controller,
                          style: TextStyle(
                              color: textColor,
                              fontSize: fontZise,
                              fontWeight: fontWeight),
                          autocorrect: false,
                          obscureText: isObscured,
                          keyboardType: textType,
                          enableSuggestions: false,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: hintText,
                              hintStyle: const TextStyle(
                                color: black,
                                fontWeight: FontWeight.w500,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 6.w,
              child: Container(
                width: inputLabel.length * 11,
                height: 30,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(borderRadius - 5)),
                child: Center(
                    child: Text(inputLabel,
                        style: TextStyle(
                            fontSize: fontZise, fontWeight: fontWeight))),
              ),
            )
          ],
        ));
  }
}
