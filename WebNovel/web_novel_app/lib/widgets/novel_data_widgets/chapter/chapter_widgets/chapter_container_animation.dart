import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_novel_app/constants/colors.dart';

class ChapterContainerAnimation extends StatefulWidget {
  const ChapterContainerAnimation({super.key});

  @override
  State<ChapterContainerAnimation> createState() =>
      _ChapterContainerAnimationState();
}

class _ChapterContainerAnimationState extends State<ChapterContainerAnimation>
    with TickerProviderStateMixin {
  late final List<AnimationController> _controllers = List.generate(
      15,
      (index) => AnimationController(
            duration: Duration(seconds: Random().nextInt(4) + 3),
            vsync: this,
          )..repeat(reverse: true));

  late final List<Animation<double>> _animations = List.generate(
      15,
      (index) => CurvedAnimation(
            parent: _controllers[index],
            curve: Curves.easeIn,
          ));

  @override
  void dispose() {
    for (var element in _controllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 5),
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: randomGenerator(),
        ),
      ),
    );
  }

  List<Widget> randomGenerator() {
    return List.generate(
        15, (index) => costumeContainer((Random().nextInt(50)).w + 20.w, index));
  }

  Widget costumeContainer(double width, int index) {
    return FadeTransition(
      opacity: _animations[index],
      child: Container(
        height: 5.h,
        width: width,
        decoration: BoxDecoration(
            color: black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
