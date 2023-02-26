import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class CurrencyHolder extends StatelessWidget {
  final IconData icon;
  final int qte;
  const CurrencyHolder({Key? key, required this.icon, required this.qte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 22.w,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 1.5, offset: const Offset(1, 1), color: black.withOpacity(0.7))],
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(colors: [
          lightPurple,
          lightBlue
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(qte.toString(), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: black),),
          Icon(icon,color: black, size: 25,)
        ],
      ),
    );
  }
}
